function icategory() {
};

icategory.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
