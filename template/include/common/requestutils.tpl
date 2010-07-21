function RequestUtils() {
};

RequestUtils.prototype._read = function(name, func, condition, page, size, order, queue, callbackFunc, options) {
  var php = (options && options.php) ? options.php : Constant.READ;
  var request = new Request(this._parseRead, { method: 'POST', context: this, params: { callbackFunc: RequestUtils.callbackFunc((options) ? options.pos : null, 'Reading...', callbackFunc, (options && options.doc) ? options.doc : document), options: options } });
  request._request(php + '?name=' + MiscUtils.encrypt(name), ((func) ? '&f=' + MiscUtils.encrypt(func) : '') + ((condition) ? '&c=' + MiscUtils.encrypt(condition) : '') + ((page) ? '&p=' + MiscUtils.encrypt(page) : '') + ((size) ? '&s=' + MiscUtils.encrypt(size) : '') + ((order) ? '&o=' + MiscUtils.encrypt(order) : '') + ((queue) ? '&q=' + MiscUtils.encrypt(queue) : ''));
};

RequestUtils.prototype._parseRead = function(result, params) {
  if (params.callbackFunc) {
    params.callbackFunc(result, params);
  }
};

RequestUtils.prototype._write = function(name, objectsToAddOrUpdate, objectsToRemove, callbackFunc, options) {
  var php = (options && options.php) ? options.php : Constant.WRITE;
  var request = new Request(this._parseWrite, { method: 'POST', context: this, params: { callbackFunc: RequestUtils.callbackFunc((options) ? options.pos : null, 'Writing...', callbackFunc, (options && options.doc) ? options.doc : document), options: options } });
  request._request(php + '?name=' + MiscUtils.encrypt(name), 'o=' + MiscUtils.encode(objectsToAddOrUpdate) + '&r=' + MiscUtils.encode(objectsToRemove));
};

RequestUtils.prototype._parseWrite = function(result, params) {
  if (params.callbackFunc) {
    params.callbackFunc(result, params);
  }
};

RequestUtils.prototype._custom = function(action, args, callbackFunc, options) {
  var php = (options && options.php) ? options.php : Constant.CUSTOM;
  var request = new Request(this._parseCustom, { method: 'POST', context: this, params: { callbackFunc: RequestUtils.callbackFunc((options) ? options.pos : null, 'Waiting...', callbackFunc, (options && options.doc) ? options.doc : document), options: options } });
  request._request(php + '?action=' + MiscUtils.encrypt(action), ((args) ? 'a=' + MiscUtils.encode(args) : ''));
};

RequestUtils.prototype._parseCustom = function(result, params) {
  if (params.callbackFunc) {
    params.callbackFunc(result, params);
  }
};

RequestUtils.callbackFunc = function(pos, text, callbackFunc, doc) {
  if (pos) {
    /*--zjx0714--*/
    var tmp = new ModulePopupBoxSimple(doc, doc.body, null, null, null, null, {pos: pos});
    MiscUtils.load(tmp, text);
    return function(result, params) { callbackFunc(result, params);
                                      tmp._close();
                                    };
   /*---------*/
  } else {
    return callbackFunc;
  }
};
