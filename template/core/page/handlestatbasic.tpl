function HandleStatBasic(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
}

HandleStatBasic.prototype._createElements = function() {
  this._loadData();
};

HandleStatBasic.prototype._loadData = function() {
  this._visitor = null;
  this._retrieveVisitor();
};

HandleStatBasic.prototype._verifyData = function() {
  if (this._visitor) {
    this._updateElements();
  }
};

HandleStatBasic.prototype._retrieveVisitor = function() { 
  var _self = this;
  new RequestUtils()._mysql('statBasic', '&s=99999', function(result, params) { _self._visitor = result.data[0];
                                                                                _self._verifyData.call(_self);
                                                                              }, null);
};

HandleStatBasic.prototype._updateElements = function() {
  var unique, _self = this;
  POZVFSUtils.clear(this._gui);
  
  this._gui.visitors.appendChild(document.createTextNode(this._visitor.visitors));
  this._gui.succeedVisitors.appendChild(document.createTextNode(this._visitor.successVisitors));
  this._gui.dropVisitors.appendChild(document.createTextNode(this._visitor.dropVisitors));
  this._gui.progressingVisitors.appendChild(document.createTextNode(this._visitor.progressingVisitors));
  
  ChartUtils.basic(this._gui.graphy, this._visitor);
  
};