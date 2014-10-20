$(document).ready(function(){
	$('#registrar_nick').on('input', function(){
		var input= $(this);
		var is_name=input.val();
		if(is_name && is_name.length>2){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
	$('#registrar_mail').on('input', function(){
		var input= $(this);
		var re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		var is_email=re.test(input.val());
		if(is_email){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
	$('#registrar_password').on('input', function(){
		var input= $(this);
		var is_password=input.val();
		if(is_password && is_password.length>2){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
	$('#registrar_passwordR').on('input', function(){
		var input= $(this);
		var is_passwordR=input.val();
		if(is_passwordR==$('#registrar_password').val()){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
	$('#registrar_nombre').on('input', function(){
		var input= $(this);
		var is_name=input.val();
		if(is_name && is_name.length>2){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
	$('#registrar_apellido').on('input', function(){
		var input= $(this);
		var is_surname=input.val();
		if(is_surname && is_surname.length>=3){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
	$('#registrar_fechaNac').on('input', function(){
		var input= $(this);
		var is_fechaNac=input.val();
		if(is_fechaNac){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
	
        
        $('#registrar_nombreComp').on('input', function(){
		var input= $(this);
		var is_name=input.val();
		if(is_name && is_name.length>6){input.removeClass("invalid").addClass("valid");}
		else{input.removeClass("valid").addClass("invalid");}
	});
        
        
        $('#registrar_URLweb').on('input', function() {
            var input=$(this);
            if (input.val().substring(0,4)=='www.'){input.val('http://www.'+input.val().substring(4));}
            var re = /(http|ftp|https):\/\/[\w-]+(\.[\w-]+)+([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])?/;
            var is_url=re.test(input.val());
            if(is_url){input.removeClass("invalid").addClass("valid");}
            else{input.removeClass("valid").addClass("invalid");}
        });
        
        
        $("#registrar_submit button").click(function(event){
            //selecciono todo el form sin ser el id dropdown
            var form_data=$("form#registrar :not('#dropdown,#registrar_nombreComp,#registrar_URLweb')").serializeArray();;
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