function DocType() {
};

DocType.array = function() {
  return [ '{{$smarty.const.DOC_TYPE_STRICT|escape:javascript}}',
           '{{$smarty.const.DOC_TYPE_LOOSE|escape:javascript}}'
         ]
};
