function HandleStatistics(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
}

HandleStatistics.prototype._createElements = function() {
  this._loadData();
};

HandleStatistics.prototype._loadData = function() {
  this._visitor = null;
  this._retrieveVisitor();
};

HandleStatistics.prototype._verifyData = function() {
  if (this._visitor) {
    this._updateElements();
  }
};

HandleStatistics.prototype._retrieveVisitor = function() { 
  var _self = this;
  new RequestUtils()._mysql('statistics', '&s=99999', function(result, params) { _self._visitor = result.data[0];
                                                                                 _self._verifyData.call(_self);
                                                                               }, null);
};

HandleStatistics.prototype._updateElements = function() {
  var unique, _self = this;
  POZVFSUtils.clear(this._gui);
  
  this._gui.visitors.appendChild(document.createTextNode(this._visitor.visitors));
  this._gui.visit.appendChild(document.createTextNode(this._visitor.visited));
  this._gui.noVisit.appendChild(document.createTextNode(this._visitor.nonvisited));
  
  ChartUtils.statistics(this._gui.graphy, this._visitor);
  
};