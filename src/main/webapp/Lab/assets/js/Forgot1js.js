
$(document).ready(function()
{
	$("#submit").click(function()
	{
		
		var email=$("#Email").val();
			if(email==''){
			$('#errormail').html('please enter mail');
			form4.Email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#errormail').html('please enter valid email id');
			form4.Email.focus();
			return false;
		}
		else
		{
			$('#errormail').html('');
		}
			
	});
		
});
		
	
