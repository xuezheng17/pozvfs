/*------------zjx 05.25.2010---------*/
{{include file="include/library/upload/swfupload.tpl"}}
{{include file="include/library/upload/swfupload.queue.tpl"}}
{{include file="include/library/upload/fileprogress.tpl"}}
{{include file="include/library/upload/handlers.tpl"}}
/*---------------------------------*/
{{*/*
  * Constructor.
  */*}}
function UploadUtils() {
  this._uploadUrl = UploadUtils._defaultUploadUrl;
  this._fileTypes = UploadUtils._imageFileTypes;
  this._fileTypesDescription = UploadUtils._imageFileTypesDescription;
  this._fileUploadLimit = UploadUtils._fileUploadNoLimit;
  this._progressTargetId = UploadUtils._defaultProgressTargetId;
  this._cancelButtonId = UploadUtils._defaultCancelButtonId
  this._buttonImageUrl = UploadUtils._defaultButtonImageUrl;
  this._buttonPlaceholderId = UploadUtils._defaultButtonPlaceholderId;
  this._buttonWidth = UploadUtils._defaultButtonWidth;
  this._buttonHeight = UploadUtils._defaultButtonHeight;
  this._divStatusId = UploadUtils._defaultDivStatusId;
  /*-zjx0713-*/
  this._unUploadDivId = UploadUtils._defaultUnUploadDivId;
  this._uploadedDivId = UploadUtils._defaultUploadedDivId;
  /*--*/
};

UploadUtils._flashUrl             = 'library/pozzolana/upload/swfupload.swf';   //flash文件路径
UploadUtils._defaultUploadUrl     = 'upload.php';                                  //处理上传过程的文件路径
UploadUtils._fileSizeLimit        = '500MB';                                       //该属性可接收一个带单位的数值，可用的单位有B,KB,MB,GB。如果忽略了单位，那么默认使用KB。特殊值0表示文件大小无限制

UploadUtils._imageFileTypes               = '*.jpeg;*.jpg;*.png;*.gif'; //设置文件选择对话框的文件类型过滤规则，该属性接收的是以分号分隔的文件类型扩展名，例如“ *.jpg;*.gif”，则只允许用户在文件选择对话框中可见并可选jpg和gif类型的文件默认接收所有类型的文件
UploadUtils._imageFileTypesDescription    = 'Image Files';         //设置文件选择对话框中显示给用户的文件描述 
UploadUtils._fileUploadNoLimit            = 0;                     //限定用户一次性最多上传多少个文件，如果设置为"0"，则表示没有限制
UploadUtils._fileQueueNoLimit             = 0;                     //上传队列数量限制，该项通常不需设置
UploadUtils._defaultProgressTargetId      = 'fsUploadProgress';    //显示上传进度div的Id
UploadUtils._defaultCancelButtonId        = 'btnCancel';           //取消按钮的Id

UploadUtils._debug               = false;  //该值是布尔类型，设置debug事件是否被触发
UploadUtils._prevent_swf_caching = false;  //在相关的swf文件增加随机参数，以避免Flash被缓存

UploadUtils._defaultButtonImageUrl         = 'image/upload/upload67x20.png'; //按钮图片的链接地址
UploadUtils._defaultButtonPlaceholderId    = 'spanButtonPlaceHolder';            //上传按钮位置显示的Id
UploadUtils._defaultButtonWidth            = 67;                                 //按钮的宽度
UploadUtils._defaultButtonHeight           = 20;                                 //按钮的高度
UploadUtils._defaultDivStatusId            = 'divStatus'; //上传后显示结果div的Id
UploadUtils._defaultDirectoryToUpload      = 'tmp/';
UploadUtils._defaultThumbnail              = false;
/*----zjx0713-----*/
UploadUtils._defaultUnUploadDivId          = 'unUploadDiv';
UploadUtils._defaultUploadedDivId          = 'uploadedDiv';
/*--------*/
UploadUtils.prototype._createInstance = function(directoryToUpload, thumbnail, callbackFunc) {
  var settings = {
    flash_url                       : UploadUtils._flashUrl,
    upload_url                      : this._uploadUrl,
    post_params                     : { directoryToUpload: (directoryToUpload) ? directoryToUpload : UploadUtils._defaultDirectoryToUpload, thumbnail: (thumbnail) ? thumbnail : UploadUtils._defaultThumbnail },
    file_size_limit                 : UploadUtils._fileSizeLimit, 
    file_types                      : (this._fileTypes !== null) ? this._fileTypes : UploadUtils._imageFileTypes, 
    file_types_description          : (this._fileTypesDescription !== null) ? this._fileTypesDescription : UploadUtils._imageFileTypesDescription, 
    file_upload_limit               : (this._fileUploadLimit !== null) ? this._fileUploadLimit : UploadUtils._fileUploadNoLimit, 
    file_queue_limit                : UploadUtils._fileQueueNoLimit, 
    
    //customSettings属性是一个空的JavaScript对象，它被用来存储跟SWFUpload实例相关联的数据
    custom_settings : {
      progressTarget                : (this._progressTargetId !== null) ? this._progressTargetId : UploadUtils._defaultProgressTargetId,
      divStatus                     : (this._divStatusId !== null) ? this._divStatusId : UploadUtils._defaultDivStatusId,
      cancelButtonId                : (this._cancelButtonId !== null) ? this._cancelButtonId : UploadUtils._defaultCancelButtonId,
      /*-zjx0713--*/
      unUploadDivId                 : (this._unUploadDivId !== null) ? this._unUploadDivId : UploadUtils._defaultUnUploadDivId,
      uploadedDivId                 : (this._uploadedDivId !== null) ? this._uploadedDivId : UploadUtils._defaultUploadedDivId
      /*----*/
    },
    
    debug                           : UploadUtils._debug,
    prevent_swf_caching             : UploadUtils._prevent_swf_caching,
    
    //Button settings---上传按钮的设置
    button_image_url                : (this._buttonImageUrl !== null) ? this._buttonImageUrl : UploadUtils._defaultButtonImageUrl,
    button_placeholder_id           : (this._buttonPlaceholderId !== null) ? this._buttonPlaceholderId : UploadUtils._defaultButtonPlaceholderId,
    button_width                    : (this._buttonWidth !== null) ? this._buttonWidth : UploadUtils._defaultButtonWidth,
    button_height                   : (this._buttonHeight !== null) ? this._buttonHeight : UploadUtils._defaultButtonHeight,
    button_cursor                   : SWFUpload.CURSOR.HAND,
    button_window_mode              : SWFUpload.WINDOW_MODE.OPAQUE,
    //The event handler functions are defined in handlers.tpl---在handlers.tpl文件中定义的事件处理函数
    file_queued_handler             : fileQueued,           //文件队列事件处理函数
    file_queue_error_handler        : fileQueueError,       //文件队列事件错误处理函数
    file_dialog_complete_handler    : fileDialogComplete,   //当文件选取对话框关闭后触发的事件处理函数
    upload_start_handler            : uploadStart,          //开始上传文件前触发的事件处理函数
    upload_progress_handler         : uploadProgress,       //上传进行时候的事件处理函数
    upload_error_handler            : uploadError,          //上传出错时的事件处理函数
    upload_success_handler          : uploadSuccess,        //文件上传成功后触发的事件处理函数
    upload_complete_handler         : uploadComplete,       //当上传队列中的一个文件完成了一个上传周期，无论是成功(uoloadSuccess触发)还是失败(uploadError触发)，此事件都会被触发，这也标志着一个文件的上传完成，可以进行下一个文件的上传了
    queue_complete_handler          : queueComplete         //Queue plugin event--队列全部完成时触发的事件处理函数
  };
  swfu = new SWFUpload(settings, callbackFunc); //创建SWFUpload实例};