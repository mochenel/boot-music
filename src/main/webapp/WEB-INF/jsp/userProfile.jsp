<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/home.css">
    <script src="js/jquery.min.js"></script>
 
      <script src="js/switch.js"></script>
        <script src="js/search.js"></script>
        <script src="js/AddCategory.js"></script>
         <script src="js/modalopen.js"></script>
         <script src="js/rightclick.js"></script>
    
</head>
<body>
    <%
    if(session.getAttribute("userID") == null){
    response.sendRedirect("");
    }
    
    
    %>
  <div id="wrapper">

         <!-- Main --> 
            <div id="main">
                <div class="inner">
                   
                		<form action="/" method="post" >
 							<div id="logout-div">
                                <button type="submit" id="logout" class="btn btn-sm" >LogOut</button>
				            </div>
                         </form>   
                          <!-- Header --> 
                    <header id="header">
                        <span id = "catId" >No Category selected</span>
                        
                     </header>
                     

                     <!-- Banner --> 
                        <section id="banner">
                            <div class="content">
                                <header>
			                          <section id="search1" class="alt">
			                            
			                                <input type="text" name="query1" onkeyup="funFilter2()" id="query1" placeholder="Search Song" />
			                                <br>
			                     
			                             
			                                	<input type="text" name = "categoryName" id = "categoryName" />
			                               
			                           
			                        </section>
                                </header>
                                <table class = "table" >
	                                <tbody id="t-music">
	                                	<tr>
	                                		<th> Song </th>
	                                		<th> Name </th>
	                                		<th> Type </th>
                                            <th> Size </th>
                
	                                	</tr>
	                                	<c:forEach items="${musicList}" var = "item">
		                                	<tr name="${item.getCategoryName}" >
		                                		<td>
		                                		  <audio controls>
												      <source src="music/${item.fileName}.ogg" type="audio/ogg">
												      <source src="music/${item.fileName}.${item.fileType}" type="audio/mpeg">
												  </audio>
		                                		</td>
		                                		<td>${item.fileName}</td>
		                                		<td>${item.fileType}</td>
                                                <td>${item.fileSize} MB</td>
                                               
		                                	</tr>
	                       				</c:forEach>
	                                </tbody>	
                                </table>
                           
                            </div>
                          
                        </section>


                    <!-- Section --> 
                        <section>
                            <header class="major">

                            </header>
                            <div class="posts">
                               
                                <article>
                       
                                           
                                </article>
                            </div>
                        </section>

                </div>
            </div>

        <!-- Sidebar --> 
            <div id="sidebar">
                <div class="inner">

                     <!-- Search --> 
                        <section id="search2" class="alt">
                            <form method="post" action="#">
                                <input type="text" name="query2" id="query2" onkeyup="funFilter()" placeholder="Search Category" />
                            </form>
                        </section>

                     <!-- Menu --> 
                        <nav id="menu">
                            <header class="major">
                                <h2 id = "m1">Menu </h2>
                               
                            </header>
                          
                            <ul id = "categories">
                                <li  onclick="allSongs()" >All Songs</li>
                            	<c:forEach items="${folders}" var = "item">
	                                <li id ="${item.folder}" onclick="display('${item.folder}')" >${item.folder}</li>
                       			</c:forEach>
                            </ul>
                        </nav>
                      
                          
            

                    
                </div>
            </div>

    </div>

    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/browser.min.js"></script>
    <script src="js/breakpoints.min.js"></script>
    <script src="js/util.js"></script>
    <script src="js/main.js"></script>
</body>
</html>