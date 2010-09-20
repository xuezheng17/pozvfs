function AbstractProcessing() {
};

AbstractProcessing.gui = function(unique) {
  return { page: document.getElementById(unique + '_page_div'),
           groomName: document.getElementById(unique + '_groomName_button'),
           brideName: document.getElementById(unique + '_brideName_button'),
           visited: document.getElementById(unique + '_visited_button'),
           weddingDay: document.getElementById(unique + '_weddingDay_button'),
           lastUpdated: document.getElementById(unique + '_lastUpdated_button'),
           number: document.getElementById(unique + '_number_button'),
           visitNo: document.getElementById(unique + '_visitNo_button'),
           mains: document.getElementById(unique + '_main_table'),
         };
};