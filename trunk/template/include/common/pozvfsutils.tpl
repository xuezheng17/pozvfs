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

POZVFSUtils.search = function() {
  return { id: '',
           name: '',
           phone: '',
           email: '',
           weddingDayFrom: null,
           weddingDayTo: null,
           createdDateFrom: null,
           createdDateTo: null,
           inProgressingOnly: false
         };
};