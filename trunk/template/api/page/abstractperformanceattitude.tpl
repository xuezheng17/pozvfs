function AbstractPerformanceAttitude() {
};

AbstractPerformanceAttitude.gui = function(unique) {
  return { search: { dateCreated: document.getElementById(unique + '_dateFrom_text'),
                     dateTo: document.getElementById(unique + '_dateTo_text'),
                     search: document.getElementById(unique + '_search_button')
                   },
           mains: document.getElementById(unique + '_mains_table'),
           dateZone: { dateCreated: document.getElementById(unique + '_from_text'),
                       dateTo: document.getElementById(unique + '_to_text'),
                       create: document.getElementById(unique + '_create_button'),
                       result: document.getElementById(unique + '_result_div')
                     }
         };
};

