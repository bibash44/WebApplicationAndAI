<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | REGISTER" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<!-- partial:index.partial.html -->
<div id="form-wrap">
    <h3>REGISTER</h3>



    <div id="form" method="post" action="register">

        <span id="validation-text" style="color: red; margin: 5px; font-weight: bold; float: left;"></span>

        <p>
            <input type="text" id="fname" name="fname" placeholder="First name">
        </p>
        <p>


        <p>
            <input type="text" id="lname" name="lname" placeholder="Last name">
        </p>
        <p>

        <p>
            <input type="email" id="email" name="email" placeholder="Email Address">
        </p>

        <p>
            <input type="tel" id="phonenumber" name="phonenumber" placeholder="Phone number">
        </p>

        <p>
            <input type="text" id="streetaddress" name="streetaddress" placeholder="Street address">
        </p>

        <p>
            <input type="number" id="housenumber" name="housenumber" placeholder="House number">
        </p>

        <p>
            <input type="text" id="city" name="city" placeholder="City ">
        </p>

        <p>
            <input type="text" id="postcode" name="postcode" placeholder="Post code ">
        </p>

        <p>
            <input type="password" id="password" name="password" placeholder="Password">
            <i class="fa fa-eye" style="float: left; margin: 1%;" onclick="visiblePassword()" id="toogle-password"></i>
        </p>

        <p>
            <button id="btn-register" class="primary-btn" style="width: 100%; text-align:center;"> Register </button>

        </p>


    </div>
    <!-- <button id="btn-register" class="primary-btn" style="width: 100%; text-align:center;"> Check register </button> -->
    <div id="create-account-wrap">
        <p>Already a member? <a href="./login.jsp">Click here to login</a>
        <p>
    </div>
    <!--create-account-wrap-->
</div>
<!--form-wrap-->
<!-- partial -->



<jsp:include page="components/footer.jsp" />

<script>
   
    function visiblePassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>

<script>

</script>