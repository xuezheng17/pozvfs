function AbstractFollowUp() {
};

AbstractFollowUp.gui = function(unique) {
  return { visitors: document.getElementById(unique + '_visitors_div'),
           page: document.getElementById(unique + '_page_div')
         };
};

