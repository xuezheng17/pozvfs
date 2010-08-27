function DialogHistory(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractDialogHistory.gui(this._unique, this._doc);
};

DialogHistory.prototype._createElements = function() {
  var gui, input, table, tr, td, _self = this;
  
  DOMUtils.removeChildElements(this._container);
  
  table = document.createElement('table');
  table.style.width = '500px';
  table.style.height = '25px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._container.appendChild(table);
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.width = '500px';
  td.style.height = '24px';
  td.style.textAlign = 'center';
  td.style.verticalAlign = 'middle';
  td.id = this._unique + '_title_div';
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.width = '500px';
  td.align = 'center';
  var contentTop = document.createElement('table');
  contentTop.style.backgroundColor = '#ebebe3';
  contentTop.style.width = '500px';
  contentTop.style.height = '10px';
  contentTop.cellPadding = 0;
  contentTop.cellSpacing = 0;
  td.appendChild(contentTop);
  
  var contentMiddle = document.createElement('table');
  contentMiddle.style.backgroundColor = '#ebebe3';
  contentMiddle.style.width = '500px';
  contentMiddle.cellPadding = 0;
  contentMiddle.cellSpacing = 0;
  td.appendChild(contentMiddle);
  
  tr = contentMiddle.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.width = '500px';
  var itable = document.createElement('table');
  itable.style.width = '500px';
  itable.cellPadding = 0;
  itable.cellSpacing = 0;
  itable.id = this._unique + '_mains_table';
  td.appendChild(itable);
  
  var contentBottom = document.createElement('table');
  contentBottom.style.backgroundColor = '#ebebe3';
  contentBottom.style.width = '500px';
  contentBottom.style.height = '10px';
  contentBottom.cellPadding = 0;
  contentMiddle.cellSpacing = 0;
  td.appendChild(contentBottom);
};