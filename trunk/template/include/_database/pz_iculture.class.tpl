function pz_iculture() {
};

pz_iculture.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
