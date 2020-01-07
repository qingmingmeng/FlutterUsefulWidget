//订阅者回调签名
typedef void EventCallBack(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = Map<Object, List<EventCallBack>>();

  //添加订阅者
  void add(eventName, EventCallBack callback){
    if(null == eventName || null == callback) return;
    _emap[eventName]??= List<EventCallBack>();
    _emap[eventName].add(callback);
  }

  //移除订阅者
  void remove(eventName, [EventCallBack callBack]){
    var list = _emap[eventName];
    if(null == eventName || null == list) return;
    if(null == callBack){
      _emap[eventName] = null;
    } else {
      list.remove(callBack);
    }
  }

  //发布事件，所有订阅者都可接收到
  void push(eventName, [arg]){
    var list = _emap[eventName];
    if(null == list) return;
    int len = list.length - 1;
    //反向遍历，防止有的订阅者在回调中移除订阅导致下标错位
    for(int i = len ; i > -1 ; i++){
      list[i](arg);
    }
  }
}

//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var bus = EventBus();