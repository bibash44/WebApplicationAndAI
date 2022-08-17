<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | LOGIN" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<!-- partial:index.partial.html -->
<div id="form-wrap">
    <h3>LOGIN</h3>
    <div id="form">
        <span id="validation-text" style="color: red; margin: 5px; font-weight: bold; float: left;"></span>
        <p>
            <input type="email" id="email" name="email" placeholder="Email Address" required>
        </p>
        <p>
            <input type="password" id="password" name="password" placeholder="Password" required>
        </p>

        <p>
            <button id="btn-login" class="primary-btn" style="width: 100%; text-align:center;"> Login </button>
        </p>
    </div>
    <div id="create-account-wrap">
        <p>Not a member? <a href="./register.jsp">Create Account</a>
        <p>
    </div>
    <!--create-account-wrap-->
</div>
<!--form-wrap-->
<!-- partial -->




<jsp:include page="components/footer.jsp" />

<script>
    $('#btn-login').click(function () {
        var email = $('#email').val();
        var password = $('#password').val();
        var validation = $('#validation-text');
        if (email == null || email == "") {
            validation.html('Enter  email address  * <br>');
            $('#email').focus()
        } else if (password == null || password == "") {
            validation.html('Enter  password   * <br>');
            $('#password').focus()
        } else {
            $.ajax({
                url: 'login',
                data: {
                    'email': email,
                    'password': password,
                },
                cache: false,
                type: 'post',
                success: function (data) {
                    var splittedData = data.split(",");
                    var status = splittedData[0];
                    var msg = splittedData[1];

                    console.log(data)

                    if (status == "1") {
                        var usertype = splittedData[2];
                        if (usertype == "normal") {
                            window.location = 'index.jsp';
                        }
                        else if (usertype == "admin") {
                            window.location = './adminprofile.jsp';
                        }


                    } else {
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
</script>