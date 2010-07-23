function DialogIObject(container, item, options) {
  this._container = container;
  this._item = item;
  this._options = options;
  
  this._createElements();
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
  
  tr = table.insertRow(-1);
  var objects = tr.insertCell(-1);
    
  tr = table.insertRow(-1);
  var object = tr.insertCell(-1);
  
  var gui = AbstractDialogIObject.instance(title, object, objects);
  new ModuleDialogIObject(gui, this._item, this._options);
};

