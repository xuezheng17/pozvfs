function AbstractCeremonyLocation() {
};

AbstractCeremonyLocation.gui = function(unique) {
  return { name: document.getElementById(unique + '_name_input'),
           save: document.getElementById(unique + '_save_button'),
           back: document.getElementById(unique + '_back_button')
         };
};

