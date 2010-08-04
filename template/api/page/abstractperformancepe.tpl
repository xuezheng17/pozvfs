function AbstractPerformancePE() {
};

AbstractPerformancePE.gui = function(unique) {
  return { search: { dateFrom: document.getElementById(unique + '_dateFrom_text'),
                     dateTo: document.getElementById(unique + '_dateTo_text'),
                     search: document.getElementById(unique + '_search_button')
                   },
           mains: document.getElementById(unique + '_mains_table'),
           dateZone: { from: document.getElementById(unique + '_from_text'),
                       to: document.getElementById(unique + '_to_text'),
                       create: document.getElementById(unique + '_create_button'),
                       result: document.getElementById(unique + '_result_div')
                     }
         };
};

