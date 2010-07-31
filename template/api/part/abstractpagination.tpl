function AbstractPagination() {
};

AbstractPagination.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { items: doc.getElementById(unique + '_items_div'),
           pages: doc.getElementById(unique + '_pages_div'),
           previous: doc.getElementById(unique + '_previous_button'),
           numbers: doc.getElementById(unique + '_numbers_div'),
           next: doc.getElementById(unique + '_next_button'),
           page: doc.getElementById(unique + '_page_input'),
           jump: doc.getElementById(unique + '_jump_button')
         };
};

