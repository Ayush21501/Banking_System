<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show_CustmerData.jsp</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    
    <style>
        .main-cls{
            height: calc(100vh - 56px);
        }

    </style>
</head>
<body>

	<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
	
	 <nav class="navbar navbar-expand-lg bg-light">
      <!-- <div>
        <image src="images/bank-logo.png" class="logo">
      </div> -->
      <div class="container-fluid">
        <a class="navbar-brand container" href="#">National Bank of India</a>  
      </div>
    </nav>

    <section class="background-radial-gradient overflow-hidden main-cls">
        <style>
          .background-radial-gradient {
            background-color: hsl(218, 41%, 15%);
            background-image: radial-gradient(650px circle at 0% 0%,
                hsl(218, 41%, 35%) 15%,
                hsl(218, 41%, 30%) 35%,
                hsl(218, 41%, 20%) 75%,
                hsl(218, 41%, 19%) 80%,
                transparent 100%),
              radial-gradient(1250px circle at 100% 100%,
                hsl(218, 41%, 45%) 15%,
                hsl(218, 41%, 30%) 35%,
                hsl(218, 41%, 20%) 75%,
                hsl(218, 41%, 19%) 80%,
                transparent 100%);
          }
      
          #radius-shape-1 {
            height: 220px;
            width: 220px;
            top: -60px;
            left: -130px;
            background: radial-gradient(#44006b, #ad1fff);
            overflow: hidden;
          }
      
          #radius-shape-2 {
            border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
            bottom: -60px;
            right: -110px;
            width: 300px;
            height: 300px;
            background: radial-gradient(#44006b, #ad1fff);
            overflow: hidden;
          }
      
          .bg-glass {
            background-color: hsla(0, 0%, 100%, 0.9) !important;
            backdrop-filter: saturate(200%) blur(25px);
          }
          
          .account_ty{
          	font-size:40px;
          }
          
          .hoder_name{
          	width:50rem;
          }
        </style>
      
        <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5 ">
          <div class="row gx-lg-5 align-items-center mb-5">
            <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
            	<s:forEach items="${sessionScope.list}" var="i">
            
              <h1 class="my-5 display-5 fw-bold ls-tight hoder_name" style="color: hsl(218, 81%, 95%)">
               	Account Hoder: ${i.firstname} ${i.lastname} <br />
                <span class="account_ty" style="color: hsl(218, 81%, 75%)">Account Type: ${i.account_type} </span>
              </h1>
              <!-- <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                Temporibus, expedita iusto veniam atque, magni tempora mollitia
                dolorum consequatur nulla, neque debitis eos reprehenderit quasi
                ab ipsum nisi dolorem modi. Quos
              </p> -->

              <div>
              <a href="MainController?rid=${i.rid}&&flag=delete_user" class="btn btn-outline-danger">Delete Account</a>
              <a href="MainController?rid=${i.rid}&&flag=edit_user" class="btn btn-outline-success">Edit Account</a>
              
            </div>

                <div class="mt-5">
                	<a href="MainController?rid=${i.rid}&&flag=trans_history" class="btn btn-outline-primary btn-lg">Show Your Transaction History</a>
                </div>
                </s:forEach>
            </div>
      
            
            <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>
            </div>
                             
            </div>
            </div>
          
        </div>
      </section>

    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  

</body>
</html>