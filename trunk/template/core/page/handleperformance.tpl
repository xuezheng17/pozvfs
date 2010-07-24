function HandlePerformance(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
}

HandlePerformance.prototype._createElements = function() {
  this._loadData();
};

HandlePerformance.prototype._loadData = function() {
  this._visitors = null;
  this._retrieveVisitors();
};

HandlePerformance.prototype._verifyData = function() {
  if (this._visitors) {
    this._updateElements();
  }
};

HandlePerformance.prototype._retrieveVisitors = function() { 
  var _self = this;
  new RequestUtils()._mysql('performance', '&s=99999', function(result, params) { _self._visitors = result.data[0];
                                                                          _self._verifyData.call(_self);
                                                                        }, null);
};

HandlePerformance.prototype._updateElements = function() {
  var unique, _self = this;
  POZVFSUtils.clear(this._gui);
  
  this._gui.visitors.appendChild(document.createTextNode(this._visitors.visitors));
  this._gui.eVisitor.appendChild(document.createTextNode((this._visitors.visitors == 0) ? '0%' : ((this._visitors.eVisitors / this._visitors.visitors) * 100).toFixed(0) + '%'));
  this._gui.eSucVisitor.appendChild(document.createTextNode((this._visitors.eVisitors == 0) ? '0%' : ((this._visitors.eSucVisitors / this._visitors.eVisitors) * 100).toFixed(0) + '%'));
  this._gui.pVisitor.appendChild(document.createTextNode((this._visitors.visitors == 0) ? '0%' : ((this._visitors.pVisitors / this._visitors.visitors) * 100).toFixed(0) + '%'));
  this._gui.pSucVisitor.appendChild(document.createTextNode((this._visitors.pVisitors == 0) ? '0%' : ((this._visitors.pSucVisitors / this._visitors.pVisitors) * 100).toFixed(0) + '%'));
  this._gui.cVisitor.appendChild(document.createTextNode((this._visitors.visitors == 0) ? '0%' : ((this._visitors.customers / this._visitors.visitors) * 100).toFixed(0) + '%'));
  this._gui.total.appendChild(document.createTextNode(((this._visitors.eVisitors + this._visitors.pVisitors + this._visitors.vVisitors) == 0) ? '0%' : ((this._visitors.customers / (this._visitors.eVisitors + this._visitors.pVisitors + this._visitors.vVisitors)) * 100).toFixed(0) + '%'));
};
