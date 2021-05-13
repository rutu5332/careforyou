
$(document).ready(function()
{
	$("#editsub").click(function()
	{
		var name=($("#name").val()).trim();	
		//alert(name);
		var mno=($("#phone").val()).trim();
		var gen= $("#gender"). val();
		var re = /^[a-zA-Z ]*$/;
		
		if(name==''){
				$('#errorname').html('please enter name');
				edit.name.focus();
				return false;
		}
		else if(! re.test(name) ) 
		{
			$('#errorname').html('Username must contain only letters');
			edit.name.focus();
      		return false;
		}
		else
		{
			$('#errorname').html('');
		}
		
		//Gender
		if(gen === "gen")
		{
			$('#errorgen').html('please select gender');
			edit.gender.focus();
      		return false;
		}
		else
		{
			$('#errorgen').html('');
		}
		//phone
		if(mno==''){
			$('#errormobile').html('pls enter mobile number');
			edit.phone.focus();
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#errormobile').html('please enter 10 digits');
			edit.phone.focus();
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#errormobile').html('Phone number only contain numbers');
			edit.phone.focus();
      		return false;
		}
		else
		{
			$('#errormobile').html('');
		}
		
	});
		
});
		
	
