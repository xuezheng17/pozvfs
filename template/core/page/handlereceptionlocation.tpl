function HandleReceptionLocation(gui, operater, now, options) {
  this._gui = gui;
  this._source = operater;
  this._now = now;
  this._options = options;
    
  this._createElements();
};

HandleReceptionLocation.prototype._createElements = function() {
  this._loadData();
};

HandleReceptionLocation.prototype._loadData = function() {
  this._reception = null;
  this._retrieveReception();
};

HandleReceptionLocation.prototype._verifyData = function() {
  if (this._reception) {
    this._updateElements();
  }
};

HandleReceptionLocation.prototype._retrieveReception = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('ireception', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._reception = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                   _self._verifyData.call(_self);
                                                                                                                                 }, null);
  } else {
    this._reception = ireception.instance();
    this._verifyData();
  }
};

HandleReceptionLocation.prototype._updateElements = function() {
  var _self = this;

  this._gui.name.value = this._reception.name;
  this._gui.name.onchange = function() { _self._reception.name = this.value; };
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { if (_self._reception.name == '') { 
                                          window.alert('名称不能为空'); 
                                        } else { 
                                          new RequestUtils()._write('ireception', [_self._reception], [], function() { location.href = '?t=receptionlocations&m=' + MiscUtils.encode({ a: 4, b: 5 }); }, null); };
                                        }
  this._gui.back.onclick = function() { history.back(); };
};

