function Visitor() {
};

Visitor.instance = function() {
  return { trackId: MiscUtils.unique(),
           createdDate: SimpleDate.create(),
           creator: '',
           weddingDay: SimpleDate.create(),
           brideName: '',
           bridePhone: '',
           brideMobile: '',
           brideEmail: '',
           brideAddress: '',
           groomName: '',
           groomPhone: '',
           groomMobile: '',
           groomEmail: '',
           groomAddress: '',
           culturalBackground: '',
           ceremonyLocation: '',
           receptionLocation: '',
           source: '',
           firstVisitMethod: '',
           firstVisitDate: SimpleDate.create(),
           status: 0,
           cancelledDate: SimpleDate.create(),
           cancelledOperator: '',
           cancelledMessage: ''
         }
};
