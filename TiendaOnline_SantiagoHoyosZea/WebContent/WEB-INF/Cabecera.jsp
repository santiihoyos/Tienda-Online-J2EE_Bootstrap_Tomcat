<%@page import="modelado.Usuario"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<img id="icono" src="imagenesWeb/icono.png" />
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Menu</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="titulo" href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=index">Tienda Ubuntu</a>
		</div>
		
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<%
			//si en sesión no hay ningún usuario eso quiere decir que no hay un login por lo que imprime la cabecera de invitado.
			if(request.getSession().getAttribute("usuario")==null){ %>
			<ul class="nav navbar-nav">
				<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=index">Inicio</a></li>
				<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=login">Iniciar Sesión </a></li>
				<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=registrar">Registrarse </a></li>
			</ul>
			<%}else{
				//comprobacion del nivel de privilegios del usuario para saber si es admin o no lo es e imprime
				//una cabecera u otra segun sea.
				if(!((Usuario)request.getSession().getAttribute("usuario")).getPrivilegio().equals("cliente")){%>
					<ul class="nav navbar-nav">
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=index">Inicio</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=carrito">Carrito
						(<%=request.getCookies()==null?0:request.getCookies().length-1%>)</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=config">Mi Perfil</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=admin">Panel Administración</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=salir">Cerrar Sesi&oacute;n</a></li>
					</ul>
			<%}else{%>
					<ul class="nav navbar-nav">
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=index">Inicio</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=carrito">Carrito
						(<%=request.getCookies()==null?0:request.getCookies().length-1%>)</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=config">Mi perfil</a></li>
						<li><a href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=salir">Cerrar Sesi&oacute;n</a></li>
					</ul>
			<%}%>
			<%}%>
		</div>
	</div>
	</nav>
	
	<div class="container">
		<div class="row">
		
		<%  //Comprueba que se está en index antes de decidir si imprime o no el slider o no
		String estilo_menu="";
		if(request.getParameter("accion")==null || request.getParameter("accion").equals("index")){ 
		estilo_menu="style=\"{width=100%}\"";%>
		
		      <div id="slider" class="col-md-9">
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="/TiendaOnline_SantiagoHoyosZea/imagenesProductos/1.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/TiendaOnline_SantiagoHoyosZea/imagenesProductos/2.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/TiendaOnline_SantiagoHoyosZea/imagenesProductos/3.jpg" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
	<%}%>
		<%	
		//comprueba que la pagina en la que esta no es la del panel.
		if(request.getParameter("accion")==null || !request.getParameter("accion").equals("admin") 
		&& !request.getParameter("accion").equals("gestorProductos") && !request.getParameter("accion").equals("gestorFotos")){%>

			<div class="col-md-3">
				<p class="lead" style="margin-top: 2%;">Productos:</p>
				<div class="list-group" id="categorias" >
					<a
						href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=productos&productos=todos"
						class="list-group-item">Todos</a> <a
						href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=productos&productos=vestible"
						class="list-group-item">Vestibles</a> <a
						href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=productos&productos=accesorio"
						class="list-group-item">Accesorios</a> <a
						href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=productos&productos=software"
						class="list-group-item">Software</a><a
						href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=productos&productos=soporte"
						class="list-group-item">Soporte</a><a
						href="/TiendaOnline_SantiagoHoyosZea/index.jsp?accion=productos&productos=ultimo"
						class="list-group-item">Últimas existencias</a>
				</div>
			</div>
		<%}%>
			
			