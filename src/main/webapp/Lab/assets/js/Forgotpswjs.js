$(document).ready(function()
{
	$("#submit").click(function()
	{
		var code=$("#code").val().trim();
		var gencode=$("#genCode").val().trim();
		var npsw=$("#PasswordNew").val();
		var cpsw=$("#cpsw").val();
		var re = /[0-9]+/;
		var re2 = /[a-z]+/;
		var re3 = /[A-Z]+/;
		alert(code);
		alert(gencode  );
		alert(code == gencode);
		
		 if(code==''){
			$('#codeerror').html('please enter code');
			form4.code.focus();
			return false;
		}
		 else if(!(code == gencode))
		{
			 $('#codeerror').html('please enter valid code');
				form4.code.focus();
				return false;
		}
		 else
			{
				$('#codeerror').html('');
			}
		 
		 if(npsw==''){
				$('#npswerror').html('please enter new password');
				form4.PasswordNew.focus();
				return false;
			}
		else if((npsw.length)<8)
		{
			$('#npswerror').html('minimum 8 characters');
			form4.PasswordNew.focus();
			return false;
		}
		else if(!re.test(npsw)) 
	  	{
	   		$('#npswerror').html('password must contain at least one number (0-9)!');
		        form4.PasswordNew.focus();
		        return false;
	  	}       
		 else if(!re2.test(npsw)) 
	  	{
	    	$('#npswerror').html('password must contain at least one lowercase letter (a-z)!');
	    	form4.PasswordNew.focus();
		        return false;
		 }
	      	
	      	
	    else if(!re3.test(form3.PasswordNew.value)) 
	  	{
	    	$('#npswerror').html('password must contain at least one uppercase letter (A-Z)!');
	    	form4.PasswordNew.focus();
	        	return false;
    	}
		 
		 
		else
		{
			$('#npswerror').html('');
		}
		 
		 
		if(cpsw=='')
		{
			$('#errorcpsw').html('please enter confirm password');
			form4.cpsw.focus();
			return false;
		}
		else if(!(npsw).match(cpsw))
		{
			$('#errorcpsw').html(" not match");
			form4.cpsw.focus();
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
		
	
