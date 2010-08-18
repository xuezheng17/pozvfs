function AbstractStatistics() {
};

AbstractStatistics.gui = function(unique) {
  return { visitors: document.getElementById(unique + '_visitors_div'),
           visit: document.getElementById(unique + '_visit_div'),
           noVisit: document.getElementById(unique + '_noVisit_div'),
           graphy: document.getElementById(unique + '_graphy_div')
         };
};

