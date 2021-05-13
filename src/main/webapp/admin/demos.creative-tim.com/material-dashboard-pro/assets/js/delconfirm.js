$(document).ready(function()
{
	
	$("#submitl").click(function()
	{
		
		var email=$("#Email").val();
		var psw=$("#Password").val();
		
		/*alert("hello.3");
		alert(email);
		alert(psw);
		*/
		if(email==''){
			$('#errormail').html('please enter mail');
			forml.Email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#errormail').html('please enter valid email id');
			forml.Email.focus();
			return false;
		}
		
		
		else
		{
			$('#errormail').html('');
		}
		 if(psw==''){
			$('#pswerror').html('pls enter password');
			forml.Password.focus();
			return false;
		}
		else
		{
			$('#pswerror').html('');
		}
				
	});
		
});
		
	
