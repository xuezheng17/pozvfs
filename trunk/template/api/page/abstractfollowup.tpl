function AbstractFollowUp() {
};

AbstractFollowUp.gui = function(unique) {
  return { visitors: document.getElementById(unique + '_visitors_div'),
           page: document.getElementById(unique + '_page_div'),
           sortDiv: document.getElementById(unique + '_sort_div'),
           sort: document.getElementById(unique + '_sort_select'),
           order: document.getElementById(unique + '_order_select'),
         };
};

