$(document).ready(function(){
    $('#form1').ready(function(){
       let error =  $('#loginError').text();
       if(error.trim() == ""){
        $('#loginError').hide();
       }
       else{
        $('#loginError').show();
        $('#SignIn').modal('show');
       }
    })
    $('#form2').ready(function(){
        let error =  $('#registerError').text();
        if(error.trim() == ""){
         $('#registerError').hide();
        }
        else{
         $('#registerError').show();
         $('#SignUp').modal('show');
        }
     })

     $('#modalControl').ready(function(){
      let error =  $('#modalControl').text();
      if(error == null || error == ""){
         $('#fileError').hide();
        }
        else{
         $('#fileError').modal("show");
       
        }
    
   })

   // successful sign up modal
   $('#success').ready(function(){
      let error =  $('#success').text().trim();
      console.log("*****" +error)
      if(error == null || error == ""){
         
         $('#successful-modal-signUp').hide();
        }
        else{
         $('#successful-modal-signUp').modal("show");
       
        }
    
   })


      

})