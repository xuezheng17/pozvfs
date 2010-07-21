function MiscUtils() {
};

MiscUtils.conjunction = 1;
MiscUtils.disjunction = 2;

MiscUtils.unique = function() {
  var unique = 'u' + parseInt(new Date().getTime() * Math.random());
  return unique;
};

MiscUtils.digits = function(value, size) {
  var prefix = '';
  for (var i = 0, il = size - value.toString().length; i < il; i++) {
    prefix += '0';
  }
  return prefix + value;
};

MiscUtils.encrypt = function(str) {/**
  var result = '';
  for (i = 0, il = str.length; i < il; i++) {
    result += this.digits(str.charCodeAt(i).toString(16), 2);
  }
  return result;*/return str;
};

MiscUtils.decrypt = function(str) {/**
  var result = '';
  for (i = 0, il = str.length; i < il; i += 2) {
    result += String.fromCharCode(parseInt(str.substring(i, i + 2), 16));
  }
  return result;*/return str;
};

MiscUtils.clone = function(object) {
  return JSON.parse(JSON.stringify(object));
};

MiscUtils.encode = function(obj) {
  return MiscUtils.encrypt(JSON.stringify(obj));
};

MiscUtils.decode = function(str) {
  return JSON.parse(MiscUtils.decrypt(str));
};

MiscUtils.span = function(content) {
  span = document.createElement('span');
  var str = '';
  for (var i = 0, il = content.length; i < il; i++) {
    if (content.charAt(i) != '\n') {
      str += content.charAt(i);
    } else {
      span.appendChild(document.createTextNode(str));
      span.appendChild(document.createElement('br'));
      str = '';
    }
  }
  span.appendChild(document.createTextNode(str));
  return span
};

MiscUtils.dialog = function(popupBox, content, func1, func2, options) {
  var table, tr, td, btn;
  table = document.createElement('table');
  popupBox._gui.panel.appendChild(table);
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(content);
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.align = 'left';
  if (func1 || func2) {
    if (func1) {
      btn = DOMUtils.createInput(null, null, 'button', (options && options.ok) ? options.ok : 'OK', null);
      btn.onclick = func1;
      td.appendChild(btn);
    }
    if (func2) {
      btn = DOMUtils.createInput(null, null, 'button', (options && options.cancel) ? options.cancel : 'Cancel', null);
      btn.onclick = func2;
      td.appendChild(btn);
    }
  }
};
MiscUtils.alert = function(popupBox, text) {
  var div = document.createElement('div');
  div.appendChild(document.createTextNode(text));
  div.style.margin = '0 0 10px 0';
  MiscUtils.dialog(popupBox, div, function() { popupBox._close(); }, null);
};

MiscUtils.load = function(popupBox, text) {
  var div = document.createElement('div');
  var img = document.createElement('img');
  img.src = 'image/common/loading.gif';
  div.appendChild(img);
  div.appendChild(document.createElement('br'));
  div.appendChild(document.createTextNode(text));
  div.style.margin = '0 0 10px 0';
  MiscUtils.dialog(popupBox, div);
};

/**
 * 找出数组中的某些元素
 */
MiscUtils.find = function(array, conditions, mode) {
  mode = (mode) ? mode : MiscUtils.conjunction;
  if (mode == MiscUtils.conjunction) {
    return this.conjoin(array, conditions);
  } else if (mode == MiscUtils.disjunction) {
    return this.disjoin(array, conditions);
  } else {
    return [];
  }
  
};

/**
 * 找出数组中符合所有条件的元素
 */
MiscUtils.conjoin = function(array, conditions) {
  var result = [];
  for (var i = 0, il = array.length; i < il; i++) {
    var tmp = array[i];
    var required = true;
    for (var j = 0, jl = conditions.length; j < jl; j++) {
      var condition = conditions[j];
      var value = tmp;
      for (var k = 0, kl = condition.attrs.length; k < kl; k++) {
        var attr = condition.attrs[k];
        value = value[attr];
      }
      if (condition.unequal) {
        if (value == condition.value) {
          required = false;
        }
      } else {
        if (value != condition.value) {
          required = false;
        }
      }
    }
    if (required) {
      result[result.length] = tmp;
    }
  }
  return result;
};

/**
 * 找出数组中符合任一条件的元素
 */
MiscUtils.disjoin = function(array, conditions) {
  var result = [];
  for (var i = 0, il = array.length; i < il; i++) {
    var tmp = array[i];
    for (var j = 0, jl = conditions.length; j < jl; j++) {
      var condition = conditions[j];
      var value = tmp;
      for (var k = 0, kl = condition.attrs.length; k < kl; k++) {
        var attr = condition.attrs[k];
        value = value[attr];
      }
      if (condition.unequal) {
        if (value != condition.value) {
          result[result.length] = tmp;
        }
      } else {
        if (value == condition.value) {
          result[result.length] = tmp;
        }
      }
    }
  }
  return result;
};

/**
 * 删除数组中的某个元素
 */
MiscUtils.remove = function(array, elem, attr) {
  for (var i = 0, il = array.length; i < il; i++) {
    var tmp = array[i];
    if ((!attr && elem.id == tmp.id) || (attr && elem[attr] == tmp[attr])) {
      array.splice(i, 1);
      break;
    }
  }
  return array;
};

/**
 * 为一个数组排序（按照某个属性的名字顺序）。
 */
MiscUtils.sort = function(array, attrs) {
  var func = function(a, b) { var v1 = a, v2 = b;
                              for (var i = 0, il = attrs.length; i < il; i++) {
                                v1 = v1[attrs[i]];
                                v2 = v2[attrs[i]]
                              }
                              if (isNaN(v1) || isNaN(v2)) {
                                if (v1 && v2 && v1.toString().valueOf() > v2.toString().valueOf()) {
                                  return true;
                                }
                              } else {
                                if (v1 && v2 && parseFloat(v1, 10) > parseFloat(v2, 10)) {
                                  return true;
                                }
                              }
                              return false;
                            };
  array.sort(func);
};
