
$(document).ready(function()
{
	$("#clinicsub2").click(function()
	{
		var pid=$('#pid').val();
		var time=$("#time").val();
		var dis=$("#diseases").val();
		var com=$("#comments").val();
		var patids=$('#patids').val();

		//patient id
		if(pid==''){
			$('#pidErr').html('please enter Patient id');
			clinicApp2.pid.focus();
			return false;
		}
		else if(isNaN(pid))
		{
			$('#pidErr').html('only numbers are valid');
			clinicApp2.pid.focus();
			return false;
		}
		else if(patids.indexOf(pid) == -1)
		{
			$('#pidErr2').html('id does not exists');
			clinicApp2.pid.focus();
			return false;
		}
		else
		{
			$('#pidErr').html('');
		}
		
		//Apoointment time
		if(time === "time"){
			$('#timeErr').html('please select Time');
			clinicApp2.time.focus();
			return false;
		}
		else if(time === "no")
		{
			$('#timeErr').html('please select another day');
			clinicApp2.time.focus();
			return false;
		}
		else
		{
			$('#timeErr').html('');
		}
		
		//disease
		if(dis== ''){
			$('#disErr').html('please enter disease');
			clinicApp2.diseases.focus();
			return false;
		}
		else
		{
			$('#disErr').html('');
		}
		
		//comment
		if(com==''){
			$('#comErr').html('please discribe yout problem');
			clinicApp2.comments.focus();
			return false;
		}
		else
		{
			$('#comErr').html('');
		}
		
		
	});
		
});
		
	
