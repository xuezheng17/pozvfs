function datezone() {
};

datezone.instance = function() {
  return { trackId: MiscUtils.unique(),
           start: SimpleDate.create(),
           end: SimpleDate.create(),
           page: ''
         }
};
