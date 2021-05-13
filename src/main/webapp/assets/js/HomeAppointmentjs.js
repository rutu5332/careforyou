
$(document).ready(function()
{
	$("#homesub").click(function()
	{
		var fnm=$("#fname").val();
		var lnm=$("#lname").val();
		var mno=$("#phone").val();
		var age=$("#age").val();
		var add=$("#address").val();
		var gen=$("#gender").val();
		var time=$("#time").val();
		var email=$("#email").val();
		var dis=$("#diseases").val();
		var com=$("#comments").val();
		
		//fname
		if(fnm==''){
				$('#fnmErr').html('please enter name');
				homeApp.fname.focus();
				return false;
		}
		var re4 = /^[a-zA-Z]*$/;
		if(!re4.test(fnm)) 
		{
			$('#fnmErr').html('fname must contain only letters');
      		homeApp.fname.focus();
      		return false;
		}
		else
		{
			$('#fnmErr').html('');
		}
		
		//lname
		if(lnm==''){
			$('#lnmErr').html('please enter name');
			homeApp.lname.focus();
			return false;
		}
		if(!re4.test(lnm)) 
		{
			$('#lnmErr').html('Lname must contain only letters');
	  		homeApp.lname.focus();
	  		return false;
		}
		else
		{
			$('#lnmErr').html('');
		}
		
		//phone
		if(mno==''){
			$('#phnErr').html('pls enter mobile number');
			homeApp.phone.focus();
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#phnErr').html('please enter 10 digits');
			homeApp.phone.focus();
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#phnErr').html('Phone number only contain numbers');
      		homeApp.phone.focus();
      		return false;
		}
		else
		{
			$('#phnErr').html('');
		}
		
		//age
		if(age==''){
			$('#ageErr').html('pls select age');
			homeApp.age.focus();
			return false;
		}
		else
		{
			$('#ageErr').html('');
		}
		
		//address
		if(add==''){
			$('#addErr').html('please enter Address');
			homeApp.address.focus();
			return false;
		}
		else
		{
			$('#addErr').html('');
		}
		
		//Gender
		if(gen === "gen")
		{
			$('#genErr').html('please select gender');
			homeApp.gender.focus();
			return false;
		}
		else
		{
			$('#genErr').html(' ');
		}
		
		//Apoointment time
		if(time === "time"){
			$('#timeErr').html('please select Time');
			homeApp.time.focus();
			return false;
		}
		else if(time === "no")
		{
			$('#timeErr').html('please select another day');
			homeApp.time.focus();
			return false;
		}
		else
		{
			$('#timeErr').html('');
		}
		
		
		//email
		if(email==''){
			$('#emailErr').html('pls enter mail');
			homeApp.email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#emailErr').html('please enter valid email id');
			homeApp.email.focus();
			return false;
		}
		else
		{
			$('#emailErr').html('');
		}
		
		//disease
		if(dis== ''){
			$('#disErr').html('please enter disease');
			homeApp.diseases.focus();
			return false;
		}
		else
		{
			$('#disErr').html('');
		}
		
		//comment
		if(com==''){
			$('#comErr').html('please discribe your problem');
			homeApp.comments.focus();
			return false;
		}
		else
		{
			$('#comErr').html('');
		}
	});
		
});
		
	
