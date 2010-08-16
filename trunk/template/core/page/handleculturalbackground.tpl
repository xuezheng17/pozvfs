function HandleCulturalBackground(gui, operater, now, options) {
  this._gui = gui;
  this._source = operater;
  this._now = now;
  this._options = options;
    
  this._createElements();
};

HandleCulturalBackground.prototype._createElements = function() {
  this._loadData();
};

HandleCulturalBackground.prototype._loadData = function() {
  this._culture = null;
  this._retrieveCulture();
};

HandleCulturalBackground.prototype._verifyData = function() {
  if (this._culture) {
    this._updateElements();
  }
};

HandleCulturalBackground.prototype._retrieveCulture = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('iculture', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._culture = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                 _self._verifyData.call(_self);
                                                                                                                               }, null);
  } else {
    this._culture = ICulture.instance();
    this._verifyData();
  }
};

HandleCulturalBackground.prototype._updateElements = function() {
  var _self = this;

  this._gui.name.value = this._culture.name;
  this._gui.name.onchange = function() { _self._culture.name = this.value; };
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { if (_self._culture.name == '') { 
                                          window.alert('名称不能为空'); 
                                        } else { 
                                          new RequestUtils()._write('iculture', [_self._culture], [], function() { location.href = '?t=culturalbackgrounds&m=' + MiscUtils.encode({ a: 4, b: 3 }); }, null); };
                                        }
  this._gui.cancel.onclick = function() { history.back(); };
};

