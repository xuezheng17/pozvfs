function VisitorResult(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractVisitorResult.gui(this._unique, this._doc);
}

VisitorResult.prototype._createElements = function() {
  var table, tr, td, input;
  table= this._doc.createElement('table');
  table.style.width = '980px';
  table.style.height = '123px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
//  table.border=1
  table.style.textAlign = 'center';
  table.style.border='solid 1px #e5ecf9';
  this._container.appendChild(table);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '980px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.paddingLeft = '18px';
  td.style.paddingBottom = '5px';
  td.style.backgroundColor = '#e5ecf9';
  td.colSpan = '5';
  var div1 = this._doc.createElement('div');
  div1.id = this._unique + '_title_div';
  td.appendChild(div1);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '120px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingRight = '6px';
  td.appendChild(this._doc.createTextNode('Bride:'));
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '212px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div2 = this._doc.createElement('div');
  div2.id = this._unique + '_brideName_div';
  td.appendChild(div2);
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '140px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingRight = '6px';
  td.appendChild(this._doc.createTextNode('Groom:'));
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '525px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div3 = this._doc.createElement('div');
  div3.id = this._unique + '_groomName_div';
  td.appendChild(div3);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '120px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingRight = '6px';
  td.appendChild(this._doc.createTextNode('Tel/Mob:'));
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '212px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div4 = this._doc.createElement('div');
  div4.id = this._unique + '_bridePhone_div';
  td.appendChild(div4);
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '140px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingRight = '6px';
  td.appendChild(this._doc.createTextNode('Tel/Mob:'));
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '525px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div5 = this._doc.createElement('div');
  div5.id = this._unique + '_groomPhone_div';
  td.appendChild(div5);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '120px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingRight = '6px';
  td.appendChild(this._doc.createTextNode('Email:'));
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '212px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div6 = this._doc.createElement('div');
  div6.id = this._unique + '_brideEmail_div';
  td.appendChild(div6);
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '140px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'bottom';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  td.style.paddingRight = '6px';
  td.appendChild(this._doc.createTextNode('Email:'));
  
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.width = '525px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'bottom';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div7 = this._doc.createElement('div');
  div7.id = this._unique + '_groomEmail_div';
  td.appendChild(div7);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '28px';
  td.style.width = '980px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'middle';
  td.colSpan = '5';
  var table1= this._doc.createElement('table');
  table1.style.width = '980px';
  table1.style.height = '28px';
//  table1.border=1;
  table1.cellPadding = 0;
  table1.cellSpacing = 0;
  td.appendChild(table1);
  
  tr1=table1.insertRow(-1);
  td = tr1.insertCell(-1);
  td.style.height = '26px';
  td.style.width = '803px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'middle';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial'
  td.appendChild(this._doc.createTextNode('Created on'));
  
  td = tr1.insertCell(-1);
  td.style.height = '26px';
  td.style.width = '68px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'middle';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial';
  var div8 = this._doc.createElement('div');
  div8.id = this._unique + '_createdDate_div';
  td.appendChild(div8);
  
  td = tr1.insertCell(-1);
  td.style.height = '26px';
  td.style.width = '28px';
  td.style.textAlign = 'right';
  td.style.verticalAlign = 'middle';
  td.style.fontWeight = 'bold';
  td.style.fontSize = '9pt';
  td.style.fontFamily= 'Arial'
  td.appendChild(this._doc.createTextNode('By'));
  
  td = tr1.insertCell(-1);
  td.style.height = '26px';
  td.style.width = '81px';
  td.style.textAlign = 'left';
  td.style.verticalAlign = 'middle';
  td.style.fontSize = '9pt';
  td.style.paddingLeft = '10px';
  td.style.fontFamily= 'Arial';
  var div9 = this._doc.createElement('div');
  div9.id = this._unique + '_author_div';
  td.appendChild(div9);
};