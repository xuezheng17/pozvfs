function Operation() {
};

Operation.instance = function() {
  return { trackId: MiscUtils.unique(),
           visitId: '',
           cancelled: 0,
           operateType: '',
           operator: '',
           operatedDate: SimpleDate.create(),
           content: ''
         }
};