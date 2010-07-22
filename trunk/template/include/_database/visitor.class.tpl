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
           groomAddress: '',
           culturalBackground: '',
           ceremonyLocation: '',
           receptionLoation: '',
           source: '',
           firstVisitMethod: '',
           firstVisitDate: SimpleDate.create(),
           status: 0
         }
};
