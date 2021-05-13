
$(document).ready(function()
{
	$("#clinicsub").click(function()
	{
		var fnm=$("#fname").val();
		var lnm=$("#lname").val();
		var mno=$("#phone").val();
		var age=$("#age").val();
		var gen=$("#gender").val();
		var time=$("#time").val();
		var email=$("#email").val();
		var dis=$("#diseases").val();
		var com=$("#comments").val();
		
		
		//fname
		if(fnm==''){
				$('#fnmErr').html('please enter name');
				clinicApp.fname.focus();
				return false;
		}
		var re4 = /^[a-zA-Z]*$/;
		if(!re4.test(fnm)) 
		{
			$('#fnmErr').html('fname must contain only letters');
      		clinicApp.fname.focus();
      		return false;
		}
		else
		{
			$('#fnmErr').html('');
		}
		
		//lname
		if(lnm==''){
			$('#lnmErr').html('please enter name');
			clinicApp.lname.focus();
			return false;
		}
		if(!re4.test(lnm)) 
		{
			$('#lnmErr').html('Lname must contain only letters');
	  		clinicApp.lname.focus();
	  		return false;
		}
		else
		{
			$('#lnmErr').html('');
		}
		
		//phone
		if(mno==''){
			$('#phnErr').html('pls enter mobile number');
			clinicApp.phone.focus();
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#phnErr').html('please enter 10 digits');
			clinicApp.phone.focus();
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#phnErr').html('Phone number only contain numbers');
      		clinicApp.phone.focus();
      		return false;
		}
		else
		{
			$('#phnErr').html('');
		}
		
		//age
		if(age==''){
			$('#ageErr').html('please enter age');
			clinicApp.age.focus();
			return false;
		}
		else if(isNaN(age))
		{
			$('#ageErr').html('only numbers are valid');
			clinicApp.age.focus();
			return false;
		}
		else
		{
			$('#ageErr').html('');
		}
		
		
		//Gender
		if(gen === "gen")
		{
			$('#genErr').html('please select gender');
			clinicApp.gender.focus();
			return false;
		}
		else
		{
			$('#genErr').html(' ');
		}
		
		//Apoointment time
		if(time === "time"){
			$('#timeErr').html('please select Time');
			clinicApp.time.focus();
			return false;
		}
		else if(time === "no")
		{
			$('#timeErr').html('please select another day');
			clinicApp.time.focus();
			return false;
		}
		else
		{
			$('#timeErr').html('');
		}
		
		//email
		if(email==''){
			$('#emailErr').html('pls enter mail');
			clinicApp.email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#emailErr').html('please enter valid email id');
			clinicApp.email.focus();
			return false;
		}
		else
		{
			$('#emailErr').html('');
		}
		
		//disease
		if(dis== ''){
			$('#disErr').html('please enter disease');
			clinicApp.diseases.focus();
			return false;
		}
		else
		{
			$('#disErr').html('');
		}
		
		//comment
		if(com==''){
			$('#comErr').html('please discribe yout problem');
			clinicApp.comments.focus();
			return false;
		}
		else
		{
			$('#comErr').html('');
		}
		
		
		
	});
		
});
		
	
