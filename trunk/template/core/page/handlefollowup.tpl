function HandleFollowUp(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._cont = (options && options.follow) ? options.follow : 0;
  
  this._order = '';
  if (this._cont == 1) {
    this._order = 'o.operatedDate';
    this._query = 'ASC';
  } else if (this._cont == 2) {
    this._order = 'v.weddingday';
    this._query = 'ASC';
  } else if (this._cont == 3) {
    this._order = ' COUNT(o.e_oid) ';
    this._query = 'ASC';
    this._con = ' Group By v.e_oid';
  } else if (this._cont == 4) {
    this._cont = "v.firstVisitMethod = Visit OR (o.operateType.substring(0, o.operateType.indexOf(' ('))).toLowerCase() == 'visit'";
  } else if (this._cont == 5) {
    this._cont = "v.firstVisitMethod != Visit OR (o.operateType.substring(0, o.operateType.indexOf(' ('))).toLowerCase() != 'visit'";
  }
  
  this._createElements();
}

HandleFollowUp.prototype._createElements = function() {
  this._gui.visitors.appendChild(DOMUtils.getLoadingImage());
  
  if (this._cont != 4 || this._cont != 5) {
    this._gui.sort.options[this._gui.sort.options.length] = new Option('');
    for (var i = 0, il = SortMethod.array().length; i < il; i++) {
      var method = SortMethod.array()[i];
      var option = new Option(method);
      this._gui.sort.options[this._gui.sort.options.length] = option;
      if (option.text == this._query) {
        this._gui.sort.selectedIndex = this._gui.sort.options.length - 1;
      }
    }
    this._gui.sort.onchange = function() { _self._query = this.options[this.selectedIndex].text; _self._createElements(); };
  } else {
    this._gui.sort.style.display = 'none';
  }
  
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
  var args = '&c=LEFT JOIN np_Operation AS o ON o.visitId = v.e_oid WHERE v.status = 0' + ((this._con) ? this._con : '')  + '&p=' + page + '&s={{$smarty.const.SIZE|escape:'javascript'}}' + '&o=' + ((this._order) ? this._order : '' ) + '&q=' + ((this._query) ? this._query : '');
  new RequestUtils()._mysql('followUp', args, function(result, params) { _self._visitors = result.data;
                                                                         _self._parameters = result;
                                                                         _self._verifyData.call(_self);
                                                                       }, null);
};

HandleFollowUp.prototype._updateElements = function() {
  var unique, _self = this;
  DOMUtils.removeChildElements(this._gui.page);
  DOMUtils.removeChildElements(this._gui.visitors);
  if (this._parameters.total > this._parameters.size) {
    new ModulePagination(document, this._gui.page, 500, 50, this._operator, this._now, {page: this._parameters.page, total: this._parameters.total, limit: this._parameters.size, callbackFunc: function(page, condition) { _self._retrieveVisitors.call(_self, page, _self._parameters.condition); }, context: this});
  }
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
  
  for (var i = 0, il = this._visitors.length; i < il; i++) {
    var tmp = this._visitors[i];
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    new ModuleVisitorResult(document, td, 980, 60, this._operator, this._now, { item: tmp, menu: 3, cont: this._cont } );
  }
};
