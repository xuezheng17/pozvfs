function AbstractStatBasic() {
};

AbstractStatBasic.gui = function(unique) {
  return { search: { dateCreated: document.getElementById(unique + '_dateFrom_text'),
                     dateTo: document.getElementById(unique + '_dateTo_text'),
                     search: document.getElementById(unique + '_search_button')
                   },
           mains: { visitors: document.getElementById(unique + '_visitors_div'),
                    succeedVisitors: document.getElementById(unique + '_succeedVisitors_div'),
                    dropVisitors: document.getElementById(unique + '_dropVisitors_div'),
                    progressingVisitors: document.getElementById(unique + '_progressingVisitors_div'),
                    graphy: document.getElementById(unique + '_graphy_div')
                  },
           dateZone: { dateCreated: document.getElementById(unique + '_from_text'),
                       dateTo: document.getElementById(unique + '_to_text'),
                       create: document.getElementById(unique + '_create_button'),
                       result: document.getElementById(unique + '_result_table')
                     }
         };
};

