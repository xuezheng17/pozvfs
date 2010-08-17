function ireception() {
};

ireception.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
