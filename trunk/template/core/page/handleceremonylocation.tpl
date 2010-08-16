function HandleCeremonyLocation(gui, operater, now, options) {
  this._gui = gui;
  this._source = operater;
  this._now = now;
  this._options = options;
    
  this._createElements();
};

HandleCeremonyLocation.prototype._createElements = function() {
  this._loadData();
};

HandleCeremonyLocation.prototype._loadData = function() {
  this._ceremony = null;
  this._retrieveCeremony();
};

HandleCeremonyLocation.prototype._verifyData = function() {
  if (this._ceremony) {
    this._updateElements();
  }
};

HandleCeremonyLocation.prototype._retrieveCeremony = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('iceremony', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._ceremony = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                  _self._verifyData.call(_self);
                                                                                                                                }, null);
  } else {
    this._ceremony = ICeremony.instance();
    this._verifyData();
  }
};

HandleCeremonyLocation.prototype._updateElements = function() {
  var _self = this;

  this._gui.name.value = this._ceremony.name;
  this._gui.name.onchange = function() { _self._ceremony.name = this.value; };
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { if (_self._ceremony.name == '') { 
                                          window.alert('名称不能为空'); 
                                        } else { 
                                          new RequestUtils()._write('iceremony', [_self._ceremony], [], function() { location.href = '?t=ceremonylocations&m=' + MiscUtils.encode({ a: 4, b: 4 }); }, null); };
                                        }
  this._gui.cancel.onclick = function() { history.back(); };
};

