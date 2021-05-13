$(function() {
 
  $("form[name='insert']").validate({
    rules: {
      fname: 
    	  {
    	  	required: true
    	  },
      lname: {
    	  required:true
      },
      birthdate: {
    	  required:true
      },
      r1:{
    	  required:true
      },
      Address:{
    	  required:true
      },
      Mobile:{
    	  required : true,
    	  number : true,
    	  minlength : 10,
    	  maxlength : 10
      },
      degree:{
    	required : true  
      },
      email: {
        required: true,
        email: true
      },
      password: {
        required: true,
        minlength: 8,
        maxlength : 10
      }
    },
   
    messages: {
      fname: {
    	  required:"Please enter your firstname"
    	  },
      lname: {
    	  required:"Please enter your lastname"
	  },
	  birthdate: {
    	  required:"Please enter your birthdate"
	  },
	  r1: {
    	  required:"Please select gender"
	  },
	  Address: {
    	  required:"Please enter your address"
	  },
	  Mobile:{required :"Please enter mobile number",number : "Please enter digits only", minlength : "Please enter 10 digits of mobile number", maxlength : "Please enter 10 digits of mobile number"
	  },
	  degree :{
		  required:"Please enter your degree"  
	  },
      email: 
	  {
    	  required:"Please enter email address",
    	  email:"Please enter a valid email address"
	  },
	  
      password:
      {
        required: "Please provide a password",
        minlength: "Your password must be at least 8 characters long",
        maxlength: "Your password must be at least 10 characters long",
      }
     
    },
    
    submitHandler: function(form) {
      form.submit();
    }
  });
});