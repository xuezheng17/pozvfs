function DialogInput(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
//  this._width = (width) ? width : '100';
//  this._height = (height) ? height : '100';
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  
  this._createElements();
  this._gui = AbstractDialogInput.gui(this._unique, this._doc);
};

DialogInput.prototype._createElements = function() {
  var gui, input, table, tr, td, _self = this;
  
  table = document.createElement('table');
  table.style.width = '480px';
  table.style.height = '24px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._container.appendChild(table);
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.colSpan = 2;
  td.style.textAlign = 'center';
  input = document.createElement('textarea');
  input.id =  this._unique + '_input_text'
  input.style.width = '480px';
  input.rows = 10;
  td.appendChild(input);
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.width = '';
  td.align = 'right';
  input = DOMUtils.createInput('', '', 'button', 'Save', null);
  input.id = this._unique + '_save_button';
  td.appendChild(input);
  td = tr.insertCell(-1);
  td.style.width = '50px';
  td.align = 'right';
  input = DOMUtils.createInput('', '', 'button', 'Cancel', null);
  input.id = this._unique + '_cancel_button';
  td.appendChild(input);
};