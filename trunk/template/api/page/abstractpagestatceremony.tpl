function AbstractPageStatCeremony() {
};

AbstractPageStatCeremony.gui = function(unique) {
  return { search: { dateCreated: document.getElementById(unique + '_dateCreated_text'),
                     dateTo: document.getElementById(unique + '_dateTo_text'),
                     search: document.getElementById(unique + '_search_button')
                   },
           dateZone: { dateCreated: document.getElementById(unique + '_created_text'),
                       dateTo: document.getElementById(unique + '_to_text'),
                       create: document.getElementById(unique + '_create_button'),
                       result: document.getElementById(unique + '_result_table')
                     },
           ceremony: { total: document.getElementById(unique + '_total_div'),
                     ceremonyTable: document.getElementById(unique + '_main_table'),
                   }
         };
};