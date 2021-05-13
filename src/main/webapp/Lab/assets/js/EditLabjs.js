
$(document).ready(function()
{
	$("#editsub").click(function()
	{
		var name=($("#name").val()).trim();	
		var mno=($("#phone").val()).trim();
		var add=$("#address").val();
		
		
		var re1=/^[# ]*$/;
		var re = /^[a-zA-Z ]*$/;
		
		if(name==''){
				$('#errorname').html('please enter name');
				editDoc.name.focus();
				return false;
		}
		if(!(re.test(name))) 
		{
			$('#errorname').html('name must contain only letters');
			editDoc.name.focus();
      		return false;
		}
		else
		{
			$('#errorname').html('');
		}
		
		
		
		//phone
		if(mno==''){
			$('#errormobile').html('pls enter mobile number');
			editDoc.phone.focus();
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#errormobile').html('please enter 10 digits');
			editDoc.phone.focus();
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#errormobile').html('Phone number only contain numbers');
			editDoc.phone.focus();
      		return false;
		}
		else
		{
			$('#errormobile').html('');
		}
		
		
		//Address
		if(add == '')
		{
			$('#erroradd').html('');
		}
		else if(re1.test(add))
		{
			$('#erroradd').html('please enter Address');
			editDoc.address.focus();
			return false;
		}
		else
		{
			$('#erroradd').html('');
		}
		
	});
		
});
		
	
