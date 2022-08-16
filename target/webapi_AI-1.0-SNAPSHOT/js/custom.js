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
