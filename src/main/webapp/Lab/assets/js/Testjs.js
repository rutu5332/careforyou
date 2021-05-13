
$(document).ready(function()
{
	$("#submitTest").click(function()
	{
		var mtest=($("#MainTest").val()).trim();	
		var name=($("#Name").val()).trim();	
		var price=($("#Price").val()).trim();
		var phid=$("#PhId").val().trim();
		var phids=$("#phids").val().trim();
		
		var re1=/^[# ]*$/;
		var re = /^[a-zA-Z ]*$/;
		
		if(mtest=='0'){
			$('#errorMaintest').html('Please select MainTest');
			testform.MainTest.focus();
			return false;
		}
		else
		{
			$('#errorMaintest').html('');
		}
		
		if(name==''){
				$('#errorname').html('please enter name');
				testform.Name.focus();
				return false;
		}
		if(!(re.test(name))) 
		{
			$('#errorname').html('name must contain only letters');
			testform.Name.focus();
      		return false;
		}
		else
		{
			$('#errorname').html('');
		}
		
		
		
		//Price
		if(price==''){
			$('#errorprice').html('Please enter Price');
			testform.Price.focus();
			return false;
		}
		else if(isNaN(price)) 
		{
			$('#errorprice').html('Price only contain numbers');
			testform.Price.focus();
      		return false;
		}
		else
		{
			$('#errorprice').html('');
		}
		
		//Id
		if(phid==''){
			$('#errorphid').html('Please enter Phlebotomist Id');
			testform.PhId.focus();
			return false;
		}
		else if(isNaN(phid)) 
		{
			$('#errorphid').html('Only enter number');
			testform.PhId.focus();
      		return false;
		}
		else if(phids.indexOf(phid) == -1)
		{
			$('#errorphid').html('No such Phlebotomist Exits');
			testform.PhId.focus();
      		return false;
		}
		else
		{
			$('#errorphid').html('');
		}
		
		
	});
		
});
		
	
