function Pagination(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractPagination.gui(this._unique, this._doc);
}

Pagination.prototype._createElements = function() {
  var table, tr, td, input;
  table= this._doc.createElement('table');
  table.style.width = '555px';
  table.style.height = '22px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
//  table.border=1
  table.style.textAlign = 'center';
  this._container.appendChild(table);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '43px';
  td.style.fontSize = '11pt';
  td.style.fontFamily= 'Arial';
  td.style.fontWeight = 'bold';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.paddingBottom = '3px';
  td.appendChild(this._doc.createTextNode('Items:'));
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '37px';
  td.style.textAlign = 'left';
  td.style.fontSize = '11pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingBottom = '3px';
  td.style.verticalAlign = 'bottom';
  td.id = this._unique + '_items_div';
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '50px';
  td.style.textAlign = 'left';
  td.style.fontSize = '11pt';
  td.style.fontFamily= 'Arial';
  td.style.fontWeight = 'bold';
  td.style.paddingBottom = '3px';
  td.style.verticalAlign = 'bottom';
  td.appendChild(this._doc.createTextNode('Pages:'));
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '31px';
  td.style.textAlign = 'left';
  td.style.fontSize = '11pt';
  td.style.paddingBottom = '3px';
  td.style.fontFamily= 'Arial';
  td.style.verticalAlign = 'bottom';
  td.id = this._unique + '_pages_div';
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '46px';
  td.style.textAlign = 'right';
  var btn1 = document.createElement("input");
  btn1.id = this._unique + '_previous_button';
  btn1.type = 'button';
  btn1.style.fontSize = '10pt';
  btn1.style.fontFamily= 'Arial';
  btn1.value = 'Back';
  td.appendChild(btn1);
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '15px';
  td.style.textAlign = 'center';
  td.style.fontSize = '11pt';
  td.style.fontFamily= 'Arial';
  td.id = this._unique + '_numbers_div';
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '46px';
  td.style.textAlign = 'left';
  var btn2 = DOMUtils.createInput('', '', 'button', 'Next', null)
  btn2.id = this._unique + '_next_button';
  btn2.style.fontFamily= 'Arial'
  btn2.style.fontSize = '10pt';
  td.appendChild(btn2);
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '64px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'middle'
  var input = DOMUtils.createInput('', '', 'text', '', null)
  input.id = this._unique + '_page_input';
  input.style.width = '52px';
  input.style.height = '15px';
  td.appendChild(input);
  
  td = tr.insertCell(-1);
  td.style.height = '22px';
  td.style.width = '46px';
  td.style.textAlign = 'left';
  var btn3 = document.createElement("input");
  btn3.id = this._unique + '_jump_button';
  btn3.type = 'button';
  btn3.style.fontSize = '10pt';
  btn3.style.fontFamily= 'Arial';
  btn3.value = 'Jump';
  td.appendChild(btn3);
};