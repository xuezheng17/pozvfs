function DialogSignIn(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractDialogSignIn.gui(this._unique, this._doc);
};

DialogSignIn.prototype._createElements = function() {
  var gui, input, table, tr, td, _self = this;
  table = document.createElement('table');
  table.style.width = '400px';
  table.style.height = '250px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._container.appendChild(table);
  
  tr=table.insertRow(-1);
  td=tr.insertCell(-1);
  td.colSpan = 2;
  td.style.textAlign = 'left';
  td.style.hight= '30px';
  
  tr=table.insertRow(-1);
  td=tr.insertCell(-1);
  td.style.hight = '100px';
  td.style.width = '120px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.appendChild(this._doc.createTextNode('Account:'));
  td=tr.insertCell(-1);
  td.style.hight = '100px';
  td.style.width = '280px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  var input1 = DOMUtils.createInput('', '', 'text', '', null)
  input1.id = this._unique + '_account_input';
  input1.style.width = '150px';
  input1.style.height = '15px';
  td.appendChild(input1);
  
  tr=table.insertRow(-1);
  td=tr.insertCell(-1);
  td.style.hight = '30px';
  td.style.width = '120px';
  td.style.textAlign = 'right';
  td.appendChild(this._doc.createTextNode('Password:'));
  td=tr.insertCell(-1);
  td.style.hight = '30px';
  td.style.width = '280px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'middle';
  var input2 = DOMUtils.createInput('', '', 'text', '', null)
  input2.id = this._unique + '_password_input';
  input2.style.width = '150px';
  input2.style.height = '15px';
  td.appendChild(input2);
  
  tr=table.insertRow(-1);
  td=tr.insertCell(-1);
  td.style.hight = '100px';
  td.style.width = '30px';
  td.colSpan = 2;
  td.style.textAlign = 'right';
  td.style.paddingRight = '130px';
  var btn = DOMUtils.createInput('', '', 'button', 'Login', null)
  btn.id = this._unique + '_login_button';
  btn.style.fontFamily= 'Arial'
  btn.style.fontSize = '9pt';
  td.appendChild(btn);
  
  tr=table.insertRow(-1);
  td=tr.insertCell(-1);
  td.style.hight = '60px';
  td.style.width = '400px';
};