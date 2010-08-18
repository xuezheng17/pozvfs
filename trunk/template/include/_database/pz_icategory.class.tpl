function pz_icategory() {
};

pz_icategory.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
