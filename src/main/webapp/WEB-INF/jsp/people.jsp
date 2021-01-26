<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/home.css">
    
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script src="js/search.js"></script>
    
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
                            <span id = "catId" >CONTRIBUTORS TO MUSIC</span>
                            
                         </header>
                         <section id="banner">
                            <div class="content">
                                <header>
			                          <section id="search1" class="alt">
			
			       
			                        </section>
                                </header>
                                
                                <div class="container">
                                    
                                    <input type="text" name="person" onkeyup="funFilterPerson()" id="person" placeholder="Search Person" />
                                    <br>
                                        <table class="table">
                                            <tr>
                                                <th>Name</th>
                                                <th>Non-Empty Categories</th>
                                                <th>songs upload</th>
                                                <th>View music</th>
                                            </tr>
                                            <c:forEach items="${people}" var = "item">
                                                <tr >
                                                    <td>${item.fname} ${item.lname} </td>
                                                    <td>${item.categories}</td>
                                                    <td>${item.songs} </td>
                                                    <td>
                                                        <form  action="/user?uid=${item.id}" method="post">
                                                            <button type="submit" id="p${item.id}"   class="btn btn-primary btn-sm">View profile</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                </div>
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

                    <section id="userId" class="alt">
                       <label></label>
                    </section>

                    <!-- Menu --> 
                       <nav id="menu">
                           <header class="major">
                               <h2 id = "m1"">Menu </h2>
                              
                           </header>
                         
                           <ul id = "mypage">
                               
                                <li id ="Mymusic" > <a href="http://localhost:8070/home">MY MUSIC</a></li>
                               
                                
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