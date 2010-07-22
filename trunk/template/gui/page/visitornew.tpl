<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 400px;
    margin: 20px 0 0 0;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 26px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 8px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 155px;
    height: 27px;
    text-align: right;
    vertical-align: middle;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 310px;
    height: 27px;
    text-align: left;
    vertical-align: bottom;
  }
  
  .{{$template|escape:'html'}}_inputText1{
    width: 310px;
    height: 21px;
  }
  .{{$template|escape:'html'}}_inputText2{
    width: 155px;
    height: 21px;
  }
  
  
  .item{margin:0;
        padding:0;
  }
  .item p{border:o;
          border-left:1px solid #e5ecf9;
          border-right:1px solid #e5ecf9;
          margin:0;
		  background-color:#e5ecf9;
		  text-align: left;
          padding-left:13px;
          font-size: 13pt;
          font-weight: bold;
          color: #000000; 
          font-family: Arial;
  }

  .item div{height:1px;
            overflow:hidden;
            border-left:1px solid #e5ecf9;
            border-right:1px solid #e5ecf9;
            background-color:#e5ecf9;
   }
  .item .row1{margin:0 5px;
              background:#e5ecf9;
   }
  .item .row2{margin:0 3px;
              border:0 2px;
  }
  .item .row3{margin:0 2px;
  }
  .item .row4{margin:0 1px;
              height:2px;
  }
  
  
</style>

<table  class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0">
  <tr>
    <td class="{{$template|escape:'html'}}_td1">
      <div class="item">
      <div class="row1"></div>
      <div class="row2"></div>
      <div class="row3"></div>
      <div class="row4"></div>
         <p>CUSTOMER INFORMATION</p>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">
      Wedding Date:
    </td>
    <td class="{{$template|escape:'html'}}_td4">
       <input type="text" id="{{$template|escape:'html'}}_weddingDay_input" class="{{$template|escape:'html'}}_inputText2"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">
      Bride Name:
    </td>
    <td class="{{$template|escape:'html'}}_td4">
       <input type="text" id="{{$template|escape:'html'}}_brideName_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
   
