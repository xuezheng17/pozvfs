{{*/*
  * DateSelect
  * Displays a date picker where a date can be easily chosen.
  */*}}

{{*/*
  * Constructor.
  * @param when (Object) Simple date object or null for current date
  * @param selectFunc (Function) Function to call when user selects a date
  * @param options (Property Object) Various options: container (String/Element): Id/reference of an element to append to or null to add to document. input (String/Element): Id/reference of an element to display beside. right (Boolean): Display to the right of an input box. below (Boolean): Display below an input box. auto (Boolean): Auto select today. context (Object): Caller's context reference.
  */*}}
function DateSelect(when, selectFunc, options) {
  this._selectFunc = selectFunc;
  this._selectedDate = null;
  this._lastSelectedNode = null;
  this._dateTable = null;
  this._timeTable = null;
  this._monthNames = [ 'January', 'February',
                       'March', 'April',
                       'May', 'June',
                       'July', 'August',
                       'September', 'October',
                       'November', 'December' ];
  this._dayNames = [ 'Su', 'Mo',
                     'Tu', 'We',
                     'Th', 'Fr',
                     'Sa' ];

  if (options) {
    this._container = ((typeof(options.container) == 'string') ? document.getElementById(options.container) : options.container);
    this._input = ((typeof(options.input) == 'string') ? document.getElementById(options.input) : options.input);
    this._posRight = (options.right);
    this._posBelow = (options.below);
    this._autoToday = (options.auto);
    this._showTime = (options.showTime);
    this._start = (options.start && options.start != 0) ? SimpleDate.toStamp(SimpleDate.create(SimpleDate.fromStamp(options.start).year, SimpleDate.fromStamp(options.start).month, SimpleDate.fromStamp(options.start).date)) : null;
    this._end = (options.end && options.end != 0) ? SimpleDate.toStamp(SimpleDate.create(SimpleDate.fromStamp(options.end).year, SimpleDate.fromStamp(options.end).month, SimpleDate.fromStamp(options.end).date)) : null;
    this._context = (options.context);
  }

  this._displayDate(when, (when || this._autoToday));
}

{{*/*
  * Displays a specified date.
  * @param sd Simple date object
  * @param select Select the date
  * @return false
  */*}}
DateSelect.prototype._displayDate = function(sd, select) {
  var _self = this;
  var tr, td, a, input;
  var create;

  if (select) {
    this._selectedDate = (sd) ? SimpleDate.clone(sd) : SimpleDate.create();
    DOMUtils.callFunc(this._selectFunc, [this._selectedDate], this._context);
  }

  if (!sd) {
    sd = SimpleDate.create();
  }

  if (this._showTime) {
    var minutes = ['00', '15', '30', '45'];

    if (!this._timeTable) {
      this._timeTable = document.createElement('table');
      this._timeTable.className = 'dateSelect';
      this._timeTable.style.borderBottom = 'none';
      this._timeTable.style.width = '100%';
      this._timeTable.style.margin = '0em 0em 0em 0em';
      if (this._container) {
        this._container.appendChild(this._timeTable);
      }

      tr = this._timeTable.insertRow(-1);
      td = tr.insertCell(-1);
      td.className = 'timeHeader';
      td.style.width = '6em';
      td.appendChild(document.createTextNode('Time'));

      td = tr.insertCell(-1);
      td.style.textAlign = 'right';
      this._hours = document.createElement('select');
      this._hours.onchange = function() {
          sd.hours = this.options[this.selectedIndex].text;
        };
      td.appendChild(this._hours);

      for (var i = 0; i < 24; i++) {
        this._hours.options[this._hours.options.length] = new Option(((i < 10) ? ('0' + i) : i), i);
      }

      this._minutes = document.createElement('select');
      this._minutes.onchange = function() {
          sd.minutes = this.options[this.selectedIndex].text;
        };
      td.appendChild(this._minutes);

      for (var i = 0, il = minutes.length; i < il; i++) {
        this._minutes.options[this._minutes.options.length] = new Option(minutes[i], minutes[i]);
      }
    }

    this._hours.selectedIndex = sd.hours;
    for (var i = 0, il = minutes.length, ill = (il - 1); i < il; i++) {
      var n = ((i + 1) < ill) ? (i + 1) : ill;
      var pp = minutes[i];
      var nn = minutes[n];

      if ((i == ill) && (sd.minutes >= nn)) {
        this._minutes.selectedIndex = n;
        break;
      } else if ((sd.minutes >= pp) && (sd.minutes <= nn)) {
        var mid = ((pp + nn) / 2);
        this._minutes.selectedIndex = (sd.minutes < mid) ? i : n;
        break;
      }
    }
  }
  
  if (!this._dateTable) {
    {{* /* Create the table */ *}}
    create = true;
    this._dateTable = document.createElement('table');
    this._dateTable.className = 'dateSelect';
    if (this._container) {
      this._container.appendChild(this._dateTable);
    } else {
      document.body.appendChild(this._dateTable);
    }
    
    if (this._timeTable) {
      this._dateTable.style.borderTop = 'none';
    }
    
    {{* /* Position if required */ *}}
    if (this._input) {
      var pos = DOMUtils.findPos(this._input);

      this._dateTable.style.position = 'absolute';
      if (this._posRight) {
        this._dateTable.style.left = (pos[0] + this._input.offsetWidth + 5) + 'px';
        this._dateTable.style.top = (pos[1]) + 'px';
      } else if (this._posBelow) {
        this._dateTable.style.left = (pos[0]) + 'px';
        this._dateTable.style.top = (pos[1]) + (this._input.offsetHeight + 5) + 'px';
      }
    }
    
    {{* /* Nav up */ *}}
    tr = this._dateTable.insertRow(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td.setAttribute('colSpan', 1);
    td.className = 'dateSelectNav';
    td.appendChild(document.createTextNode('\u21d1'));
    td.onclick = function() { return _self._displayDate(this._date, false); };
    this._upNav = td;
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    
    tr = this._dateTable.insertRow(-1);
    {{* /* Nav left */ *}}
    td = tr.insertCell(-1);
    td.className = 'dateSelectNav';
    td.appendChild(document.createTextNode('\u21d0'));
    td.onclick = function() { return _self._displayDate(this._date, false); };
    this._leftNav = td;

    {{* /* Month */ *}}
    td = tr.insertCell(-1);
    td.setAttribute('colSpan', 5);
    td.className = 'dateSelectMonth';
    a = document.createElement('a');
    a.setAttribute('href', '#');
    td.onclick = function() { return _self._displayDate(this._date, false) };
    a.appendChild(document.createTextNode('')); {{* /* Filled in later */ *}}
    td.appendChild(a);
    this._monthDesc = a;

    {{* /* Nav right */ *}}
    td = tr.insertCell(-1);
    td.className = 'dateSelectNav';
    td.appendChild(document.createTextNode('\u21d2'));
    td.onclick = function() { return _self._displayDate(this._date, false); };
    this._rightNav = td;

    {{* /* Nav down */ *}}
    tr = this._dateTable.insertRow(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td.setAttribute('colSpan', 1);
    td.className = 'dateSelectNav';
    td.appendChild(document.createTextNode('\u21d3'));
    td.onclick = function() { return _self._displayDate(this._date, false); };
    this._downNav = td;
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    
    {{* /* Week day title row */ *}}
    tr = this._dateTable.insertRow(-1);
    for (var i = 0; i < this._dayNames.length; i++) {
      td = tr.insertCell(-1);
      td.className = 'dateSelectDayLabel';
      td.appendChild(document.createTextNode(this._dayNames[i]));
    }

    {{* /* Currently selected */ *}}
    tr = this._dateTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.className = 'dateSelectCurrentLabel';
    td.setAttribute('colSpan', 7);
    td.appendChild(document.createTextNode(''));
    this._currentDesc = td;
    
    {{* /* Nav down down */ *}}
    tr = this._dateTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.className = 'dateSelectNav';
    td.appendChild(document.createTextNode('Clear'));
    td.onclick = function() { _self._selectedDate = null;
                              return _self._selectDate(null, null); };
    td = tr.insertCell(-1);
    td.className = 'dateSelectNav';
    td.appendChild(document.createTextNode('Cancel'));
    td.onclick = function() { return _self._selectDate(null, null); 
                            };
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
    td = tr.insertCell(-1);
  } else {
    {{* /* Remove all date rows */ *}}
    create = false;
    for (var i = 4, il = (this._dateTable.tBodies[0].rows.length - 2); i < il; i++) {
      this._dateTable.tBodies[0].deleteRow(4);
    }
  }
  
  var today = new Date();
  var first = new Date(sd.year, sd.month - 1, 1);

  {{*  /* Update nav and month title */ *}}
  this._upNav._date = SimpleDate.create(sd.year + 1, sd.month, sd.date, sd.hours, sd.minutes, sd.seconds);
  this._downNav._date = SimpleDate.create(sd.year - 1, sd.month, sd.date, sd.hours, sd.minutes, sd.seconds);
  this._leftNav._date = SimpleDate.create(sd.year, sd.month - 1, sd.date, sd.hours, sd.minutes, sd.seconds);
  this._rightNav._date = SimpleDate.create(sd.year, sd.month + 1, sd.date, sd.hours, sd.minutes, sd.seconds);
  this._monthDesc._date = SimpleDate.create(today.getFullYear(), today.getMonth() + 1, today.getDate(), sd.hours, sd.minutes, sd.seconds);
  this._monthDesc.firstChild.nodeValue = this._monthNames[first.getMonth()] + first.getFullYear();

  this._updateCurrent(this._selectedDate !== null);

  {{* /* Find the last day of the month and choose it if over range */ *}}
  var end = new Date(sd.year, sd.month, -1);
  if (sd.date > end.getDate()) {
    sd.date = end.getDate() + 1;
  }

  {{* /* Populate with dates, j is row to start inserting from */ *}}
  var i, j = 4;
  for (i = 0, il = end.getDate() + first.getDay() + 1; i < il; i++) {
    if ((i % 7) == 0) {
      tr = this._dateTable.insertRow(j++);
    }
    td = tr.insertCell(-1);
    {{* /* num is the actual date value */ *}}
    var num = (i - first.getDay() + 1);
    if (i >= first.getDay()) {
      {{* /* Show date */ *}}
      if (this._start || this._end) {
        if ((!this._start || SimpleDate.toStamp(SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num)) >= this._start) && (!this._end || SimpleDate.toStamp(SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num)) <= this._end)) {
          td.className = 'dateSelectDay';
          td._date = SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num);
          td.onclick = function() { return _self._selectDate(this, this._date); };
          td.appendChild(document.createTextNode(num));
        } else {
          td.style.textAlign = 'center';
          td.appendChild(document.createTextNode(num));
        }
      } else {
        td.className = 'dateSelectDay';
        td._date = SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num);
        td.onclick = function() { return _self._selectDate(this, this._date); };
        td.appendChild(document.createTextNode(num));
      }
      
      {{* /* If currently selected day */ *}}
      if ((num == today.getDate()) && (first.getMonth() == today.getMonth()) && (first.getFullYear() == today.getFullYear())) {
        td._today = true;
        if (this._start || this._end) {
          if ((!this._start || SimpleDate.toStamp(SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num)) >= this._start) && (!this._end || SimpleDate.toStamp(SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num)) <= this._end)) {
            td.className = 'dateSelectToday';
          } else {
            td.style.textAlign = 'center';
          }
        } else {
          td.className = 'dateSelectToday';
        }
      }
      if ((this._selectedDate !== null) && (first.getFullYear() == this._selectedDate.year) && ((first.getMonth() + 1) == this._selectedDate.month) && (num == this._selectedDate.date)) {
        this._lastSelectedNode = td;
        if (this._start || this._end) {
          if ((!this._start || SimpleDate.toStamp(SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num)) >= this._start) && (!this._end || SimpleDate.toStamp(SimpleDate.create(first.getFullYear(), (first.getMonth() + 1), num)) <= this._end)) {
            td.className = 'dateSelectSelected';
          } else {
            td.style.textAlign = 'center';
          }
        } else {
          td.className = 'dateSelectSelected';
        }
      }
    } else {
      {{* /* Padding for empty cells */ *}}
      td.className = 'dateSelectDayEmpty';
      td.appendChild(document.createTextNode(''));
    }
  }

  {{* /* Pad out rest of table with empty cells, not really required */ *}}
  while ((i % 7) != 0) {
    td = tr.insertCell(-1);
    td.className = 'dateSelectDayEmpty';
    td.appendChild(document.createTextNode(''));
    i++;
  }

  return false;
};

{{*/*
  * Process a date when it is selected.
  * @param node The node which was selected.
  * @param when The selected date
  * @return false
  */*}}
DateSelect.prototype._selectDate = function(node, when) {
  if (node) {
    {{* /* Style last selected cell as normal */ *}}
    if (this._lastSelectedNode) {
      this._lastSelectedNode.className = (!this._lastSelectedNode._today) ? 'dateSelectDay' : 'dateSelectToday';
    }

    {{* /* If date is different then select or otherwise unselect */ *}}
    if ((this._selectedDate == null) || ((when !== null) && ((this._selectedDate.year != when.year) || (this._selectedDate.month != when.month) || (this._selectedDate.date != when.date)))) {
      this._selectedDate = when;
      this._updateCurrent(true);

      node.className = 'dateSelectSelected';
      this._lastSelectedNode = node;

    }
  }

  if (this._hours && this._minutes) {
    var hours = (this._hours.selectedIndex > 0) ? this._hours.options[this._hours.selectedIndex].value : 0;
    var minutes = (this._minutes.selectedIndex > 0) ? this._minutes.options[this._minutes.selectedIndex].value : 0;

    if (this._selectedDate) {
      this._selectedDate.hours = hours;
      this._selectedDate.minutes = minutes;
    }

    if (this._leftNav._date) {
      this._leftNav._date.hours = hours;
      this._leftNav._date.minutes = minutes;
    }

    if (this._rightNav._date) {
      this._rightNav._date.hours = hours;
      this._rightNav._date.minutes = minutes;
    }

    if (this._monthDesc._date) {
      this._monthDesc._date.hours = hours;
      this._monthDesc._date.minutes = minutes;
    }
  }

  {{* /* Call user supplied function */ *}}
  if (this._selectFunc) {
    if (this._context) {
      this._selectFunc.call(this._context, this._selectedDate);
    } else {
      this._selectFunc(this._selectedDate);
    }
  }

  return false;
};

{{*/*
  * Updates the display of current date.
  * @param sel If there is a date selected
  */*}}
DateSelect.prototype._updateCurrent = function(sel) {
  if (sel && this._selectedDate) {
    this._currentDesc.firstChild.nodeValue = 'Selected: ' + this._selectedDate.date + this._monthNames[this._selectedDate.month - 1] + this._selectedDate.year;
  } else {
    this._currentDesc.firstChild.nodeValue = '(None selected)';
  }
};


