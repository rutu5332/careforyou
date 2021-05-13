$(function() {
  
  $("form[name='insert']").validate({
    rules: {
      name: 
    	  {
    	  	required: true
    	  },
      details: {
    	  required:true
      },
      stock: {
    	  required:true
      },
      brand:{
    	  required:true
      },
      ing:{
    	  required:true
      },
      code:{
    	  required : true
    	 
      },
      type:{
    	required : true  
      },
      mfg: {
        required: true
        
      },
      sp: {
        required: true
       
      },
      units:{
      	required : true  
        },
        measur:{
        	required : true  
          },
          status:{
          	required : true  
            },
            image:{
            	required : true  
              }
    },
   
    messages: {
      name: {
    	  required:"Please enter product name"
    	  },
      details: {
    	  required:"Please enter product description"
	  },
	  stock: {
    	  required:"Please enter stock",
    		  minlength:1
	  },
	  brand: {
    	  required:"Please enter brand name"
	  },
	  ing: {
    	  required:"Please enter ingredients"
	  },
	  code:{
		  required :"Please enter product code"
		  
	  },
	  mfg :{
		  required:"Please enter price"  
	  },
      sp: 
	  {
    	  required:"Please enter selling price"
    	 
	  },
	  
      type:
      {
        required: "Please select type"
       
      },
      units:{
		  required:"Please enter units"  
	  },
	  measur:{
		  required:"Please enter measurement"  
	  },
	  status:{
		  required:"Please enter status"  
	  },
	  image:{
		  required:"Please enter image"  
	  }
     
    },
    
    submitHandler: function(form) {
      form.submit();
    }
  });
});