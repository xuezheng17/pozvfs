function HandleHome(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
}

HandleHome.prototype._createElements = function() {
  this._loadData();
};

HandleHome.prototype._loadData = function() {
  this._visitor = null;
  this._retrieveVisitor();
};

HandleHome.prototype._verifyData = function() {
  if (this._visitor) {
    this._updateElements();
  }
};

HandleHome.prototype._retrieveVisitor = function() { 
  var _self = this;
  new RequestUtils()._mysql('home', '&s=99999', function(result, params) { _self._visitor = result.data[0];
                                                                           _self._verifyData.call(_self);
                                                                         }, null);
};

HandleHome.prototype._updateElements = function() {
  var unique, _self = this;
  this._gui.visitors.appendChild(document.createTextNode(this._visitor.visitors));
  this._gui.succeedVisitors.appendChild(document.createTextNode(this._visitor.successVisitors));
  this._gui.dropVisitors.appendChild(document.createTextNode(this._visitor.dropVisitors));
  this._gui.progressingVisitors.appendChild(document.createTextNode(this._visitor.progressingVisitors));
  this._gui.deletedVisitors.appendChild(document.createTextNode(this._visitor.deletedVisitors));
  
  ChartUtils.basic(this._gui.graphy, this._visitor);
  this._time = 30;
  this._change();
};

HandleHome.prototype._change = function() {
  var _self = this;
  setTimeout( function() { _self._time-- ;
                           DOMUtils.removeChildElements(_self._gui.time);
                           _self._gui.time.appendChild(document.createTextNode(_self._time));
                           if (_self._time > 0) {
                             _self._change();
                           } else {
                             location.href = '?t=visitors&m={\"a\":1,\"b\":1}';
                           }
                         }, 1000);
  
};