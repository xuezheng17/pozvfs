function HandleSource(gui, operater, now, options) {
  this._gui = gui;
  this._source = operater;
  this._now = now;
  this._options = options;
    
  this._createElements();
};

HandleSource.prototype._createElements = function() {
  this._loadData();
};

HandleSource.prototype._loadData = function() {
  this._source = null;
  this._retrieveSource();
};

HandleSource.prototype._verifyData = function() {
  if (this._source) {
    this._updateElements();
  }
};

HandleSource.prototype._retrieveSource = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('isource', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._source = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                _self._verifyData.call(_self);
                                                                                                                              }, null);
  } else {
    this._source = ISource.instance();
    this._verifyData();
  }
};

HandleSource.prototype._updateElements = function() {
  var _self = this;

  this._gui.name.value = this._source.name;
  this._gui.name.onchange = function() { _self._source.name = this.value; };
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { if (_self._source.name == '') { 
                                          window.alert('名称不能为空'); 
                                        } else { 
                                          new RequestUtils()._write('isource', [_self._source], [], function() { location.href = '?t=sources&m=' + MiscUtils.encode({ a: 4, b: 6 }); }, null); };
                                        }
  this._gui.back.onclick = function() { history.back(); };
};

