function SimpleDate() {
};

SimpleDate.create = function(year, month, date, hours, minutes, seconds) {
  if (!arguments.length) {
    return this.fromDate(new Date(), false);
  }
  return { year: (year != null) ? year : 0,
           month: (month != null) ? month : 0,
           date: (date != null) ? date : 0,
           hours: (hours != null) ? hours : 0,
           minutes: (minutes != null) ? minutes : 0,
           seconds: (seconds != null) ? seconds : 0
         };
};

SimpleDate.fromDate = function(d, hasTime) {
  if (!d) {
    return this.create(0, 0, 0);
  }
  if (hasTime) {
    return this.create(d.getFullYear(), d.getMonth() + 1, d.getDate(), d.getHours(), d.getMinutes(), d.getSeconds());
  } else {
    return this.create(d.getFullYear(), d.getMonth() + 1, d.getDate());
  }
};

SimpleDate.fromStamp = function(stamp, hasTime) {
  return this.fromDate(new Date(stamp * 1000), hasTime);
};

SimpleDate.toDate = function(sd) {
  if (!sd) {
    return null;
  }
  return new Date(sd.year, sd.month - 1, sd.date, sd.hours, sd.minutes, sd.seconds);
};

SimpleDate.toStamp = function(sd) {
  if (!sd) {
    return null;
  }
  var d = this.toDate(sd);
  return (d) ? (d.getTime() / 1000) : 0;
};

SimpleDate.format = function(sd, showTime) {
  if (!sd) {
    return 'Unknown';
  }
  if (!showTime) {
    return SimpleDate.fmtDigits(sd.month) + '/' + SimpleDate.fmtDigits(sd.date) + '/' + sd.year;
  }
  return SimpleDate.fmtDigits(sd.month) + '/' + SimpleDate.fmtDigits(sd.date) + '/' + sd.year + ' ' + SimpleDate.fmtDigits(sd.hours) + ':' + SimpleDate.fmtDigits(sd.minutes);
};

SimpleDate.clone = function(sd) {
  if (!sd) {
    return null;
  }
  return SimpleDate.create(sd.year, sd.month, sd.date, sd.hours, sd.minutes, sd.seconds);
};

SimpleDate.fmtDigits = function(num) {
  num = parseInt(num, 10);
  return (num < 10) ? ('0' + num) : num;
};

SimpleDate.forward = function(sd, stamp) {
  return this.fromStamp(this.toStamp(sd) + stamp, true);
};

SimpleDate.backward = function(sd, stamp) {
  return this.fromStamp(this.toStamp(sd) - stamp, true);
};