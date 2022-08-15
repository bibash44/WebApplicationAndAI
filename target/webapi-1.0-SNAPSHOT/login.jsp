
  
 <jsp:include page="components/header.jsp">
  <jsp:param name="pagetitle" value="COMPUTER FOR YOU | LOGIN" />
</jsp:include>

  <jsp:include page="components/navbar.jsp"/>
   
<!-- partial:index.partial.html -->
<div id="form-wrap">
  <h3>LOGIN</h3>
  <form id="form">
    <p>
      <input type="email" id="email" name="email" placeholder="Email Address" required>
      </p>
    <p>
    <input type="password" id="password" name="password" placeholder="Password" required>
    </p>
   
    <p>
    <button  class="primary-btn" style="width: 100%; text-align:center;" > Login </button>
    </p>
  </form>
  <div id="create-account-wrap">
    <p>Not a member? <a href="./register.jsp">Create Account</a><p>
  </div><!--create-account-wrap-->
</div><!--form-wrap-->
<!-- partial -->
  



  <jsp:include page="components/footer.jsp"/>