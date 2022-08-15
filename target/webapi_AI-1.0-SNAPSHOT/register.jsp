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
    $(document).ready(function () {




        $('#btn-register').click(function () {
            var fname = $('#fname').val();
            var lname = $('#lname').val();
            var phonenumber = $('#phonenumber').val();
            var email = $('#email').val();
            var streetaddress = $('#streetaddress').val();
            var housenumber = $('#housenumber').val();
            var city = $('#city').val();
            var postcode = $('#postcode').val();
            var password = $('#password').val();
            var validation = $('#validation-text')

            if (fname == null || fname == "" || !fname.match(/^[a-zA-Z ]{2,30}$/)) {
                validation.html('Enter valid first name * <br>');
                $('#fname').focus()
            }

            else if (lname == null || lname == "" || !lname.match(/^[a-zA-Z ]{2,30}$/)) {
                validation.html('Enter valid last name * <br>');
                $('#lname').focus()
            }

            else if (email == null || email == "" || !email.match(
                /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            )) {
                validation.html('Enter valid email address  * <br>');
                $('#email').focus()
            }

            else if (phonenumber == null || phonenumber == "" || !phonenumber.match(/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im)) {
                validation.html('Enter valid phone number * <br>');
                $('#phonenumber').focus()
            }



            else if (streetaddress == null || streetaddress == "") {
                validation.html('Enter valid street address  * <br>');
                $('#streetaddress').focus()
            }
            else if (housenumber == null || housenumber == "") {
                validation.html('Enter valid house number  * <br>');
                $('#housenumber').focus()
            }

            else if (city == null || city == "") {
                validation.html('Enter valid city  * <br>');
                $('#city').focus()
            }

            else if (postcode == null || postcode == "" || !postcode.match(/^[A-Za-z][A-Ha-hJ-Yj-y]?[0-9][A-Za-z0-9]? ?[0-9][A-Za-z]{2}|[Gg][Ii][Rr] ?0[Aa]{2}$/)) {
                validation.html('Enter valid postcode  * <br>');
                $('#postcode').focus()
            }
            else if (password == null || password == "" || !password.match(/^[A-Za-z0-9]+$/)) {
                validation.html('Enter enter number and letters only  * <br>');
                $('#password').focus()
            }
            else {
                $.ajax({
                    url: 'register',
                    data: {
                        'fname': fname,
                        'lname': lname,
                        'phonenumber': phonenumber,
                        'email': email,
                        'streetaddress': streetaddress,
                        'housenumber': housenumber,
                        'city': city,
                        'postcode': postcode,
                        'password': password,
                    },
                    cache: false,
                    type: 'post',
                    success: function (data) {
                        console.log(data);
                        var splittedData = data.split(",");
                        var status = splittedData[0];
                        var msg = splittedData[1];

                        if (status == "1") {
                            $('#validation-text').css({ 'color': 'green' })
                            $('#validation-text').html(msg.toString() + "<a href='./login.jsp'> Continue to login </a>");

                        }
                        else {
                            $('#validation-text').css({ 'color': 'red' })
                            $('#validation-text').html(msg.toString());

                        }

                        $('#fname').focus()


                        $('#fname').val(null);
                        $('#lname').val(null);
                        $('#phonenumber').val(null);
                        $('#email').val(null);
                        $('#streetaddress').val(null);
                        $('#housenumber').val(null);
                        $('#city').val(null);
                        $('#postcode').val(null);
                        $('#password').val(null);


                    },
                    error: function (err) {
                        console.log(err)
                        $('#validation-text').css({ 'color': 'red' })
                        $('#validation-text').html(err.toString())
                    }
                })
            }


        })
    })

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