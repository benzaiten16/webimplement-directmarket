<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="media/styles/main.css">

<!-- Para evitar ver caracteres raros -->
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="es" />

<!-- para el icono de la página -->
<link href="media/images/favicon.ico" rel="icon" type="image/x-icon" />
<link href="media/images/favicon.ico" rel="shortcut icon" />

 <div class="contenedor_principal main">
            <div class="izquierda">
                <h2>Ingresa tus datos para iniciar sesión</h2>
            </div>
            <div class="derecha">
                <!-- formulario de login -->
                <form action="iniciar-sesion" method="POST">
                    <input class="input_blur" type="text" name="login"
                           value="email..."	onMouseDown="sacarBlurReset(event);"/>
                    <br/>
                    <input type="password" name="password"/>
                    <br/>
                    <input type="button" value="Entrar" onclick="submit()"/>
                </form>
            </div>
        </div>