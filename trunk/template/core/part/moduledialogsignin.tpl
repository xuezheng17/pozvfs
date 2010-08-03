function ModuleDialogSignIn(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._callbackFunc = (options && options.callbackFunc) ? options.callbackFunc : null;
  this._popupBox = (options && options.popupBox) ? options.popupBox : null;
  this._pos = (options && options.pos) ? options.pos : null;
  this._createElements();
};

ModuleDialogSignIn.prototype._createElements = function() {
  var _self = this;
  this._gui = new DialogSignIn(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  this._gui.login.onclick = function() { new RequestUtils()._custom('login', { account: _self._gui.account.value, password: _self._gui.password.value }, function(result, params) { if (result.type) {
                                                                                                                                                                                                                        if (result.type == '{{$smarty.const.USER_TYPE_MANAGER_ASSISTANT|escape:javascript}}' || result.type == '{{$smarty.const.USER_TYPE_CUSTOMER_SERVICE|escape:javascript}}') {
                                                                                                                                                                                                                          _self._callbackFunc();
                                                                                                                                                                                                                          _self._popupBox._close();
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                          window.alert('User Restricted');
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      } else {
                                                                                                                                                                                                                        window.alert('Incorrect Account and/or Password');
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }, {php: '../dms1/customphp/jsoncustom.php', pos: DOMUtils.findPos(this) });
                                    };
//  this._gui.cancel.onclick = function() { _self._popupBox._close(); };
};