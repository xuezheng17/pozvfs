function HandleUsers(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options
  
  this._createElements();
};

HandleUsers.prototype._createElements = function() {
  var tr, td;
  tr = this._gui.users.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._loadData();
};

HandleUsers.prototype._loadData = function() {
  this._users = null;
  this._retrieveUsers();
};

HandleUsers.prototype._verifyData = function() {
  if (this._users) {
    this._updateElements();
  }
};

HandleUsers.prototype._retrieveUsers = function() {
  var _self = this;
  new RequestUtils()._read('user', null, null, null, null, 'd.account', null, function(result, params) { _self._users = result.data;
                                                                                                         _self._verifyData.call(_self);
                                                                                                       }, null);
};

HandleUsers.prototype._updateElements = function() {
  var tr, td, _self = this;
  DOMUtils.removeTableRows(this._gui.users, 1);
  
  if (this._users.length == 0) {
    tr = this._gui.result.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 3;
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode('Empty'));
  }

  MiscUtils.sort(this._users, ['account']);
  for(var i = 0, il = this._users.length; i < il; i++) {
    var u = this._users[i];
    
    tr = this._gui.users.insertRow(-1);
    tr.backgroundColor = (i % 2 == 0) ? '#fff' : '#f8f8f8';
    td = tr.insertCell(-1);
    td.align = 'left';
    td.style.height = '24px';
    td.style.padding = '0 0 0 20px';
    var a = document.createElement('a');
    a.href = '?t=useredit&m=' + MiscUtils.encode({a: 4, b: 1}) + '&opts=' + MiscUtils.encode({id: u.id})
    a.appendChild(document.createTextNode(u.account));
    td.appendChild(a);
    
    td = tr.insertCell(-1);
    td.align = 'left';
    td.style.height = '24px';
    td.style.padding = '0 0 0 20px';
    td.appendChild(document.createTextNode(u.password));
    
    td = tr.insertCell(-1);
    td.align = 'center';
    td.style.height = '24px';
    img = document.createElement('img');
    img.src = 'image/delete.png';
    img.style.cursor = 'pointer';
    img.onclick = function() { new RequestUtils()._write('user', [], [u], function() { _self._createElements(); }, null); };
    td.appendChild(img);
  }
};
