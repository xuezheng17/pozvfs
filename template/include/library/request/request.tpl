function Request(callbackFunc, options) {
  this._texthttp = null;
  this._completeFunc = callbackFunc;

  this._context = (options && options.context != null) ? options.context : null;
  this._completeParams = (options && options.params != null) ? options.params : null;
  this._timeOut = (options && options.timeout) ? options.timeout : null;

  this._paramsIsObject = (this._completeParams && (typeof(this._completeParams) == 'object'));

  this._errTimeout = -1;
  this._errLoadFailed = -2;

  var objs = [ function() { return new XMLHttpRequest(); },
               function() { return new ActiveXObject('Msxml2.XMLHTTP'); },
               function() { return new ActiveXObject('Microsoft.XMLHTTP'); } ];

  for (var i = 0; i < objs.length; i++) {
    var ob = objs[i];
    try {
      this._texthttp = ob();
      break;
    } catch (e) {
    }
  }
};

Request.prototype._request = function(uri, data) {
  if (!this._texthttp) {
    return;
  }

  if (this._timeId) {
    clearTimeout(this._timeId);
    this._timeId = null;
  }

  if (this._isBusy) {
    this._texthttp.onreadystatechange = function() { };
    this._texthttp.abort();
  }

  var _self = this;
  this._texthttp.open(((data == null) ? 'GET' : 'POST'), uri, true);

  if (this._timeOut) {
    this._timeId = setTimeout(function() { _self._onTimeout.call(_self); }, this._timeOut);
  }

  this._isBusy = true;

  if (data != null) {
    this._texthttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
  }
  this._texthttp.onreadystatechange = function() { _self._onReadyStateChange.call(_self); };
  this._texthttp.send(data);
};

Request.prototype._callComplete = function(result, code) {
  if (this._paramsIsObject) {
    this._completeParams._status = code;
  }

  if (this._context) {
    this._completeFunc.call(this._context, result, this._completeParams);
  } else {
    this._completeFunc(result, this._completeParams);
  }
};

Request.prototype._onReadyStateChange = function() {
  {{* /* States: 0 - Uninitialized, 1 - Loading, 2 - Loaded, 3 - Interactive, 4 - Complete */ *}}
  if (this._texthttp.readyState != 4) {
    return;
  }

  var result, code;

  if (this._timeId) {
    clearTimeout(this._timeId);
    this._timeId = null;
  }

  try {
    result = (this._texthttp.responseText) ? MiscUtils.decode(this._texthttp.responseText) : null;
    code = (this._texthttp.status) ? this._texthttp.status : this._errLoadFailed;
  } catch (e) {
    result = null;
    code = this._errLoadFailed;
  }

  this._texthttp.onreadystatechange = function() { };
  this._isBusy = false;

  if (!result) {
    /*--zjx0714--*/
    var pos = (this._completeParams.options) ? this._completeParams.options.pos : null;
    var tmp = new ModulePopupBoxSimple(parent.document, parent.document.body, null, null, null, null, {pos: pos});
    MiscUtils.alert(tmp, this._texthttp.responseText);
    /*----------*/
  }
  this._callComplete(result, code);
};

Request.prototype._onTimeout = function() {
  this._texthttp.onreadystatechange = function() { };
  this._texthttp.abort();

  this._isBusy = false;
  this._timeId = null;

  this._callComplete(null, this._errTimeout);
};

