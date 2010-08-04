function DateZone() {
};

DateZone.instance = function() {
  return { trackId: MiscUtils.unique(),
           start: SimpleDate.create(),
           end: SimpleDate.create(),
           page: ''
         }
};
