<nav class="navbar navbar-default">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" style="background-color: #fff;" href="#"><img src="<?php echo full_url;?>/web/img/logo_park.png" width="30"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown facebook_font">
			<a href="#" class="dropdown-toggle facebook_font" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-text-o"></i> Solicitudes<span class="caret"></span></a>
          <ul class="dropdown-menu">
			 <li><a href="<?php echo full_url;?>/fun/reservacion/index.php">Generar solicitud</a></li>
            <li><a href="<?php echo full_url;?>/fun/solicitudes_fun/index.php">Consultar solicitudes</a></li>

          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
		<li class="dropdown facebook_font">
			<a href="#" class="dropdown-toggle facebook_font" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i> Mi cuenta <span class="caret"></span></a>
          <ul class="dropdown-menu">
			<li><a href="<?php echo full_url;?>/fun/users_data/index.php?action=edit" class="">Datos personales</a></li>
			<li><a href="<?php echo full_url;?>/fun/users/index.php?action=change_pass_view" class="">Cambio de clave</a></li>
          </ul>
        </li>
        <li><a class="facebook_font text-right" href="<?php echo full_url;?>/fun/index.php?action=logout"><i class="fa fa-sign-out"></i> Cerrar sesión</a></li>

      </ul>
    </div><!-- /.navbar-collapse -->
</nav>
