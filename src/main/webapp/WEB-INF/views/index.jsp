<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Proyect Demo 5</title>
<!-- En las vistas .jsp, se puede usar la siguiente directiva para construir las rutas a los recursos est�ticos:
		 ${pageContext.request.contextPath} 
     
     En este proyecto se ha optado por indicarlas de forma est�tica, pero si cambia en las controladoras la ubicaci�n l�gica y relativas mapeadas, podr�an producirse
     errores de acceso a los recursos (.js, .css) si no se actualizan manualmente.
-->
<link rel="stylesheet" href="./styles/index.css">

</head>
<body>
    <div class="cabecera">
        <div class="cab1"></div>
        <div class="cap2"></div>
    </div>
    <div class="cuerpo">
        <div class="panel1">
            <div class="nota"><div class="notacab1"><p>Proyecto</p></div>
                              <div class="notabody"><p style="text-align: center;"><span>#Spring Proyect Demo 5</span></p>
                            </div>
            </div>
            <div class="nota"><div class="notacab1"><p>Objetivos</p></div>
                              <div class="notabody"><p class="objetivos">- <b>I</b>nyecci�n de dependencias.</p>
                              						<p class="objetivos">- <b>C</b>reaci�n de ficheros de configuraci�n o parametrizaci�n de la aplicaci�n.</p>   
                              </div>        
                            
            </div>
            <!-- Se muestran las propiedades del proyecto, pero esta vez, algunas han sido obtenidas desde ficheros de parametrizaci�n. -->
            <div class="nota"><div class="notacab2"><p>Entorno de Desarrollo</p></div>
                              <div class="notabody"><p><span>Ide:</span> ${ProyectData.ide}</p>
                                                    <p><span>Servidor:</span> ${ProyectData.servidor}</p>
                                                    <p><span>Jdk:</span> ${ProyectData.jdk}</p>
                            </div>
            </div>
            <div class="nota"><div class="notacab2"><p>Estandar de Desarrollo</p></div>
                              <div class="notabody"><p><span>Gestor de proyecto:</span> ${ProyectData.gestorProyecto}</p>
                                                    <p><span>Id Artefacto maven:</span> ${ProyectData.idArtefactoMaven}</p>
                                                    <p><span>Faceta:</span> ${ProyectData.faceta}</p>
                            </div>
            </div> 
            <div class="nota"><div class="notacab2"><p>Dependencias</p></div>
                              <div class="notabody"><p><span>Spring Framework:</span> Spring, versi�n 5.3.22. M�dulos: Spring Web MVC</p>
                                                    <p><span>Javax servlet:</span> versi�n: 4.0.1</p>
                            </div>
            </div>    
            <div class="nota"><div class="notacab2"><p>Documentaci�n y Sitios de Inter�s</p></div>
                              <div class="notabody"><p><a href="https://mvnrepository.com/" target="_blank">Ir a</a> Maven Repository</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/" target="_blank">Leer</a> Documentaci�n de Spring</p>
                                                    <p><a href="https://proitcsolution.com.ve/inyeccion-de-dependencias-spring/" target="_blank">Leer</a> Inyecci�n de dependencias con Spring</p>
                            </div>
            </div>         
        </div>
        <div class="panel2">
            <div class="item"><p><span>An�lisis 1 - Inyecci�n de dependencias:</span> En este an�lisis, se le ofrece un ejemplo de como haciendo uso de la inyecci�n de dependencias de spring se puede a�adir al proyecto ficheros con par�metros.</p>
            				  <p>En primer lugar, lo que se ha hecho en el fichero app-context.xml que configura el contenedor del contexto de la aplicaci�n, es a�adir los ficheros con los par�metros; context:property-placeholder</p>
            				  <p>Por otro lado, se ha indicado en dicho fichero app-context.xml que spring escane� los componentes (beans) que se crear�n bajo es.dsw.configs.</p>
            				  <p>En es.dsw.configs, se define la clase del bean denominada ApplicationData y en ella se realiza la inyecci�n de dependencias desde los ficheros @Value</p>
            				  <p>Adem�s, dado que el bean se lo tenemos que solicitar al contenedor del contexto de la aplicaci�n, se ha creado un atributo estatico que permitir� acceder al contexto de la aplicaci�n en cualquier momento. Para ello desde el evento onStartup, se asigna un ServletContext que permitir� acceder al contexto.</p>
            </div>
            <div class="item"><p><span>Reto:</span> En este proyecto, se garantiza que spring lea los ficheros con los par�metros una vez por cada cliente/sesi�n. Sin embargo, por cada cliente diferente (ej: accediendo en local desde diferentes navegadores) se le� los ficheros. �Podr�as modificar el c�digo para garantizar que solamente se lea una �nica vez los ficheros con par�metros durante todo el ciclo de ejecuci�n de la aplicaci�n?.</p>

            </div>
        </div>
    </div>
    <div class="pie"><p><span>�</span> 2022 - Daniel P�rez P�rez</p></div>

</body>
</html>