function HandleSignIn(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._createElements();
};

HandleSignIn.prototype._createElements = function() {
  var _self = this;
  this._gui.password.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                                if (code == 13) {
                                                  new RequestUtils()._custom('login', { account: _self._gui.account.value, password: _self._gui.password.value }, function(result, params) { if (result) { location.href = '?t=home' } }, { pos: DOMUtils.findPos(this) }); 
                                                }
                                              };
  this._gui.login.onclick = function () { new RequestUtils()._custom('login', { account: _self._gui.account.value, password: _self._gui.password.value }, function(result, params) { if (result) { location.href = '?t=home' } }, { pos: DOMUtils.findPos(this) }); };
};