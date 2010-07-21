var iTime = "";        //initial time 初始化时间
var Timeleft = "";     //time left 剩余时间

//roundNumber found via google
function roundNumber(num, dec) {
  var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
  return result;
};

//minsec created by Daem0nX (03.29.08)
//时间上的处理函数minsec
function minsec(time, tempTime) {
  var ztime;
  if (time == "m") {
    ztime = Math.floor(tempTime / 60);
    if (ztime < 10) {
      ztime = "0" + ztime;
    }
  } else if (time == "s") {
     ztime = Math.ceil(tempTime % 60);
     if (ztime < 10) {
      ztime = "0" + ztime;
     }
   } else {
     ztime = "minsec error...";
  }
  return ztime;
};
  
//文件队列的处理函数fileQueued
function fileQueued(file) {
  try {
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setStatus("Waiting...");
    progress.toggleCancel(true, this);

  } catch (ex) {
    this.debug(ex);
  }
};

//文件队列出错时的处理函数fileQueueError
function fileQueueError(file, errorCode, message) {
  try {
    if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
      alert("You have attempted to queue too many files.\n" + (message === 0 ? "You have reached the upload limit." : "You may select " + (message > 1 ? "up to " + message + " files." : "one file.")));
      return;
    }
   
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setError();
    progress.toggleCancel(false);

    switch (errorCode) {
      case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
        progress.setStatus("the file is too big.");
        this.debug("error code: the file is too big, file name: " + file.name + ", file size: " + file.size + ", error message: " + message);
        break;
     case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
        progress.setStatus("the file's size is 0.");
        this.debug("error code: the file's size is 0, file name: " + file.name + ", file size: " + file.size + ", error message: " + message);
        break;
     case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
        progress.setStatus("Illegal file types.");
        this.debug("error code: Illegal file types, file name: " + file.name + ", file size: " + file.size + ", error message: " + message);
        break;
     default:
        if (file !== null) {
          progress.setStatus("unknown error");
        }
        this.debug("error code: " + errorCode + ", file name: " + file.name + ", file size: " + file.size + ", error message: " + message);
        break;
    }
  } catch (ex) {
    this.debug(ex);
  }
};

//当文件选取对话框关闭后触发的事件处理函数-fileDialogComplete
function fileDialogComplete(numFilesSelected, numFilesQueued) {
  try {
    if (numFilesSelected > 0) {
      document.getElementById(this.customSettings.cancelButtonId).disabled = false;
      /*-----zjx--20100713------*/
      document.getElementById(this.customSettings.unUploadDivId).style.zIndex = -2;
      document.getElementById(this.customSettings.uploadedDivId).style.display = 'block';
      /*-------------------------*/
    }
    /* I want auto start the upload and I can do that here */
    //用户选择完文件后自动开始上传操作
    this.startUpload();
  } catch (ex) {
    this.debug(ex);
  }
};

//开始上传文件前触发的事件处理函数
function uploadStart(file) {
  try {
    /* I don't want to do any file validation or anything, I'll just update the UI and
    return true to indicate that the upload should start.
    It's important to update the UI here because in Linux no uploadProgress events are called. The best
    we can do is say we are uploading.
    */
    //Capture start time
    var currentTime = new Date()
    iTime = currentTime;
    
   //Set Timeleft to estimating
    Timeleft = "Calculating...";
    
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setStatus("Uploading...");
    progress.toggleCancel(true, this);
  } catch (ex) {
  }
  return true;
};


//上传进行时候的事件处理函数,该事件在整个文件的上传过程中定期性的被Flash控件自动触发，用以帮助开发者实时更新页面UI来制作上传进度条。
function uploadProgress(file, bytesLoaded, bytesTotal) {
  try {
    var currentTime = new Date()
    var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);

    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setProgress(percent);
    var tempTime = 0;
    
    //rndfilesize = round file size  （总文件大小b）
    var rndfilesize = roundNumber(((file.size / 1024) / 1024), 1);
   
    //uploaded = how much has been uploaded（已上传文件大小）
    var uploaded = roundNumber(((bytesLoaded / 1024) / 1024), 1);
   
    //uTime = uploadTime (time spent uploading)---上传花费多少时间
    var uTime = (Math.ceil(currentTime - iTime) / 1000);
   
    //uSpeed = uploadSpeed (40 kB/s)---上传速度显示
    var uSpeed = Math.floor(roundNumber(((bytesLoaded/uTime) / 1024), 2));
   
    //tempTime = store time for following functions
    var tempTime = uTime;
   
    //uploadTime in min:sec---已用时间通过（分：妙）表示
    uTime = "Time Used" + minsec("m", tempTime) + "Minute" + (minsec("m", tempTime) === '00' ? "" : "s") + ':' + minsec("s", tempTime) + "Seconds";
   
    //tempTime = reassign val
    tempTime = roundNumber(((((bytesTotal-bytesLoaded)/uSpeed)/60)/10),2);
   
    if (tempTime != "Infinity") {
      if (tempTime > 0) {
      //if greater than 0
      //Timeleft in min:sec
      Timeleft = minsec("m", tempTime) + "Minute"  + (minsec("m", tempTime) === '00' ? " " : "s") + ':' + minsec("s", tempTime) + 'Seconds';
      } else {
        Timeleft = "Calculating...";
      }
    } else {
      Timeleft = "Calculating...";
    }
    
    
  
    //Variables available
    //uSpeed = the rate of upload (40 kB/s)
    //uploaded = how much of the file has upload in MB
    //rndfilesize = file size in MB
    //uTime = how much time has been spent uploading in min:sec (xx:yy elapsed)
    //Timeleft = how much time is left in min:sec (xx:yy remain)
    //进度条显示的为：40/200MB，1254Kb/s；Remaining Time：00Minute : 08Second; Progress:12%(例如)
    progress.setStatus(percent + '%</font></b>');
  } catch (ex) {
    this.debug(ex);
  }
};

//上传成功后的事件处理函数
function uploadSuccess(file, serverData) {
  try {
    var currentTime = new Date();
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setComplete();
    
    //Calculate upload time
    var cTime = (Math.ceil(currentTime-iTime)/1000);
    var zmin = 0;
    var zsec = 0;
    zmin = Math.floor(cTime/60);
    if (zmin < 10) {
      zmin = "0" + zmin;
    }
    zsec = Math.ceil(cTime % 60);
    if (zsec < 10) {
      zsec = "0" + zsec;
    }
    //Show how long the upload took--显示完成后的状态显示
    progress.setStatus("uploaded! Time Used:<b><font color=red> " + zmin + "Minute" + (zmin === '00' ? " " : "s") + " : " + zsec + 'Seconds </font></b>');
    progress.toggleCancel(false);

    //ToDo: Verify the upload status by checking serverData
    if (this.callbackFunc && serverData.indexOf('error') == -1 && serverData.indexOf('Notice') == -1 && serverData != '') {
      this.callbackFunc(file, JSON.parse(serverData));
    } else {
      window.alert('Error: ' + serverData);
    }
  } catch (ex) {
    this.debug(ex);
  }
};

//上传出错时的事件处理函数
function uploadError(file, errorCode, message) {
  try {
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setError();
    progress.toggleCancel(false);

    switch (errorCode) {
      case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
        progress.setStatus("Upload Error: " + message);
        this.debug("error code: HTTP error, filename: " + file.name + ", error message: " + message);
        break;
      case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
        progress.setStatus("upload failed.");
        this.debug("error code: upload failed, filename: " + file.name + ", filesize: " + file.size + ", error message: " + message);
        break;
      case SWFUpload.UPLOAD_ERROR.IO_ERROR:
        progress.setStatus("server(IO) error");
        this.debug("error code: IO error, filename: " + file.name + ", error message: " + message);
        break;
      case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
        progress.setStatus("security error");
        this.debug("error code: security error, filename: " + file.name + ", error message: " + message);
        break;
      case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
        progress.setStatus("The number of files over restrictions.");
        this.debug("error code: The number of files over restrictions, filename: " + file.name + ", filesize: " + file.size + ", error message: " + message);
        break;
      case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
        progress.setStatus("Inspection documents failure, skip upload.");
        this.debug("error code: Inspection documents failure, skip upload, filename: " + file.name + ", filesize: " + file.size + ", error message: " + message);
        break;
      case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
        //If there aren't any files left (they were all cancelled) disable the cancel button
        if (this.getStats().files_queued === 0) {
          document.getElementById(this.customSettings.cancelButtonId).disabled = true;
        }
        progress.setStatus("cancel");
        progress.setCancelled();
        break;
      case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
        progress.setStatus("Stopped");
        break;
      default:
        progress.setStatus("unknown error: " + errorCode);
        this.debug("error code: " + errorCode + ", filename: " + file.name + ", filesize: " + file.size + ", error message: " + message);
        break;
    }
  } catch (ex) {
    this.debug(ex);
  }
};

//在完成一个上传周期后（在uploadError 或 uploadSuccess之后），此时一个上传操作已经结束，另一个上传操作可以开始了。
function uploadComplete(file) {
  if (this.getStats().files_queued === 0) {
    document.getElementById(this.customSettings.cancelButtonId).disabled = true;
  }
};

//队列上传完成后的状态显示
function queueComplete(numFilesUploaded) {
  var status = document.getElementById(this.settings.custom_settings.divStatus);
  if (status) {
    status.innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s ") + " Uploaded.";
  }
};
