function AbstractPageStatReception() {
};

AbstractPageStatReception.gui = function(unique) {
  return { reception: { total: document.getElementById(unique + '_total_div'),
                        receptionTable: document.getElementById(unique + '_main_table')
                      }
         };
};
