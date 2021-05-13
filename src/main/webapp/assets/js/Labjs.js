
$(document).ready(function()
{
	$("#labsub2").click(function()
	{
		var pid=$('#pid').val();
		var time=$("#time").val();
		var add=$("#address").val();
		var patids=$('#patids').val();
		

		//patient id
		if(pid==''){
			$('#pidErr').html('please enter Patient id');
			labApp2.pid.focus();
			return false;
		}
		else if(isNaN(pid))
		{
			$('#pidErr2').html('only numbers are valid');
			$('#pidErr').html('');
			labApp2.pid.focus();
			return false;
		}
		else if(patids.indexOf(pid) == -1)
		{
			$('#pidErr2').html('id does not exists');
			$('#pidErr').html('');
			labApp2.pid.focus();
			return false;
		}
		else
		{
			$('#pidErr').html('');
			$('#pidErr2').html('');
		}
		
		//Apoointment time
		if(time === "time"){
			$('#timeErr').html('please select Time');
			labApp2.time.focus();
			return false;
		}
		else if(time === "no")
		{
			$('#timeErr').html('please select another day');
			labApp2.time.focus();
			return false;
		}
		else
		{
			$('#timeErr').html('');
		}
		
		
		
		//address
		if(add==''){
			$('#addErr').html('please enter Address');
			labApp2.address.focus();
			return false;
		}
		else
		{
			$('#addErr').html('');
		}
		
		
		
	});
		
});
		
	
