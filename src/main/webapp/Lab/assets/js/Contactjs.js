/**
 * 
 */
$(document).ready(function()
{
	$("#submit2").click(function()
	{
		
		var email=$("#email").val();
		var name=$("#name").val();
		var mno=$("#phone").val();
		var msg=$("#comments").val();
		
		var f=0;
	
		
		if(name=='')
		 {
				$('#errorname').html('pls enter name');
				form.name.focus();
				return false;
		}
		else
		{
				$('#errorname').html('');
				f++;
		}
		if(email==''){
			$('#errormail').html('pls enter mail');
			form.email.focus();
			return false;
		}
		
		else
		{
			$('#errormail').html('');
			f++;
		}
		 if(mno==''){
			$('#errorphone').html('pls enter phone number');
			form.phone.focus();
			return false;
		}
		 else if(mno.length < 10 || mno.length > 10)
			{
				$('#errorphone').html('please enter 10 digits');
				form.phone.focus();
				return false;
			}
			else if(isNaN(mno)) 
			{
				$('#errorphone').html('Phone number only contain numbers');
				form.phone.focus();
	      		return false;
			}
		else
		{
			$('#errorphone').html('');
			f++;
		}
		 
		 if(msg=='')
		 {
				$('#errorcomm').html('pls enter your query');
				form.comments.focus();
				return false;
		}
		else
		{
				$('#errorcomm').html('');
				f++;
		}
		
		if(f==4)
		{
			alert("Our administrator will contact you soon..Thank you !");
		}

		
	});
		
});
		
	
