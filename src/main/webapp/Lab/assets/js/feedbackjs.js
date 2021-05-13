
$(document).ready(function()
{
	$("#fdbcksub").click(function()
	{
		var email=$("#eid").val();
		var text=$("#fd").val();
		text=text.trim();
		
		if(email == "")
		{
			$('#eiderr').html('*please enter email.<br>');
			fdbckform.eid.focus();
			return false;
		}
		else
		{
			$('#eiderr').html('');
		}
		
		if(text == "")
		{
			$('#fderr').html('*please enter feedback.<br>');
			fdbckform.fd.focus();
			return false;
		}
		else
		{
			$('#fderr').html('');
		}
		
	});
		
});
		
	
