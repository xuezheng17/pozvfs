function HandleFollowUp(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._cont = (options && options.follow) ? options.follow : 0;
  
  this._createElements();
}

HandleFollowUp.prototype._createElements = function() {
  this._gui.visitors.appendChild(DOMUtils.getLoadingImage());
  this._loadData();
};

HandleFollowUp.prototype._loadData = function() {
  this._visitors = null;
  this._parameters = null;
  this._retrieveVisitors(1);
};

HandleFollowUp.prototype._verifyData = function() {
  if (this._visitors) {
    this._updateElements();
  }
};

HandleFollowUp.prototype._retrieveVisitors = function(page) { 
  var _self = this;
  var args = '&c=' + 'WHERE v.status = 0' + '&p=' + page + '&s={{$smarty.const.SIZE|escape:'javascript'}}';
  new RequestUtils()._mysql('followUp', args, function(result, params) { _self._visitors = result.data; 
                                                                         _self._parameters = result;
                                                                         _self._verifyData.call(_self);
                                                                       }, null);
};

HandleFollowUp.prototype._updateElements = function() {
  var unique, _self = this;
  DOMUtils.removeChildElements(this._gui.page);
  DOMUtils.removeChildElements(this._gui.visitors);
  Pagination.makePagedResults(this._gui.page, this._parameters.page, this._parameters.total, this._parameters.size, function(page, condition) { _self._retrieveVisitors.call(_self, page, _self._parameters.condition); }, this, document);

  var table = document.createElement('table');
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._gui.visitors.appendChild(table);
  
  if (this._visitors.length == 0) {
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode('Empty'));
  }
  
  
  if (this._cont == 1) {
    this._visitors.sort( function(left, right){ return ((left.weddingDay > right.weddingDay) ? 1 : -1) } );
  } else if (this._cont == 2) {
    this._visitors.sort( function(left, right){ return ((left.operation > right.operation) ? -1 : 1) } );
  } else if (this._cont == 3){
    this._visitors.sort( function(left, right){ return ((left.cout > right.cout) ? 1 : -1) } );
  }
  for (var i = 0, il = this._visitors.length; i < il; i++) {
    var tmp = this._visitors[i];
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    new ModuleVisitorResult(document, td, 980, 60, this._operator, this._now, { item: tmp } );
  }
};
