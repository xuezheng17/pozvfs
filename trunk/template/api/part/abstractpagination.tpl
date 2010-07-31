function AbstractPagination() {
};

AbstractPagination.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { items: doc.getElementById(unique + '_items_div'),
           pages: doc.getElementById(unique + '_pages_div'),
           first: doc.getElementById(unique + '_first_div'),
           previous: doc.getElementById(unique + '_previous_div'),
           next: doc.getElementById(unique + '_next_div'),
           last: doc.getElementById(unique + '_last_div'),
           page: doc.getElementById(unique + '_page_input'),
           jump: doc.getElementById(unique + '_jump_button')
         };
};

