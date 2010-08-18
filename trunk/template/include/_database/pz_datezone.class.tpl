function pz_datezone() {
};

pz_datezone.instance = function() {
  return { trackId: MiscUtils.unique(),
           start: SimpleDate.create(),
           end: SimpleDate.create(),
           page: ''
         }
};
