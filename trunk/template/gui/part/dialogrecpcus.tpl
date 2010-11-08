function DialogRecpCus(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractDialogRecpCus.gui(this._unique, this._doc);
};

DialogRecpCus.prototype._createElements = function() {
  var gui, input, table, tr, td, _self = this;
  
  table = document.createElement('table');
  table.style.width = '350px';
  table.style.height = '200px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  table.style.margin = '8px 8px 0';
  table.border=0;
  this._container.appendChild(table);
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.textAlign = 'center';
  td.style.width = '350px';
  td.style.height = '30px';
  td.style.fontWeight = 'bold';
  td.id =  this._unique + '_title_div';
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.verticalAlign = 'top';
  td.style.textAlign = 'center';
  td.style.width = '350px';
  td.style.height = '170px';
   var table1 = document.createElement('table');
   table1.cellPadding = 0;
   table1.cellSpacing = 0;
   table1.style.width = '350px';
   table1.style.height = '100px';
   table1.id =  this._unique + '_main_table';
   table1.style.certicalAlign = 'top';
   td.appendChild(table1);
};
