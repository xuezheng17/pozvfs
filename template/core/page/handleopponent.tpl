function HandleOpponent(gui, operater, now, options) {
  this._gui = gui;
  this._source = operater;
  this._now = now;
  this._options = options;
    
  this._createElements();
};

HandleOpponent.prototype._createElements = function() {
  this._loadData();
};

HandleOpponent.prototype._loadData = function() {
  this._opponent = null;
  this._retrieveOpponent();
};

HandleOpponent.prototype._verifyData = function() {
  if (this._opponent) {
    this._updateElements();
  }
};

HandleOpponent.prototype._retrieveOpponent = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('pz_iopponent', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._opponent = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                     _self._verifyData.call(_self);
                                                                                                                                   }, null);
  } else {
    this._opponent = pz_iopponent.instance();
    this._verifyData();
  }
};

HandleOpponent.prototype._updateElements = function() {
  var _self = this;

  this._gui.name.value = this._opponent.name;
  this._gui.name.onchange = function() { _self._opponent.name = this.value; };
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { if (_self._opponent.name == '') { 
                                          window.alert('名称不能为空'); 
                                        } else { 
                                          new RequestUtils()._write('pz_iopponent', [_self._opponent], [], function() { location.href = '?t=opponents&m=' + MiscUtils.encode({ a: 4, b: 7 }); }, null); };
                                        }
  this._gui.back.onclick = function() { history.back(); };
};

