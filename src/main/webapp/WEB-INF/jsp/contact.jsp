<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fonts/icomoon/style.css">

 

    
</head>
<body>

<section class="site-section bg-light" id="section-contact">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-5">
            <div class="section-heading text-center">
              <h2><strong>Contact me here</strong> </h2>
            </div>
          </div>
          
          <div class="col-md-7 mb-5 mb-md-0">
            <form class="site-form" >
              <h3 class="mb-5">Get In Touch</h3>
              <div class="form-group">
                <input type="text" class="form-control px-3 py-4" id="name" name="name" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="email" class="form-control px-3 py-4" id="email" name="email" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="tel" class="form-control px-3 py-4" id="tel" name="tel" placeholder="Your Phone"  title="incorrect tel format">
              </div>
              <div class="form-group mb-5">
                <textarea class="form-control px-3 py-4"cols="30" rows="10" id="message" name="message" placeholder="Write a Message"></textarea>
              </div>
              <div class="form-group">
                <button type="button" id="send" class="btn btn-primary  px-4 py-3" >Send Message</button>
              </div>
               <div class="form-group">
                <span id = "target" class=" form-custom primary  px-4 py-3 text-center"></span>
              </div>
            </form>
          </div>
          <div class="col-md-5 pl-md-5">
            <h3 class="mb-5">My Contact Details</h3>
            <ul class="site-contact-details">
              <li>
                <span class="text-uppercase">Email</span>
                freddy980404@gmail.com
              </li>
              <li>
                <span class="text-uppercase">Phone</span>
                +27813767101

              </li>
              <li>
                <span class="text-uppercase">Alternative</span>
                +27792472390
              </li>
              <li>
                <span class="text-uppercase">Address</span>
                Gauteng, Johannesburg <br>
                1449  <br>
                City of Ekurhuleni Metropolitan Municipality
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

<footer class="site-footer">
      <div class="container">
        <div class="row mb-3">
          <div class="col-md-12 text-center">
            <p>
              <a href="https://www.facebook.com/mochene.freddy" target="_blank" class="social-item"><span class="icon-facebook2"></span></a>
              <a href="https://www.linkedin.com/in/mochene-freddy-lebogo-637a591b7" target="_blank" class="social-item"><span class="icon-linkedin2"></span></a>
              <a href="https://www.github.com/mochenel" target="_blank" class="social-item"><span class="icon-github"></span></a>
            </p>
          </div>
        </div>
        <div class="row">
            <p class="col-12 text-center">
            Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved 
            </p>
        </div>
      </div>
    </footer>


 
</body>
</html>