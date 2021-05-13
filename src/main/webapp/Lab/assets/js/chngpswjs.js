
$(document).ready(function()
{
	$("#ChngSub").click(function()
	{
		
		var psw=$("#Password").val();
		var opsw=$("#PasswordOld").val();
		var npsw=$("#PasswordNew").val();
		
		

		var re = /[0-9]+/;
		var re2 = /[a-z]+/;
		var re3 = /[A-Z]+/;
		
		 if(opsw==''){
			$('#opswerror').html('pls enter old password');
			form3.PasswordOld.focus();
			return false;
		}
		 else
			{
				$('#opswerror').html('');
			}
		 
		 if(npsw==''){
			$('#npswerror').html('pls enter new password');
			form3.PasswordNew.focus();
			return false;
		}
		else if((npsw.length)<8)
		{
			$('#npswerror').html('minimum 8 characters');
			form3.PasswordNew.focus();
			return false;
		}
		 	
	   	else if(!re.test(npsw)) 
	  	{
	   		$('#npswerror').html('password must contain at least one number (0-9)!');
		        form3.PasswordNew.focus();
		        return false;
    	}
	   else if(!re2.test(npsw)) 
	  	{
	    	$('#npswerror').html('password must contain at least one lowercase letter (a-z)!');
	    	 form3.PasswordNew.focus();
		        return false;
		 }
	     else if(!re3.test(npsw)) 
	  	{
	    	$('#npswerror').html('password must contain at least one uppercase letter (A-Z)!');
	    	 form3.PasswordNew.focus();
	        	return false;
    	}
		else
		{
			$('#npswerror').html('');
		}
		 
		if(psw=='')
		{
			$('#pswerror').html('pls enter confirm password');
			form3.Password.focus();
			return false;
		}
		else if(!(npsw).match(psw))
		{
			$('#pswerror').html("please enter the same password as new password");
			form3.Password.focus();
			return false;
		}
		else
		{
			$('#pswerror').html('');
		}
		
	});
		
});
		
	
