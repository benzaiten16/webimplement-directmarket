$(document).ready(function(){
        //Controla minimo 2 caracteres para titulo producto
	$('#registrar_titulo').on('input', function(){
		var input= $(this);
		var is_name=input.val();
		if(is_name && is_name.length>1){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
        //Controla solo numeros en numref
        $("#registrar_numref").keydown(function(event){
            var input= $(this);
            if(event.shiftKey){
                event.preventDefault();
            }
            if (event.keyCode == 46 || event.keyCode == 8){
                }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                } 
                else {
                if (event.keyCode < 96 || event.keyCode > 105) {
                    event.preventDefault();
                }
                }
            }});
        //Controla que numref no quede vacio    
        $('#registrar_numref').on('input', function(){
            var input= $(this);
		var is_name=input.val();
		if(is_name && is_name.length>0){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
        });    
            
        
	$("#registrar_submit button").click(function(event){
            //selecciono todo el form sin ser el id dropdown
            var form_data=$("form#registrar").serializeArray();;
        console.log(form_data);
            var error_free=true;
            for (var input in form_data){
                var element=$("#registrar_"+form_data[input]['name']);
                var valid=element.hasClass("valid");
                var error_element=$("span", element.parent());
        console.log(input);
        console.log(element);
        console.log(valid);
        console.log("*******************");
                if (!valid){
                    error_element.removeClass("error_no").addClass("error"); 
                    error_free=false;
                   }
                else{
                    console.log("Ingresamos al else");
                    error_element.removeClass("error").addClass("error_no");
                    console.log(valid);
                    }
            }
            if (!error_free){
                event.preventDefault();
            }
            else{
                alert('No errors: Form will be submitted');
            }
        });
	
});