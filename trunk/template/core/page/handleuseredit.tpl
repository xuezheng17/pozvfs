function HandleUserEdit(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
};

HandleUserEdit.prototype._createElements = function() {
  this._loadData();
};

HandleUserEdit.prototype._loadData = function() {
  this._user = null;
  this._retrieveUser();
};

HandleUserEdit.prototype._verifyData = function() {
  if (this._user) {
    this._updateElements();
  }
};

HandleUserEdit.prototype._retrieveUser = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('user', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._user = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                             _self._verifyData.call(_self);
                                                                                                                           }, null);
  } else {
    this._user = User.instance();
    this._verifyData();
  }
};

HandleUserEdit.prototype._updateElements = function() {console.log(this._user, this._gui.account);
  var table, tr, td, _self = this;
  
  this._gui.account.value = this._user.account;
  this._gui.password.value = this._user.password;

  this._gui.account.onchange = function() { _self._user.account = this.value; };
  this._gui.password.onchange = function() { _self._user.password = this.value; };
  
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { var str = '';
                                        if (_self._user.account == '') {
                                          str += '帐号, ';
                                        }
                                        if (_self._user.password == '') {
                                          str += '密码, ';
                                        }
                                        if (_self._user.account == '' || _self._user.password == '') {
                                          window.alert(str.substring(0, str.length-2) + ' 不能为空');
                                        } else {
                                          new RequestUtils()._write('user', [_self._user], [], function() { location.href = '?t=users&m=' + JSON.stringify({ a: 4, b: 1 }); }, null); };
                                        }
};
