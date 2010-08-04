function AbstractStatBasic() {
};

AbstractStatBasic.gui = function(unique) {
  return { visitors: document.getElementById(unique + '_visitors_div'),
           succeedVisitors: document.getElementById(unique + '_succeedVisitors_div'),
           dropVisitors: document.getElementById(unique + '_dropVisitors_div'),
           progressingVisitors: document.getElementById(unique + '_progressingVisitors_div'),
           deletedVisitors: document.getElementById(unique + '_deletedVisitors_div'),
           graphy: document.getElementById(unique + '_graphy_div')
         };
};

