function HandleCategorys(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
};

HandleCategorys.prototype._createElements = function() {
  var _self = this, tr, td;
  tr = this._gui.mains.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._gui.add.onclick = function() { location.href = '?t=category&m=' + MiscUtils.encode({ a: 4, b: 8 }); };
  this._loadData();
};

HandleCategorys.prototype._loadData = function() {
  this._categorys = null;
  this._retrieveaCategorys();
};

HandleCategorys.prototype._verifyData = function() {
  if (this._categorys) {
    this._updateElements();
  }
};

HandleCategorys.prototype._retrieveaCategorys = function() {
  var _self = this;
  new RequestUtils()._read('pz_icategory', null, null, null, null, 'd.name', null, function(result, params) { _self._categorys = result.data;
                                                                                                           _self._verifyData.call(_self);
                                                                                                         }, null);
};

HandleCategorys.prototype._updateElements = function() {
  var tr, td, _self = this;
  DOMUtils.removeTableRows(this._gui.mains, 1);
  
  if (this._categorys.length == 0) {
    tr = this._gui.mains.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 2;
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.style.backgroundColor = '#fff';
    td.appendChild(document.createTextNode('Empty'));
  }
  
  MiscUtils.sort(this._categorys, ['name']);
  for(var i = 0, il = this._categorys.length; i < il; i++) {
    var object = this._categorys[i];
    
    tr = this._gui.mains.insertRow(-1);
    tr.style.backgroundColor = (i % 2 == 0) ? '#ffffff' : '#f8f8f8';
    td = tr.insertCell(-1);
    td.align = 'left';
    td.style.height = '24px';
    td.style.padding = '0 0 0 20px';
    var a = document.createElement('a');
    a.href = '?t=category&m=' + MiscUtils.encode({a: 4, b: 8}) + '&opts=' + MiscUtils.encode({id: object.id})
    a.appendChild(document.createTextNode((object.name.length > 40) ? object.name.substring(0, 40) + '...' : object.name));
    td.appendChild(a);
    
    td = tr.insertCell(-1);
    td.align = 'center';
    td.style.height = '24px';
    img = document.createElement('img');
    img.src = 'image/delete.png';
    img.style.cursor = 'pointer';
    img._object = object;
    img.onclick = function() { new RequestUtils()._write('pz_icategory', [], [this._object], function() { _self._createElements(); }, null); };
    td.appendChild(img);
  }
};

