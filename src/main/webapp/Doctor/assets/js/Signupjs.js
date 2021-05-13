
$(document).ready(function()
{
	$("#submit1").click(function()
	{
		var name=$("#UserName").val();
		var address=$("#Address").val();
		var age=$("#Userage").val();
		var email=$("#Email").val();
		var psw=$("#Password").val();
		var cpsw=$("#cpsw").val();
		var mno=$("#Mobile").val();
		var gen= $("input[name='r1']:checked"). val();
		var v1="undefined";
		var v2="female";
		var v3="male";
		
		

		var re = /[0-9]+/;
		var re2 = /[a-z]+/;
		var re3 = /[A-Z]+/;
		if(name==''){
				$('#errorname').html('please enter name');
				form1.UserName.focus();
				return false;
		}
		var re4 = /^[a-zA-Z ]*$/;
		if(!re4.test(name)) 
		{
			$('#errorname').html('Username must contain only letters');
      		form1.UserName.focus();
      		return false;
		}
		else
		{
			$('#errorname').html('');
		}
		
		//Gender
		if(gen === v2)
			{
			$('#errorgen').html(' ');
			}
		else if(gen === v3)
			{
			$('#errorgen').html(' ');
			}
		else
		{
			$('#errorgen').html('please select gender');
			return false;
		}
		
		//address
		
		if(address==''){
			$('#erroradd').html('please enter Address');
			form1.Address.focus();
			return false;
		}
		else
		{
			$('#erroradd').html('');
		}
		

		if(age==''){
			$('#ageerror').html('pls select age');
			form1.Userage.focus();
			return false;
		}
		else
		{
			$('#ageerror').html('');
		}
		if(mno==''){
			$('#errormobile').html('pls enter mobile number');
			form1.Mobile.focus();
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#errormobile').html('please enter 10 digits');
			form1.Mobile.focus();
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#errormobile').html('Phone number only contain numbers');
      		form1.Mobile.focus();
      		return false;
		}
		else
		{
			$('#errormobile').html('');
		}
		if(email==''){
			$('#errormail').html('pls enter mail');
			form1.Email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#errormail').html('please enter valid email id');
			form1.Email.focus();
			return false;
		}
		else
		{
			$('#errormail').html('');
		}
		 if(psw==''){
			$('#pswerror').html('pls enter password');
			form1.Password.focus();
			return false;
		}
		else if((psw.length)<8)
		{
			$('#pswerror').html('minimum 8 characters');
			form1.Password.focus();
			return false;
		}
		 
		 
	      	
	   	else if(!re.test(psw)) 
	  	{
	   		$('#pswerror').html('password must contain at least one number (0-9)!');
		        form1.Password.focus();
		        return false;
    	}
	      	
	      	
	    else if(!re2.test(psw)) 
	  	{
	    	$('#pswerror').html('password must contain at least one lowercase letter (a-z)!');
	    	 form1.Password.focus();
		        return false;
		 }
	      	
	      	
	    else if(!re3.test(form1.Password.value)) 
	  	{
	    	$('#pswerror').html('password must contain at least one uppercase letter (A-Z)!');
	    	 form1.Password.focus();
	        	return false;
    	}
		 
		 
		else
		{
			$('#pswerror').html('');
		}
		if(cpsw=='')
		{
			$('#errorcpsw').html('pls enter confirm password');
			form1.cpsw.focus();
			return false;
		}
		else if(!(psw).match(cpsw))
		{
			$('#errorcpsw').html(" not match");
			form1.cpsw.focus();
			return false;
		}
		else
		{
			$('#errorcpsw').html('');
		}
		

			//var url="..\assets\index2.jsp";

			//window.location.assign("url");
		
	});
		
});
		
	
