function AbstractPageStatCeremonyDetail() {
};

AbstractPageStatCeremonyDetail.gui = function(unique) {
  return { title: document.getElementById(unique + '_title_div'),
           mains: document.getElementById(unique + '_main_table')
         };
};
