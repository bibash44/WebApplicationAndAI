<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | REGISTER" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<!-- partial:index.partial.html -->
<div id="form-wrap">
    <h3>REGISTER</h3>
    <form id="form" method="post" action="register" >

        <p>
            <input type="text" id="fname" name="fname" placeholder="First name" required>
        </p>
        <p>


        <p>
            <input type="text" id="lname" name="lname" placeholder="Last name" required>
        </p>
        <p>

        <p>
            <input type="email" id="email" name="email" placeholder="Email Address" required>
        </p>

        <p>
            <input type="number" id="phonenumber" name="phonenumber" placeholder="Phone number" required>
        </p>

        <p>
            <input type="text" id="streetaddress" name="streetaddress" placeholder="Street address" required>
        </p>

        <p>
            <input type="text" id="housenumber" name="housenumber" placeholder="House number" required>
        </p>

        <p>
            <input type="text" id="city" name="city" placeholder="City " required>
        </p>

        <p>
            <input type="text" id="postcode" name="postcode" placeholder="Post code " required>
        </p>

        <p>
            <input type="password" id="password" name="password" placeholder="Password" required>
        </p>

        <p>
            <button type="submit" class="primary-btn" style="width: 100%; text-align:center;"> Register </button>
        </p>
    </form>
    <div id="create-account-wrap">
        <p>Already a member? <a href="./login.jsp">Click here to login</a>
        <p>
    </div>
    <!--create-account-wrap-->
</div>
<!--form-wrap-->
<!-- partial -->



<jsp:include page="components/footer.jsp" />