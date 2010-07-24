function DialogIObject(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
//  this._width = (width) ? width : '100';
//  this._height = (height) ? height : '100';
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  
  this._createElements();
  this._gui = AbstractDialogIObject.gui(this._unique, this._doc);
  
};

DialogIObject.prototype._createElements = function() {
  var table, tr, td;
  
  table = document.createElement('table');
  this._container.appendChild(table);
  
  tr = table.insertRow(-1);
  var title = tr.insertCell(-1);
  title.style.textAlign = 'center';
  title.style.fontWeight = 'bold';
  title.style.padding = ' 0 0 10px 0';
  title.id = this._unique + '_title_div';
  
  tr = table.insertRow(-1);
  var objects = tr.insertCell(-1);
  objects.id = this._unique + '_objects_div';
    
  tr = table.insertRow(-1);
  var object = tr.insertCell(-1);
  object.id = this._unique + '_object_div';
};

