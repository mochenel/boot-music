$(document).ready(function(){

    $("#submit2").on("click",function(){

      let contact =document.getElementById("contact").value.trim() == "";
      let email =document.getElementById("email").value.trim() == "";
      let fname =document.getElementById("fname").value.trim() == "";
      let lname =document.getElementById("lname").value.trim() == "";
      let gender =document.getElementById("gender").selectedOptions[0].value == "";
      let pwd =document.getElementById("pwd").value.trim() == "";
      let cpwd =document.getElementById("cpwd").value.trim() == "";
      let proceed = contact|| email || fname || lname || gender || pwd || cpwd;
      if(proceed){
        
        return;
      }
      
      var pwd1 =$("#pwd").val();
      var pwd2 = $("#cpwd").val();
      if(pwd1 !== pwd2){

           event.preventDefault();
           $("#registerError").css("display","");
           $("#registerError").text("passwords don't match");
      }
     
    })
  }
  );