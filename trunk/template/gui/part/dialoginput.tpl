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
  table.border=0;
  table.style.marginTop = '3px'
  this._container.appendChild(table);
  
  if (this._options.failed) {
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '21px';
    td.style.width = '90px';
    td.style.textAlign = 'right';
    td.style.verticalAlign = 'middle';
    td.style.paddingRight = '3px';
    td.appendChild(this._doc.createTextNode('Fail Reason:'));
    td = tr.insertCell(-1);
    td.style.height = '21px';
    td.style.width = '150px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    var select = this._doc.createElement('select');
    select.id = this._unique + '_opponent_select';
    select.style.height = '21px';
    select.style.width = '150px';
    td.appendChild(select);
    td = tr.insertCell(-1);
    td.style.height = '21px';
    td.style.width = '240px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'bottom';
    var img = document.createElement('img');
    img.src = 'image/add.png';
    img.id = this._unique + '_add_button';
    img.style.cursor = 'pointer';
    td.appendChild(img);
    
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '2px';
    
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '200px';
    td.style.width = '90px';
    td.style.textAlign = 'right';
    td.style.verticalAlign = 'top';
    td.style.paddingRight = '3px';
    td.style.paddingTop = '3px';
    td.appendChild(this._doc.createTextNode('Note:'));
    td = tr.insertCell(-1);
    td.colSpan = 2;
    td.style.textAlign = 'center';
    input = document.createElement('textarea');
    input.id =  this._unique + '_input_text'
    input.style.width = '394px';
    input.rows = 10;
    td.appendChild(input);
    
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 3;
    td.style.width = '480px';
    var table2 = document.createElement('table');
    table2.style.width = '480px';
    table2.cellPadding = 0;
    table2.cellSpacing = 0;
    td.appendChild(table2);
    
    tr = table2.insertRow(-1);
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
  } else {
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    input = document.createElement('textarea');
    input.id =  this._unique + '_input_text'
    input.style.width = '480px';
    input.rows = 10;
    td.appendChild(input);
    
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 3;
    td.style.width = '480px';
    var table2 = document.createElement('table');
    table2.style.width = '480px';
    table2.cellPadding = 0;
    table2.cellSpacing = 0;
    td.appendChild(table2);
    
    tr = table2.insertRow(-1);
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
  }
};