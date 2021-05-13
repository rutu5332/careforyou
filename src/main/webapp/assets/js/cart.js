$(document).ready(function($) {
	
	$("input[type='number']").bind("input", function() {
	    //alert("Value changed ");
	    var obj= $(this).parent().parent().parent().children('.total').children('#total').text();
	    //alert("obj :: "+obj);
	    var qty = $(this).val();
	    if(qty < 1){
	    	qty=1;
	    	$(this).val(1);
	    }
	    obj = obj - (($(this).parent().parent()).children('#sub').text());
	    var p=($(this).parent().parent()).children('#price').text();
	    var sub = Math.round(qty * p * 100) / 100;
	    obj = obj + sub;
	    obj= Math.round(obj * 100) / 100;
	    //alert(p + " * " + qty + " = " + p*qty);
	    $.post("Cart.jsp",{'quant':qty+"/"+$(this).parent().parent().children('#proid').val()});
	    ($(this).parent().parent()).children('#sub').html(sub);
	    $(this).parent().parent().parent().children('.total').children('#total').html(obj);
	});
	
});

$(document).ready(function()
		{
			$("#submit").click(function()
			{
				var mno=$("#pcode").val();
				if(mno==''){
					$('#error').html('please enter PinCode');
					pinsubmit.pcode.focus();
					return false;
				}
				else if(mno.length < 6 || mno.length > 6)
				{
					$('#error').html('please enter 6 digits');
					pinsubmit.pcode.focus();
					return false;
				}
				else if(isNaN(mno)) 
				{
					$('#error').html('It only contain numbers');
					pinsubmit.pcode.focus();
		      		return false;
				}
				else
				{
					$('#error').html('');
				}
			});
			
		});