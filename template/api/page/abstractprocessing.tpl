function AbstractProcessing() {
};

AbstractReceptionLocation.gui = function(unique) {
  return { groomName: document.getElementById(unique + '_groomName_button'),
           brideName: document.getElementById(unique + '_brideName_button'),
           visited: document.getElementById(unique + '_visited_button'),
           weddingDay: document.getElementById(unique + '_weddingDay_button'),
           lastUpdated: document.getElementById(unique + '_lastUpdated_button'),
           number: document.getElementById(unique + '_number_button'),
           note: document.getElementById(unique + '_note_button'),
           table: document.getElementById(unique + '_main_table'),
         };
};