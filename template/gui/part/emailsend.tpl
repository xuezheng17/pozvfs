function EmailSend(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractEmailSend.gui(this._unique, this._doc);
}

EmailSend.prototype._createElements = function() {
  var table, tr, td, input;
    table= this._doc.createElement('table');
    table.style.width = '580px';
    table.style.height = '80px';
    table.cellPadding = 0;
    table.cellSpacing = 0;
//    table.border=1
    table.style.textAlign = 'center';
    table.style.border='solid 1px #e5ecf9';
    this._container.appendChild(table);
    
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '50px';
    td.style.width = '580px';
    td.style.textAlign = 'left';
    td.colSpan='2';
    td.style.verticalAlign = 'middle';
    var div1 = this._doc.createElement('div');
    div1.id = this._unique + '_visitorInfo_div';
    td.appendChild(div1);
    
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '30px';
    td.style.width = '75px';
    td.style.textAlign = 'right';
    td.style.verticalAlign = 'middle';
    td.style.paddingRight = '3px';
    td.appendChild(this._doc.createTextNode('Template:'));
    td = tr.insertCell(-1);
    td.style.height = '30px';
    td.style.width = '505px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    var select = this._doc.createElement('select');
    select.id = this._unique + '_template_select';
    select.style.height = '21px';
    select.style.width = '120px';
    td.appendChild(select);
    
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '20px';
    td.style.width = '75px';
    td.style.textAlign = 'right';
    td.style.paddingRight = '3px';
    td.style.verticalAlign = 'middle';
    td.appendChild(this._doc.createTextNode('Subject:'));
    td = tr.insertCell(-1);
    td.style.height = '20px';
    td.style.width = '505px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    var input = DOMUtils.createInput('', '', 'text', '', null)
    input.id = this._unique + '_subject_input';
    input.style.width = '505px';
    input.style.height = '20px';
    td.appendChild(input);
    
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '3px';
    td.style.width = '75px';
    
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '100px';
    td.style.width = '75px';
    td.style.textAlign = 'right';
    td.style.verticalAlign = 'top';
    td.style.paddingRight = '3px';
    td.appendChild(this._doc.createTextNode('Content:'));
    td = tr.insertCell(-1);
    td.style.height = '100px';
    td.style.width = '505px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    var text = this._doc.createElement('textarea');
    text.id = this._unique + '_content_input';
    text.style.width = '505px';
    text.style.height = '100px';
    td.appendChild(text);
    
    tr=table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '30px';
    td.style.width = '580px';
    td.colSpan = '2'
    var table2= this._doc.createElement('table');
    table2.style.width = '580px';
    table2.style.height = '30px';
    table2.cellPadding = 0;
    table2.cellSpacing = 0;
//    table2.border=
    td.appendChild(table2);
    
    tr2=table2.insertRow(-1);
    td = tr2.insertCell(-1);
    td.style.width = '510px';
    td.style.textAlign = 'right';
    var btn1 = document.createElement("input");
    btn1.id = this._unique + '_send_button';
    btn1.style.width = '67px';
    btn1.type = 'button';
    btn1.value = 'Send';
    td.appendChild(btn1);
    td = tr2.insertCell(-1);
    td.style.width = '75px';
    td.style.textAlign = 'left';
    var btn2 = document.createElement("input");
    btn2.id = this._unique + '_cancel_button';
    btn2.style.width = '67px';
    btn2.type = 'button';
    btn2.value = 'Cancel';
    td.appendChild(btn2);
};