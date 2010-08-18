function pz_isource() {
};

pz_isource.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
