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
<!-- 3975243643
1234 -->
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
			                            <form method="post" action="/upload" modelAttribute = "music"  enctype = "multipart/form-data">
			                                <input type="text" name="query1" onkeyup="funFilter2()" id="query1" placeholder="Search Song" />
			                                <br>
			                     
			                                	<input type="file" name = "songs" multiple = "multiple" required  />
			                                	<input type="text" name = "categoryName" id = "categoryName" />
			                                 <div class="form-group">
				                                <button type="submit" id="send" onclick = "isCategorySelected(event)" class="btn btn-primary btn-sm" >Save</button>
				                            </div>
			                            </form>
			                        </section>
                                </header>
                                <table class = "table" >
	                                <tbody id="t-music">
	                                	<tr>
	                                		<th> Song </th>
	                                		<th> Name </th>
	                                		<th> Type </th>
                                            <th> Size </th>
                                            <th>Operation</th>
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
                                                <td><button type="button" id="${item.fileId}" name="${item.fileName}.${item.fileType}"  class="btn btn-danger btn-sm" onclick='showModal("${item.fileId}")' >Delete</button></td>
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
                                <span id="modalControl">${errorExist}</span>
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
                            <h2> Space </h2>

                            <div class="progress">
                                         <div class="progress-bar" role="progressbar" id="progress" style="width: ${spaceUsed}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                             </div>
                             <span>${freeSpace} MB free of 500 MB</span>
                             <br>
                             <br>
                            <header class="major">
                                <h2 id = "m1"">Menu <super><button type="button" class="btn btn-primary btn-sm" data-toggle = "modal" data-target="#add">ADD</button></super></h2>
                               
                            </header>
                          
                            <ul >
                                
                                <li> <a href="http://localhost:8070/people"> VIEW CONTRIBUTORS</a></li>
                                <li onclick="allSongs()"> ALL SONGS</li>
                                <li>
                                    <span class="opener">MY CATEGORIES</span>
                                    <ul id = "categories">
                                        <c:forEach items="${folders}" var = "item">
                                            <li id ="${item.folder}" onclick="display('${item.folder}')" >${item.folder}</li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            	<li>
                                    <span class="opener"> MOVE FILES</span>
                                    <ul>
                                        <form class="was-validated" action="move" method="post">
  

                                            <label for="DataList-from" class="form-label">From</label>
                                            <input class="form-control" list="datalistOptions-from" name="sourceFolder" onkeyup="inputValue()" id="DataList-from" placeholder="Type to search..." required>
                                            <datalist id="datalistOptions-from">
                                                <c:forEach items="${folders}" var = "item">
                                                    <option value = "${item.folder}">
                                                  
                                                </c:forEach>
                                             
                                            </datalist>
                                            <br>
                                            <label for="DataList-songs" class="form-label">Songs</label>
                                            <input class="form-control" list="datalistOptions-songs" name="song"  id="DataList-songs" placeholder="Type to search..." required>
                                            <datalist id="datalistOptions-songs">
                                                <c:forEach items="${musicList}" var = "item">
                                                    <option value = "${item.fileName}" >
                                                  
                                                </c:forEach>
                                            </datalist>
                                            <br>
                                            
                                            <label for="DataList-to" class="form-label">To</label>
                                            <input class="form-control" list="datalistOptions-to" name="destFolder"  id="DataList-to" placeholder="Type to search..." required>
                                            <datalist id="datalistOptions-to">
                                                <c:forEach items="${folders}" var = "item">
                                                    <option value = "${item.folder}">
                                                  
                                                </c:forEach>
                                            </datalist>
                                            
                                            
                                            <br>
                                              <div class="mb-3">
                                                <button class="btn btn-primary" type="submit" onclick="validateMoveFile()" >MOVE</button>
                                              </div>
                                            </form>
                                    </ul>
                                </li>
                            </ul>
                           
                        </nav>
                  
                    
                </div>
            </div>
            <!-- Modals -->
                  <!-- add category modal -->
						     <div class="container modal fade" id = "add" role = "dialog">
                                <div class="modal-dialog col-md-7 mb-5 mb-md-0">
                                   <div class = "modal-content container">
                                       <div class = "modal-title">
                                        <button type = "button" class = "close" data-dismiss = "modal">&times;</button>
                                       </div>
                                    
                                            <h3 class="mb-5">Add Category</h3>
                                            <form method="post" modelAttribute="folder" action="/add">
                                             <div class="form-control alert-danger" id="catAlert">
                                                    <label   >Category can't be added twice</label>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input type="text"  class="form-control" id="category" name="folder" placeholder="Category" required/>
                                                </div>
                        
                                            <div class="form-group">
                                                    <button type="submit" onclick="appendCategory(event)" id="add-category" class="btn btn-primary  px-4 py-3" >Add</button>
                                                </div>
                                            </form>
                                       
                                </div>
                            </div>
                        </div>
                        <!-- delete modal -->
                        <div class="container modal fade" id = "delete" role = "dialog">
                            <div class="modal-dialog col-md-12">
                               <div class = "modal-content container">
                                   <div class = "">
                                    <button type = "button"  class = "close" data-dismiss = "modal">&times;</button>
                                   </div>
                                
                                        <span class="text-center">Are you sure you want to delete this song?</span>
                                        <br>
                                        <form method="post"  id="deleteId">
                                            <span id="songName"></span>
                                            <div class = "">
                                                <button id="btn-yes" type = "submit" class = "btn btn-default" >Yes</button>

                                                <button id="btn-no" type = "button" class = "btn btn-default" data-dismiss = "modal">No</button>
                                            </div>
                                        </form>
                                   
                            </div>
                        </div>
                    </div>
                        
                        <!-- File Errors handling  -->

                        <div class="container modal fade" id = "fileError" role = "dialog">
                            <div class="modal-dialog col-md-7 mb-5 mb-md-0">
                               <div class = "modal-content container">
                                   <div class = "modal-title">
                                    <button type = "button" class = "close" data-dismiss = "modal">&times;</button>
                                   </div>
                                   <h3 class="mb-5">Error Logs</h3>
                                   <c:forEach items="${fileErrors}" var = "item">
                                        <span>${item}</span> <br>
                                   </c:forEach>
                                       
                                   
                            </div>
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