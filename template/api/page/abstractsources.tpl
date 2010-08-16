function AbstractSources() {
};

AbstractSources.gui = function(unique) {
  return { add: document.getElementById(unique + '_add_link'),
           mains: document.getElementById(unique + '_mains_table')
         };
};

