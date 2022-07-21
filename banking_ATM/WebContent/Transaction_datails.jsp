<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction_datails.jsp</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style>
		.l-main{
			height:100%;
			overflow:scroll !important;
		}
	</style>
	
</head>
<body>

	
	<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="l-main">
	<nav class="navbar navbar-expand-lg bg-light">
      <!-- <div>
        <image src="images/bank-logo.png" class="logo">
      </div> -->
      <div class="container-fluid">
        <a class="navbar-brand container" href="#">National Bank of India</a>  
      </div>
    </nav>
    
    
       
<section class="background-radial-gradient overflow-hidden">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap');
*{
    font-family: 'Poppins', sans-serif;
}
.l-wr{
    transform: scale(0.6);
}
.l-main{
    height: 92vh;
}
.logo {

    width:  20%;
    /* height: 20%; */
}


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
  </style>

  <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5 ">
    <div class="row gx-lg-5 align-items-center mb-5">
      <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
        

        <div class="bg-white tableCl">
        	<%
			String error_massage = (String)session.getAttribute("error_massage");
			if(error_massage!=null)
			{
				out.println("<p style='color:red'>"+error_massage+"</p>");
				session.removeAttribute("error_massage");				
			}

		%>
        
          <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">Amount</th>
                  <th scope="col">Transaction Type</th>
                  
                </tr>
              </thead>
              <tbody>
                <c:set var="total_amount" value="${0}"/>
		<c:set var="main_id" value="${0}"></c:set>
		
		
		
		<s:forEach items="${sessionScope.trans_ls}" var="i">
			
			<c:set var="main_id" value="${i.custom_id.rid}"></c:set>
			
			<c:set var="total_amount" value="${total_amount + i.amount}" />
		
			<tr>
				<td scope="row">${i.amount}</td>
				<td>${i.transaction_type}</td>
			</tr>
		
	
				
		</s:forEach>
		
		
              </tbody>
            </table>

		

       </div>   
        
        <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
         Total Amount: <br> <span class="total_amount"> <c:out value="${total_amount}"></c:out> Rs </span><br />
          <!-- <span style="color: hsl(218, 81%, 75%)">for you </span> -->
        </h1>
        

      </div>

      <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
        <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
        <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

        <div class="card bg-glass">
          <div class="card-body px-4 py-5 px-md-5">
            <form action="MainController" method="post">
              
              

              <!-- Password input -->
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Transaction Type</label>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="select_type" value="credit" id="flexRadioDefault1">
                  <label class="form-check-label" for="flexRadioDefault1">
                    Credit
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="select_type" value="debit"  id="flexRadioDefault2">
                  <label class="form-check-label" for="flexRadioDefault2">
                    Debit
                  </label>
                </div>
              </div>

              <div class="form-outline mb-4">
                <input type="number" id="form3Example3" class="form-control" name="enter_amount" value="500"/>
                <label class="form-label" for="form3Example3">Amount</label>
              </div>

				
				<input type="hidden" name="user_id" value="${main_id}">
				
				<input type="hidden" name="total_amount" value="${total_amount}">
             
              <button type="submit" class="btn btn-primary btn-block mb-4" name="flag" value="enter_money">
                Transaction
              </button>

            </div>
             
            </form>
           </div>
        </div>

        
      </div>
    </div>
  </div>
</section>
</div>	
<!-- Section: Design Block -->
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</body>
</html>