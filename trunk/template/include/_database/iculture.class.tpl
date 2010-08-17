function iculture() {
};

iculture.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
