
$(document).ready(function()
{
	$("#editsub").click(function()
	{
		var name=($("#fname").val()).trim();	
		var lname=($("#lname").val()).trim();	
		var mno=($("#phone").val()).trim();
		var fees=($("#fees").val()).trim();
		var add=$("#address").val();
		
		
		var re1=/^[# ]*$/;
		var re = /^[a-zA-Z ]*$/;
		
		if(name==''){
				$('#errorfname').html('please enter name');
				editDoc.fname.focus();
				return false;
		}
		if(!(re.test(name))) 
		{
			$('#errorfname').html('fname must contain only letters');
			editDoc.fname.focus();
      		return false;
		}
		else
		{
			$('#errorfname').html('');
		}
		
		//last name
		if(lname==''){
			$('#errorlname').html('please enter name');
			editDoc.lname.focus();
			return false;
		}
		if(!(re.test(lname))) 
		{
			$('#errorlname').html('lname must contain only letters');
			editDoc.lname.focus();
	  		return false;
		}
		else
		{
			$('#errorlname').html('');
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
		
		//fees
		if(fees == '')
		{
			$('#errorfees').html('pls enter fees');
			editDoc.fees.focus();
			return false;
		}
		else if(isNaN(fees))
		{
			$('#errorfees').html('Fees only contain number');
			editDoc.fees.focus();
			return false;
		}
		else
		{
			$('#errorfees').html('');
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
		
	
