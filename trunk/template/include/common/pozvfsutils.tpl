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
           id1: '',
           id2: '',
           name: '',
           name1: '',
           name2: '',
           phone: '',
           phone1: '',
           phone2: '',
           email: '',
           email1: '',
           email2: '',
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

POZVFSUtils.synchronise = function(visitor, operations, options) {
  var index = (options && options.index) ? options.index : 0;
  var opera = null;
  MiscUtils.sort(operations, ['id']);
  if (visitor.firstVisitMethod == '{{$smarty.const.Visitor_Method_Visitor|escape:javascript}}') {
    visitor.isVisited = true;
    for (var i = index, il = operations.length; i < il; i++) {
      var operation = operations[i];
      if (operation.cancelled) {
        continue;
      }
      if (operation.firstVisited) {
        operation.firstVisited = false;
        opera = operation;
      }
    }
  } else {
    for (var i = index, il = operations.length; i < il; i++) {
      var operation = operations[i];
      if (operation.cancelled) {
        continue;
      }
      var type = (operation.operateType.substring(0, operation.operateType.indexOf(' ('))).toLowerCase();
      if (type == 'visit') {
        opera = operation;
        break;
      }
    }
    if (!opera) {
      visitor.isVisited = false;
    } else {
      opera.firstVisited = true;
      visitor.isVisited = true;
    }
  }
  return { visitor: visitor,
           operation: opera
         }
};