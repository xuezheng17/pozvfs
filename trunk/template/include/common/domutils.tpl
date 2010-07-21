{{config_load file='npfile.conf'}}

function DOMUtils() {
};

DOMUtils.removeChildElements = function(elem) {
  while (elem && elem.firstChild) {
    elem.removeChild(elem.firstChild);
  }
};

DOMUtils.removeTableRows = function(table, rowsToKeep) {
  while (table.rows.length > rowsToKeep) {
    table.deleteRow(table.rows.length - 1);
  }
};

DOMUtils.getLoadingImage = function() {
  var img = document.createElement('img');
  img.src = '{{#loadingImage#|escape:'javascript'}}';
  return img;
};

DOMUtils.createInput = function(name, id, type, value, doc) {
  var input = (!doc) ? document.createElement('input') : doc.createElement('input');
  input.setAttribute('type', type);

  if (name !== null) {
    input.setAttribute('name', name);
  }
  if (id !== null) {
    input.setAttribute('id', id);
  }
  if (value !== null) {
    input.setAttribute('value', value);
  }

  return input;
};

DOMUtils.findPos = function(elem) {
  var curleft = 0, curtop = 0;
  if (elem.offsetParent) {
    curleft = elem.offsetLeft;
    curtop = elem.offsetTop;
    while ((elem = elem.offsetParent)) {
      curleft += elem.offsetLeft;
      curtop += elem.offsetTop;
    }
  }
  return [curleft, curtop];
};

DOMUtils.callFunc = function(func, args, context) {
  if (!func) {
    return null;
  }
  return func.apply(context || window, args || []);
};
