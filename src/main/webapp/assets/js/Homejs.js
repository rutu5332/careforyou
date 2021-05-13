
$(document).ready(function()
{
	$("#homesub2").click(function()
	{
		var pid=$('#pid').val();
		var time=$("#time").val();
		var dis=$("#diseases").val();
		var add=$("#address").val();
		var com=$("#comments").val();
		var patids=$('#patids').val();
		

		//patient id
		if(pid==''){
			$('#pidErr').html('please enter Patient id');
			homeApp2.pid.focus();
			return false;
		}
		else if(isNaN(pid))
		{
			$('#pidErr').html('only numbers are valid');
			homeApp2.pid.focus();
			return false;
		}
		else if(patids.indexOf(pid) == -1)
		{
			$('#pidErr2').html('id does not exists');
			homeApp2.pid.focus();
			return false;
		}
		else
		{
			$('#pidErr').html('');
		}
		
		//Apoointment time
		if(time === "time"){
			$('#timeErr').html('please select Time');
			homeApp2.time.focus();
			return false;
		}
		else if(time === "no")
		{
			$('#timeErr').html('please select another day');
			homeApp2.time.focus();
			return false;
		}
		else
		{
			$('#timeErr').html('');
		}
		
		//disease
		if(dis== ''){
			$('#disErr').html('please enter disease');
			homeApp2.diseases.focus();
			return false;
		}
		else
		{
			$('#disErr').html('');
		}
		
		//address
		if(add==''){
			$('#addErr').html('please enter Address');
			homeApp2.address.focus();
			return false;
		}
		else
		{
			$('#addErr').html('');
		}
		
		//comment
		if(com==''){
			$('#comErr').html('please discribe yout problem');
			homeApp2.comments.focus();
			return false;
		}
		else
		{
			$('#comErr').html('');
		}
		
		
	});
		
});
		
	
