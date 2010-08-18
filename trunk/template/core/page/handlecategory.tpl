function HandleCategory(gui, operater, now, options) {
  this._gui = gui;
  this._source = operater;
  this._now = now;
  this._options = options;
    
  this._createElements();
};

HandleCategory.prototype._createElements = function() {
  this._loadData();
};

HandleCategory.prototype._loadData = function() {
  this._category = null;
  this._retrieveCategory();
};

HandleCategory.prototype._verifyData = function() {
  if (this._category) {
    this._updateElements();
  }
};

HandleCategory.prototype._retrieveCategory = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('pz_icategory', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._category = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                     _self._verifyData.call(_self);
                                                                                                                                   }, null);
  } else {
    this._category = pz_icategory.instance();
    this._verifyData();
  }
};

HandleCategory.prototype._updateElements = function() {
  var _self = this;

  this._gui.name.value = this._category.name;
  this._gui.name.onchange = function() { _self._category.name = this.value; };
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { if (_self._category.name == '') { 
                                          window.alert('名称不能为空'); 
                                        } else { 
                                          new RequestUtils()._write('pz_icategory', [_self._category], [], function() { location.href = '?t=categorys&m=' + MiscUtils.encode({ a: 4, b: 8 }); }, null); };
                                        }
  this._gui.back.onclick = function() { history.back(); };
};

