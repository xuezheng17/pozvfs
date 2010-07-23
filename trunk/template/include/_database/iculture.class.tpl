function ICulture() {
};

ICulture.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
