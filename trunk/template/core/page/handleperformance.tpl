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
  this._visitor = null;
  this._retrieveVisitor();
};

HandlePerformance.prototype._verifyData = function() {
  if (this._visitor) {
    this._updateElements();
  }
};

HandlePerformance.prototype._retrieveVisitor = function() { 
  var _self = this;
  new RequestUtils()._mysql('performance', '&s=99999', function(result, params) { _self._visitor = result.data[0];
                                                                                  _self._verifyData.call(_self);
                                                                                }, null);
};

HandlePerformance.prototype._updateElements = function() {
  var unique, _self = this;
  POZVFSUtils.clear(this._gui);
  
  this._gui.visitors.appendChild(document.createTextNode('0%'));
  this._gui.eVisitor.appendChild(document.createTextNode('0%'));
  this._gui.eSucVisitor.appendChild(document.createTextNode('0%'));
  this._gui.pVisitor.appendChild(document.createTextNode('0%'));
  this._gui.pSucVisitor.appendChild(document.createTextNode('0%'));
  this._gui.cVisitor.appendChild(document.createTextNode('0%'));
  this._gui.total.appendChild(document.createTextNode('0%'));
  
//  this._gui.visitors.appendChild(document.createTextNode(this._visitor.visitors));
//  this._gui.eVisitor.appendChild(document.createTextNode((this._visitor.visitors == 0) ? '0%' : ((this._visitor.eVisitors / this._visitor.visitors) * 100).toFixed(0) + '%'));
//  this._gui.eSucVisitor.appendChild(document.createTextNode((this._visitor.eVisitors == 0) ? '0%' : ((this._visitor.eSucVisitors / this._visitor.eVisitors) * 100).toFixed(0) + '%'));
//  this._gui.pVisitor.appendChild(document.createTextNode((this._visitor.visitors == 0) ? '0%' : ((this._visitor.pVisitors / this._visitor.visitors) * 100).toFixed(0) + '%'));
//  this._gui.pSucVisitor.appendChild(document.createTextNode((this._visitor.pVisitors == 0) ? '0%' : ((this._visitor.pSucVisitors / this._visitor.pVisitors) * 100).toFixed(0) + '%'));
//  this._gui.cVisitor.appendChild(document.createTextNode((this._visitor.visitors == 0) ? '0%' : ((this._visitor.customers / this._visitor.visitors) * 100).toFixed(0) + '%'));
//  this._gui.total.appendChild(document.createTextNode(((this._visitor.eVisitors + this._visitor.pVisitors + this._visitor.vVisitors) == 0) ? '0%' : ((this._visitor.customers / (this._visitor.eVisitors + this._visitor.pVisitors + this._visitor.vVisitors)) * 100).toFixed(0) + '%'));
};
