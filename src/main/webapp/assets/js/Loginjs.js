/**
 * 
 */
$(document).ready(function()
{
	$("#login").click(function()
	{
		
		var email=$("#Email").val();
		var psw=$("#Password").val();
		
		
		if(email==''){
			$('#errormail').html('pls enter mail');
			form2.Email.focus();
			return false;
		}
		
		else
		{
			$('#errormail').html('');
		}
		 if(psw==''){
			$('#pswerror').html('pls enter password');
			form2.Password.focus();
			return false;
		}
		else
		{
			$('#pswerror').html('');
		}
		
		

			var url="..\assets\index2.jsp";

			window.location.assign("url");
		
	});
		
});
		
	
