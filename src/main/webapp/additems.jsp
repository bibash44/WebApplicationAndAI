<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | HOMEPAGE" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<%@page import="java.util.*" %>


    <section class="checkout spad">


        <div class="container">

            <div class="checkout__form">
                <%if (session.getAttribute("loggedinuserid") !=null) {%>
                    <form action="additems" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-lg-12">
                                <span id="validation-text"
                                    style="color: red; margin: 5px; font-weight: bold; float: left;"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Product name <span>*</span></p>
                                    <input type="text" name="productname" id="productname" required
                                        placeholder="Eg: Acer Nitro" class="checkout__input__add">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>CPU <span>*</span></p>
                                    <input type="text" name="cpu" id="cpu" required
                                        placeholder="Eg: Intel Core i5-10300H 2.50 GHz Turbo up to 4.5GHz"
                                        class="checkout__input__add">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Processor <span>*</span></p>
                                    <input type="text" name="processor" id="processor" required
                                        placeholder="Eg: 4 Core">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Graphics <span>*</span></p>
                                    <input type="text" name="graphics" id="graphics" required
                                        placeholder="Eg: NVIDIA GeForce RTX 2060 with 6GB GDDR6">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Display <span>*</span></p>
                                    <input type="text" name="display" id="display" required
                                        placeholder="Eg: 15.6 LCD ComfyView In-plane Switching (IPS) Technology Full HD Backlight Technology LED 1920 x 1080 pixels">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p> Connections <span>*</span></p>
                                    <input type="text" name="connections" id="connections" required
                                        placeholder="Eg: LAN USB-C 3.2 Gen 2 HDMI USB 3.0 (with power off charging) 3 x USB 3.0 Headphone/microphone combo jac">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Memory <span>*</span></p>
                                    <input type="text" name="memory" id="memory" required
                                        placeholder="Eg: 16GB DDR4 2933MHz Memory">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Storage <span>*</span></p>
                                    <input type="text" name="storage" id="storage" required
                                        placeholder="256Gb SSD +1TB HDD">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Battery / Power Supply <span>*</span></p>
                                    <input type="text" name="power" id="power" required
                                        placeholder="Eg: 180 watt / 330 watt power supply">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Weight (in kg) <span>*</span></p>
                                    <input type="number" name="weight" id="weight" required placeholder="1 Kg">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Image <span></span></p>
                                    <input type="file" name="image" required id="image" name="image"
                                        onchange="displayimage(this)">
                                    <img id="img-display" src="#" alt="your image" width="100px" />
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Category <span>*</span></p>
                                    <select name="category" id="category">
                                        <option value="pc">PC</option>
                                        <option value="laptop">Laptop</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>Price (in GBP) <span>*</span></p>
                                    <input type="text" name="price" id="price" required placeholder="&#163;450">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <!-- <button id="btn-add-items" class="primary-btn" style="width: 100%;"> Add </button> -->
                                <button type="submit" class="primary-btn" style="width: 100%;"> Add </button>
                            </div>
                        </div>

                    </form>
                    <%} else {%>
                        <a style="width: 100; margin-bottom: 10px;" href="./login.jsp" class="primary-btn">Login to
                            continute</a>
                        <% } %>
            </div>


        </div>
    </section>


    <jsp:include page="components/footer.jsp" />

    <script>
        function displayimage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img-display').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        $('#btn-add-items').click(function () {
            var productname = $('#productname').val();
            var cpu = $('#cpu').val();
            var processor = $('#processor').val();
            var graphics = $('#graphics').val();
            var display = $('#display').val();
            var connections = $('#connections').val();
            var memory = $('#memory').val();
            var storage = $('#storage').val();
            var power = $('#power').val();
            var weight = $('#weight').val();
            var category = $('#category').val();
            var image = $('#image')[0].files;

            var validation = $('#validation-text')

            var formdata = new FormData();


            if (productname == null || productname == "") {
                validation.html('Enter product name  * <br>');
                $('#productname').focus()
            }

            else if (cpu == null || cpu == "") {
                validation.html('Enter cpu  * <br>');
                $('#cpu').focus()
            }
            else if (processor == null || processor == "") {
                validation.html('Enter processor  * <br>');
                $('#processor').focus()
            }
            else if (graphics == null || graphics == "") {
                validation.html('Enter graphics  * <br>');
                $('#graphics').focus()
            }
            else if (display == null || display == "") {
                validation.html('Enter display  * <br>');
                $('#display').focus()
            }
            else if (connections == null || connections == "") {
                validation.html('Enter Connections  * <br>');
                $('#connections').focus()
            }
            else if (memory == null || memory == "") {
                validation.html('Enter memory  * <br>');
                $('#memory').focus()
            }
            else if (storage == null || storage == "") {
                validation.html('Enter storage  * <br>');
                $('#storage').focus()
            }

            else if (power == null || power == "") {
                validation.html('Enter battery or power  * <br>');
                $('#power').focus()
            }

            else if (weight == null || weight == "") {
                validation.html('Enter weight  * <br>');
                $('#weight').focus()
            }

            // Check file selected or not


            else {

                // var data = {
                //     'productname': productname,
                //     'cpu': cpu,
                //     'processor': processor,
                //     'graphics': graphics,
                //     'display': display,
                //     'connections': connections,
                //     'memory': memory,
                //     'storage': storage,
                //     'power': power,
                //     'weight': weight,
                //     'category': category,

                // }
                if (image.length > 0) {
                    formdata.append('image', image[0]);
                    console.log('image selected')

                }
                else {
                    console.log('image not selected')
                }

                // formdata.append('productname', productname);
                // formdata.append('cpu', cpu);
                // formdata.append('graphics', graphics);
                // formdata.append('processor', processor);
                // formdata.append('graphics', graphics);
                // formdata.append('display', display);
                // formdata.append('connections', connections);
                // formdata.append('memory', memory);
                // formdata.append('power', power);
                // formdata.append('weight', weight);
                // formdata.append('category', category);


                $.ajax({
                    data: formdata,
                    type: 'POST',
                    method: 'POST',
                    url: 'additems',
                    cache: false,
                    processData: false,
                    success: function (data) {
                        console.log(data)
                    },
                    error: function (err) {
                        console.log(err)
                    }

                })
            }




            // else {
            //     $.ajax({
            //         url: 'register',
            //         data: {
            //             'fname': fname,
            //             'lname': lname,
            //             'phonenumber': phonenumber,
            //             'email': email,
            //             'streetaddress': streetaddress,
            //             'housenumber': housenumber,
            //             'city': city,
            //             'postcode': postcode,
            //             'password': password,
            //         },
            //         cache: false,
            //         type: 'post',
            //         success: function (data) {
            //             console.log(data);
            //             var splittedData = data.split(",");
            //             var status = splittedData[0];
            //             var msg = splittedData[1];

            //             if (status == "1") {
            //                 $('#validation-text').css({ 'color': 'green' })
            //                 $('#validation-text').html(msg.toString() + "<a href='./login.jsp'> Continue to login </a>");

            //             }
            //             else {
            //                 $('#validation-text').css({ 'color': 'red' })
            //                 $('#validation-text').html(msg.toString());

            //             }

            //             $('#fname').focus()


            //             $('#fname').val(null);
            //             $('#lname').val(null);
            //             $('#phonenumber').val(null);
            //             $('#email').val(null);
            //             $('#streetaddress').val(null);
            //             $('#housenumber').val(null);
            //             $('#city').val(null);
            //             $('#postcode').val(null);
            //             $('#password').val(null);


            //         },
            //         error: function (err) {
            //             console.log(err)
            //             $('#validation-text').css({ 'color': 'red' })
            //             $('#validation-text').html(err.toString())
            //         }
            //     })
            // }


        })

    </script>