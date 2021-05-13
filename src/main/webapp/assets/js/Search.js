
$(document).ready(function()
{
	//var names="ndsjdef/flskm/eigjt/oesjgwt/kwjgje/ojwgota/";
	var names=$('#names').val().trim();
	//console.log(names);
	var idlst=($('#id').val().trim()).split("/");
	var lst=names.split("/");
	var cat=($('#cat').val().trim()).split("/");
	var deglst=($('#degree').val().trim()).split("/");
	console.log($('#cat').val());
	console.log($('#degree').val());
	$("#search").on('keyup',function()
	{
		var value=$('#search').val().toLowerCase();
		console.log(value);
		var cnt=0;
		$(this).parent().children('.suggestions').html("");
		for(var i=0 ; i<lst.length ; i++)
		{
			if(lst[i].toLowerCase().includes(value) && value != "" && cnt<=10 )
			{
				$(this).parent().children('.suggestions').append("<div><a href=\"Product.jsp?id="+idlst[i]+"\">"+lst[i]+"</a></div>");
				cnt++;
			}
			/*if(deglst[i].toLowerCase().includes(value) && value != "" && i<10)
			{
				console.log(deglst[i]);
				$(this).parent().children('.suggestions').append("<div><a href=\"doctor-info.jsp?id="+idlst[i]+"\">"+deglst[i]+"</a></div>");
			}*/
		}
		for(var i=1 ; i<cat.length ; i++)
		{
			if(cat[i].toLowerCase().includes(value) && value != "" && cnt<=10 )
			{
				$(this).parent().children('.suggestions').append("<div><a href=\"medicine.jsp?id="+i+"\">"+cat[i]+"</a></div>");
				cnt++;
			}
		}
		for(var i=1 ; i<deglst.length ; i++)
		{
			if(deglst[i].toLowerCase().includes(value) && value != "" && cnt<10)
			{
				$(this).parent().children('.suggestions').append("<div><a href=\"doctor.jsp?id="+i+"\">"+deglst[i]+"</a></div>");
				cnt++;
			}
		}
	});
		
});
		
	
