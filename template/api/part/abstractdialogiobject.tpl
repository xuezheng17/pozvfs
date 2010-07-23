function AbstractDialogIObject() {
  
};

AbstractDialogIObject.instance = function(title, object, objects) {
  return { title: title,
           object: object,
           objects: objects
         };
};
