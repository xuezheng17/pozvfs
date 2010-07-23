function AbstractPerformance() {
};

AbstractPerformance.gui = function(unique) {
  return { visitors: document.getElementById(unique + '_visitors_div'),
           eVisitor: document.getElementById(unique + '_eVisitor_div'),
           eSucVisitor: document.getElementById(unique + '_eSucVisitor_div'),
           pVisitor: document.getElementById(unique + '_pVisitor_div'),
           pSucVisitor: document.getElementById(unique + '_pSucVisitor_div'),
           cVisitor: document.getElementById(unique + '_cVisitor_div'),
           total: document.getElementById(unique + '_total_div')
         };
};

