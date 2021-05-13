
$(document).ready(function()
{
	$("#TestimonialSub").click(function()
	{
		var text=$("#experience").val().trim();
		var rate=$("#rate").val();
		
		if(text == "")
		{
			$('#expErr').html('*please enter Experience.');
			testimonialForm.experience.focus();
			return false;
		}
		else
		{
			$('#expErr').html('');
		}
		
		if(rate == "0")
		{
			$('#ratErr').html('<br>*please Rate us.');
			testimonialForm.rate.focus();
			return false;
		}
		else
		{
			$('#ratErr').html('');
		}
		
		//$('#testimonialApp').html('<center>Thank you for Your Review.</center>');
		//alert("efa");
	});
		
});
		
	
