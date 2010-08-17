function isource() {
};

isource.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
