
$(document).ready(function()
{
	$("#docsub").click(function()
	{
		var type= $("input[name='t1']:checked"). val();
		var v1="undefined";
		var v2="Home Visit";
		var v3="Clinic Visit";
		var dt=$("#date").val();
		

		if(type === v2)
			{
			$('#errortype').html(' ');
			}
		else if(type === v3)
			{
			$('#errortype').html(' ');
			}
		else
		{
			$('#errortype').html('*please select any option.');
			return false;
		}
		
		if(dt == "dt")
		{
			$('#dtErr').html('*please select date');
			return false;
		}
		else
		{
			$('#dterr').html('');
		}
		
	});
		
});
		
	
