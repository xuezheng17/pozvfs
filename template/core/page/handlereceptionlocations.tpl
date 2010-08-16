function HandleReceptionLocations(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
};

HandleReceptionLocations.prototype._createElements = function() {
  var _self = this, tr, td;
  tr = this._gui.mains.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._gui.add.onclick = function() { location.href = '?t=receptionlocation&m=' + MiscUtils.encode({ a: 4, b: 5 }); };
  this._loadData();
};

HandleReceptionLocations.prototype._loadData = function() {
  this._receptions = null;
  this._retrieveReceptions();
};

HandleReceptionLocations.prototype._verifyData = function() {
  if (this._receptions) {
    this._updateElements();
  }
};

HandleReceptionLocations.prototype._retrieveReceptions = function() {
  var _self = this;
  new RequestUtils()._read('ireception', null, null, null, null, 'd.name', null, function(result, params) { _self._receptions = result.data;
                                                                                                            _self._verifyData.call(_self);
                                                                                                          }, null);
};

HandleReceptionLocations.prototype._updateElements = function() {
  var tr, td, _self = this;
  DOMUtils.removeTableRows(this._gui.mains, 1);
  
  if (this._receptions.length == 0) {
    tr = this._gui.mains.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.style.backgroundColor = '#fff';
    td.appendChild(document.createTextNode('Empty'));
  }
  
  MiscUtils.sort(this._receptions, ['name']);
  for(var i = 0, il = this._receptions.length; i < il; i++) {
    var object = this._receptions[i];
    
    tr = this._gui.mains.insertRow(-1);
    tr.style.backgroundColor = (i % 2 == 0) ? '#ffffff' : '#f8f8f8';
    td = tr.insertCell(-1);
    td.align = 'left';
    td.style.height = '24px';
    td.style.padding = '0 0 0 20px';
    var a = document.createElement('a');
    a.href = '?t=receptionlocation&m=' + MiscUtils.encode({a: 4, b: 5}) + '&opts=' + MiscUtils.encode({id: object.id})
    a.appendChild(document.createTextNode(object.name));
    td.appendChild(a);
    
    td = tr.insertCell(-1);
    td.align = 'center';
    td.style.height = '24px';
    img = document.createElement('img');
    img.src = 'image/delete.png';
    img.style.cursor = 'pointer';
    img._object = object;
    img.onclick = function() { new RequestUtils()._write('ireception', [], [this._object], function() { _self._createElements(); }, null); };
    td.appendChild(img);
  }
};

