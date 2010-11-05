function HandlePageStatReceptionDetail(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options

  this._createElements();
};

HandlePageStatReceptionDetail.prototype._createElements = function() {
  var _self = this;
  
  this._loadData();
};

HandlePageStatReceptionDetail.prototype._loadData = function() {
  this._results = null;
  this._retrieveResults();
};

HandlePageStatReceptionDetail.prototype._verifyData = function() {
  if (this._results) {
    this._updateElements();
  }
};

HandlePageStatReceptionDetail.prototype._retrieveResults = function() {
  var _self = this;
  var args = {cond: 'd.receptionLocation=\'' + this._options.name + '\''};
  new RequestUtils()._custom('statsreceptioncustomers', args, function(result, params) { _self._results = result;
                                                                                          _self._verifyData.call(_self);
                                                                                        }, null);
};

HandlePageStatReceptionDetail.prototype._updateElements = function() {
  var _self = this;
  DOMUtils.removeChildElements(this._gui.title);
  DOMUtils.removeTableRows(this._gui.mains, 1);
  
  this._gui.title.appendChild(document.createTextNode('CUSTOMERS IN ' + '\'' + (this._options.name).toUpperCase() + '\''));
  
  tr = this._gui.mains.insertRow(-1);
  td = tr.insertCell(-1);
  var table1 = document.createElement('table');
  table1.style.width = '70px';
  table1.style.height = '24px';
  table1.cellSpacing = 0;
  table1.cellPadding = 0;
  td.appendChild(table1);
  
  for (var i = 0, il = this._results.length; i < il; i++) {
    var result = this._results[i];
    table2 = document.createElement('table');
    table2.style.width = '70px';
    table2.style.height = '24px';
    table2.cellPadding = 0;
    table2.cellSpacing = 0;
    
    if (table1.rows.length == 0)  {
      table1.insertRow(-1).insertCell(-1).appendChild(table2);
    } else if (table1.rows[table1.rows.length - 1].cells.length < 5) {
      table1.rows[table1.rows.length - 1].insertCell(-1).appendChild(table2);
    } else {
      table1.insertRow(-1).insertCell(-1).appendChild(table2);
    }
    
    tr2 = table2.insertRow(-1);
    td2 = tr2.insertCell(-1);
    td2.style.width = '70px';
    td2.align = 'center';
    var a = document.createElement('a');
    a.href = '#';
    a._id = result;
    a.appendChild(document.createTextNode(POZVFSUtils.visitorId(result)));
    a.onclick = function() { location.href = '?t=visitorexist&m=' + JSON.stringify({a:1, b:2}) + '&opts=' + JSON.stringify({ id: this._id }); };
    td2.appendChild(a);
  }
};
