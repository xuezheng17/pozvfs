function ChartUtils() {
};

ChartUtils.basic = function(div, result) {
  var total = 0;
  
  var data = [ { name: 'Booked Customer', value: result.successVisitors },
               { name: 'Failed', value: result.dropVisitors },
               { name: 'In processing', value: result.progressingVisitors },
             ];
  
  for (var i = 0, il = data.length; i < il; i++) {
    var tmp = data[i];
    total += parseFloat(tmp.value, 10);
  }
  
  for (var i = 0, il = data.length; i < il; i++) {
    var tmp = data[i];
    tmp.displayName = tmp.name;
    tmp.name += (total == 0) ? ' 0.00％' : ' ' + parseFloat((tmp.value * 100) / total, 10).toFixed(1) + '％';
  }
  div.innerHTML = '<OBJECT><EMBED WIDTH=\"98%\" HEIGHT=\"95%\" SRC=\"myswf/basic.swf?myData=' + encodeURIComponent(JSON.stringify(data)) + '\" bgColor=\"#FFFFFF\"</EMBED></OBJECT>';
};

ChartUtils.home = function(div, result) {
  var total = 0;
  
  var data = [ { name: 'Booked Customer', value: result.successVisitors },
               { name: 'Failed', value: result.dropVisitors },
               { name: 'In processing', value: result.progressingVisitors },
               { name: 'Deleted', value: result.deletedVisitors },
             ];
  
  for (var i = 0, il = data.length; i < il; i++) {
    var tmp = data[i];
    total += parseFloat(tmp.value, 10);
  }
  
  for (var i = 0, il = data.length; i < il; i++) {
    var tmp = data[i];
    tmp.displayName = tmp.name;
    tmp.name += (total == 0) ? ' 0.00％' : ' ' + parseFloat((tmp.value * 100) / total, 10).toFixed(1) + '％';
  }
  div.innerHTML = '<OBJECT><EMBED WIDTH=\"98%\" HEIGHT=\"95%\" SRC=\"myswf/basic.swf?myData=' + encodeURIComponent(JSON.stringify(data)) + '\" bgColor=\"#FFFFFF\"</EMBED></OBJECT>';
};

ChartUtils.statistics = function(div, result) {
  var total = 0;
  
  var data = [ { name: 'Visited', value: result.visited },
               { name: 'No Visited', value: result.nonvisited },
             ];
  
  for (var i = 0, il = data.length; i < il; i++) {
    var tmp = data[i];
    total += parseFloat(tmp.value, 10);
  }
  
  for (var i = 0, il = data.length; i < il; i++) {
    var tmp = data[i];
    tmp.displayName = tmp.name;
    tmp.name += (total == 0) ? ' 0.00％' : ' ' + parseFloat((tmp.value * 100) / total, 10).toFixed(1) + '％';
  }
  div.innerHTML = '<OBJECT><EMBED WIDTH=\"98%\" HEIGHT=\"95%\" SRC=\"myswf/basic.swf?myData=' + encodeURIComponent(JSON.stringify(data)) + '\" bgColor=\"#FFFFFF\"</EMBED></OBJECT>';
};