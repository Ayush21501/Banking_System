<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit_customer.jsp</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  
    <style>

	.gradient-custom {
    /* fallback for old browsers */
    background: #f093fb;
    
    /* Chrome 10-25, Safari 5.1-6 */
    background: -webkit-linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1));
    
    /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    background: linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1))
    }
    
    .card-registration .select-input.form-control[readonly]:not([disabled]) {
    font-size: 1rem;
    line-height: 2.15;
    padding-left: .75em;
    padding-right: .75em;
    }
    .card-registration .select-arrow {
    top: 13px;
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

      <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
          <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
              <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                <div class="card-body p-4 p-md-5">
                  <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                  <form action="MainController" method="post">
	
					<s:forEach items="${sessionScope.list}" var="i">
					
					<input type="hidden" name="rid" value="${i.rid}">
					
                    <div class="row">
                      <div class="col-md-6 mb-4">
      
                        <div class="form-outline">
                          <input type="text" name="fn" value="${i.firstname}" id="firstName" class="form-control form-control-lg" />
                          <label class="form-label" for="firstName">First Name</label>
                        </div>
      
                      </div>
                      <div class="col-md-6 mb-4">
      
                        <div class="form-outline">
                          <input type="text" id="lastName" name="ln" value="${i.lastname}" class="form-control form-control-lg" />
                          <label class="form-label" for="lastName">Last Name</label>
                        </div>
      
                      </div>
                    </div>
      
                    
      
                    <div class="row">
                      <div class="col-md-6 mb-4 pb-2">
      
                        <div class="form-outline">
                          <input type="text" name="un" value="${i.username}" id="emailAddress" class="form-control form-control-lg" />
                          <label class="form-label" for="emailAddress">UseName</label>
                        </div>
      
                      </div>
                      <div class="col-md-6 mb-4 pb-2">
      
                        <div class="form-outline">
                          <input type="password" name="pw" value="${i.password}" id="phoneNumber" class="form-control form-control-lg" />
                          <label class="form-label" for="phoneNumber">Password</label>
                        </div>
      
                      </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4 pb-2">
        
                          <div class="form-outline">
                            <input type="number" id="emailAddress" class="form-control form-control-lg" value="1000"/>
                            <label class="form-label" for="emailAddress">Enter Amount in Bank</label>
                          </div>
        
                        </div>
                    </div>
      
                    <div class="row">
                      <div class="col-12">      
                        <select class="select form-control-lg" name="acc_type">
                          	<option value="Saving">Saving</option>
			  				<option value="Current">Current</option>
                        </select>
                        <label class="form-label select-label">Choose option Of Account Type</label>
      
                      </div>
                    </div>

                    
      
                    <div class="mt-4 pt-2">
                      <input class="btn btn-primary btn-lg" type="submit" name="flag" value="update_userdata" />
                    </div>
      				</s:forEach>
	
					</form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
 

		

</body>
</html>