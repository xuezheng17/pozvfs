function HandleSignIn(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._createElements();
};

HandleSignIn.prototype._createElements = function() {
  var _self = this;
  this._gui.login.onclick = function () { new RequestUtils()._custom('login', { account: _self._gui.account.value, password: _self._gui.password.value }, function(result, params) { if (result) { location.href = '?t=visitors&m=' + MiscUtils.encode({a: 1, b: 1}); } }, { pos: DOMUtils.findPos(this) }); };
};