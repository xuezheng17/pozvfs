function NPFileUtils() {
};

NPFileUtils.duplicates = function(files, name) {
  for (var i = 0, il = files.length; i < il; i++) {
    var tmp = files[i];
    if (tmp.name == name) {
      return true;
    }
  }
  return false;
};

/*---------------zjx---05.24.2010-------------------*/
NPFileUtils.diff = function(all, selected) {
  var i = 0;
  while( i < all.length) {
    for (var j = 0, jl = selected.length; j < jl; j++) {
      if (all[i].id == selected[j].id) {
        all.splice(i, 1);
        i = 0;
      }
    }
    i++;
  }
  return all;
};


/*----------------------------------------*/

/*---限制只能输入字母和数字---*/
NPFileUtils.limitLN = function(value) {
  var re = /^[A-Za-z0-9]*$/;
  var str = '';
  if (re.test(value)){
    str = false;
  } else {
    str = true;
  }
  return str;
};

/*---限制只能输入字母和数字和小数点---*/
NPFileUtils.limitLNP = function(value) {
  var re = /^[A-Za-z0-9.]*$/;
  var str = '';
  if (re.test(value)){
    str = false;
  } else {
    str = true;
  }
  return str;
};

NPFileUtils.cutStr = function(str, len) {
  var str_length = 0;
  var str_len = 0;
  str_cut = new String();
  str_len = str.length;
  for (var i = 0; i < str_len; i++) {
    var a = str.charAt(i);
    str_length++;
    if (escape(a).length > 4) {
      str_length++;
    }
    if (str_length > len) {
      str_cut = str_cut.concat("...");
      return str_cut;
    }
    str_cut = str_cut.concat(a);
  }
  if (str_length <= len){
    return  str;
  } 
};

NPFileUtils.sortFile = function(array) {
  var i = 0;
  var files = [];
  var folders = [];
  var mixed = [];
  while (i < array.length) {
    if (array[i].dirId) {
      folders[folders.length] = array[i];
    } else {
      files[files.length] = array[i];
    }
    i++;
  }
  mixed = folders.concat(files);
  return mixed;
};

NPFileUtils.breakWord = function(str, length) {
  var strContent = str; 
  var strTemp = '';
  while (strContent.length > length){
    strTemp += strContent.substring(0, length) + '\n'; 
    strContent = strContent.substring(length, strContent.length);
    console.log(strTemp, strContent);
  }
  strTemp += '\n' + strContent;
  return strTemp;
};
/*------------------------*/