function ICeremony() {
};

ICeremony.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
