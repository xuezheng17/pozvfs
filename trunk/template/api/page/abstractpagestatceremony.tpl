function AbstractPageStatCeremony() {
};

AbstractPageStatCeremony.gui = function(unique) {
  return { ceremony: { total: document.getElementById(unique + '_total_div'),
                       ceremonyTable: document.getElementById(unique + '_main_table')
                     }
         };
};
