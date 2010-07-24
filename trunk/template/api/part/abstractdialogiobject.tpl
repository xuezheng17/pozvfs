function AbstractDialogIObject() {
  
};

AbstractDialogIObject.gui = function(unique, doc) {
  var doc = (doc) ? doc : document;
  return { title: doc.getElementById(unique + '_title_div'),
           object: doc.getElementById(unique + '_object_div'),
           objects: doc.getElementById(unique + '_objects_div')
         };
};
