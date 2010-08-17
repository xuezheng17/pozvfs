function iceremony() {
};

iceremony.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
