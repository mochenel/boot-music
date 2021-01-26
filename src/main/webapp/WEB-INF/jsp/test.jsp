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
    
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
    <script src="js/modalopen.js"></script>
    <script src="js/validation.js"></script>
    
</head>
<body>


        <div>
                
                <nav class="navbar navbar-expand-lg site-navbar navbar-light bg-light" id="pb-navbar">

                <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

            
                <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample09">
                    <ul class="nav navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8070/contact">Contact us</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle = "modal" data-target="#SignIn">Sign In</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle = "modal" data-target="#SignUp">Sign Up</a></li>
                    </ul>
                </div>
                </div>
            </nav>
           
       
                <div class="container modal fade" id = "SignIn" role = "dialog">
                    <div class="modal-dialog col-md-7 mb-5 mb-md-0">
                        <div class = "modal-content container">
                            <div class = "modal-title">
                            
                                <button type = "button" class = "close" data-dismiss = "modal">&times;</button>
                            </div>
                            <form action = "signIn" method = "POST" modelAttribute = "login" class="site-form" id = "form1">
                            <h3 class="mb-5">Sign In</h3>
                            <div class="form-group">
                              <div class="form-group">
                              	<label class="form-control alert-danger text-center" id = "loginError">${Error1}</label>
                              </div>
                                <input type="email" class="form-control px-3 py-4" id="email0" name="email" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control px-3 py-4" id="pwd0" name="pwd" placeholder="Password"/>
                            </div>
                              <div class="form-group">
                                <input type="text" class="form-control px-3 py-4" id="id" name="id" value ="0" placeholder="id"/>
                            </div>
                            
                            
                            <div class="form-group">
                                <button type="submit" id="submit1" class="btn btn-primary  px-4 py-3" >Sign In</button>
                                
                            </div>
                            <div class="form-group">
                                <a href ="#" >Forgot password?</a>
                                
                            </div>
                            <div class="form-group">
                                <span id = "target" class=" form-custom primary  px-4 py-3 text-center"></span>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class=" container modal fade" id = "SignUp" role = "dialog">
                    <div class="modal-dialog col-md-7 mb-5 mb-md-0">
                        <div class = "modal-content container">
                            <div class = "modal-title">
                            
                                <button type = "button" class = "close" data-dismiss = "modal">&times;</button>
                            </div>
                            <form  action = "signUp" modelAttribute = "user" method = "POST" id = "form2" >
                            <h3 class="mb-5">Create Account</h3>
                             <div class="form-group">
                              	<label class="form-control alert-danger text-center" id = "registerError">${Error2}</label>
                              </div>
                            <div class="form-group">
                                <input type="tel" class="form-control px-3 py-4" id="contact" value = "${contact}" name="contact" placeholder="Phone Number" required/>
                            </div>
                             <div class="form-group">
                                <input type="email" class="form-control px-3 py-4" id="email" value = "${email}" name="email" placeholder="Email" required/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control px-3 py-4" id="fname" value = "${fname}" name="fname" placeholder="First Name" required/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control px-3 py-4" id="lname" value = "${lname}" name="lname" placeholder="Last Name" required/>
                            </div>
                            <div class="form-group " >
                               <select class="custom-select" id="gender" name = "gender" required >
                                   <option   value = "" selected> Select Gender</option>
                                   <option value = "M" > Male</option>
                                   <option value = "F" > Female</option>
                               </select>
                            </div>
                           
                            <div class="form-group">
                                <input type="password" class="form-control px-3 py-4" id="pwd" name="pwd" placeholder="Password" required/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control px-3 py-4" id="cpwd" name="cpwd" placeholder="Confirm Password" required/>
                            </div>
                            
                        
                            <div class="form-group">
                                <button type="submit" id="submit2" class="btn btn-primary  px-4 py-3" >Sign Up</button>
                            </div>
                         
                            </form>
                        </div>
                    </div>
                </div>

            <!-- successful sign up modal -->
            <div class="container modal fade" id = "successful-modal-signUp" role = "dialog">
                <div class="modal-dialog col-md-12">
                   <div class = "modal-content container">
                       <div class = "">
                        <button type = "button"  class = "close" data-dismiss = "modal">&times;</button>
                       </div>
                    
                            <span class="text-center">Your sign up was successful, you can  now login</span>
                            <br>
                           
                            <button id="btn-no" type = "button" class = "btn btn-default" data-dismiss = "modal">OK</button>

                </div>
            </div>
        </div>

           
            <section class="site-hero"  id="section-home" data-stellar-background-ratio="0.5">
                <div class="container">
                <div class="row intro-text align-items-center justify-content-center">
                    <div class="col-md-10 text-center">
                    <h1 class="site-heading site-animate">Welcome to  <strong>social music </strong></h1>
                    <p class="lead site-subheading mb-4 site-animate">share music with friends</p>
                    <p><a href="#" class="smoothscroll btn btn-primary px-4 py-3">Listen to music</a></p>
                    </div>
                </div>
                </div>
            </section>

        </div>

    
            <p id="success" style="display: none;"> ${success}</p>
       
</body>
</html>