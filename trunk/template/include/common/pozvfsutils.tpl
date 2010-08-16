function POZVFSUtils() {
};

/**
 * 清理界面对象
 */
POZVFSUtils.clear = function(gui) {
  for (key in gui) {
    var elem = gui[key];
    if (!elem) {
      continue;
    }
    if (elem.constructor.toString().indexOf('Array') == -1 && elem.constructor.toString().indexOf('Object') == -1) {
      if (!elem._protected) {
        DOMUtils.removeChildElements(elem);
      }
    } else {
      this.clear(elem);
    }
  }
};
/**
 * Visitor编号
 */
POZVFSUtils.visitorId = function(visitorId) {
  if (visitorId < 10000 && visitorId >= 1000) {
    visitorId = visitorId;
  } else if (visitorId < 1000 && visitorId >= 100) {
    visitorId = '0' + visitorId;
  }if (visitorId < 100 && visitorId >= 10) {
    visitorId = '00' + visitorId;
  }if (visitorId < 10 && visitorId > 0) {
    visitorId = '000' + visitorId;
  }
  return visitorId;
};

/**
 * 判断是否是数字
 */
POZVFSUtils.isNum = function(value) {
  var type = "^[0-9]*[1-9][0-9]*$";
  var re = new RegExp(type);
  if(value.match(re) != null) {
    return true;
  } else {
    return false;
  }
};

POZVFSUtils.search = function() {
  return { id: '',
           name: '',
           phone: '',
           email: '',
           weddingDayFrom: null,
           weddingDayTo: null,
           createdDateFrom: null,
           createdDateTo: null,
           inProgressingOnly: true,
           succeeded: true,
           failed: true,
           deleted: true
         };
};