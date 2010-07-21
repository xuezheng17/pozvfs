function File() {
};

File.instance = function() {
  return { trackId: MiscUtils.unique(),
           customerTrackId: '',
           parentDirId: '',
           dirId: '',
           name: '',
           trueName: '',
           link: '',
           size: 0,
           downloaded: 0,
           comment: ''
         }
};
