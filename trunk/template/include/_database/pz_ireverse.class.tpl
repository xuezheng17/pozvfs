function pz_ireverse() {
};

pz_ireverse.instance = function() {
  return { trackId: MiscUtils.unique(),
           operator: '',
           date: SimpleDate.create(),
           content: ''
         }
};
