function AbstractHome() {
};
AbstractHome.gui = function(unique) {
  return {learn: document.getElementById(unique + '_learn_button'),
         };
};