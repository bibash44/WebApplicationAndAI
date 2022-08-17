<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | HOMEPAGE" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<%@page import="java.util.*" %>

    <% HashMap<String, String> singleitemdetails = (HashMap) request
        .getAttribute("singleitemdetails");
        int id = 0;
        String productname = "";
        String cpu = "";
        String processor = "";
        String graphics = "";
        String display = "";
        String connections = "";
        String memory = "";
        String storage = "";
        String power = "";
        int weight = 0;
        String image = "";
        String category = "";
        String price = "";
        if (singleitemdetails != null) {
        id = Integer.valueOf(singleitemdetails.get("id"));
        productname = singleitemdetails.get("productname");
        cpu = singleitemdetails.get("cpu");
        processor = singleitemdetails.get("processor");
        graphics = singleitemdetails.get("graphics");
        display = singleitemdetails.get("display");
        connections = singleitemdetails.get("connections");
        memory = singleitemdetails.get("memory");
        storage = singleitemdetails.get("storage");
        power = singleitemdetails.get("power");
        weight = Integer.valueOf(singleitemdetails.get("weight"));
        image = singleitemdetails.get("image");
        category = singleitemdetails.get("category").toUpperCase();
        price = singleitemdetails.get("price");
        }
        %>

        <section class="checkout spad">


            <div class="container">

                <div class="checkout__form">
                    <%if (session.getAttribute("loggedinuserid") !=null) {%>
                        <form action="updateitem" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <span id="validation-text"
                                        style="color: red; margin: 5px; font-weight: bold; float: left;"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <input type="hidden" name="id" value="<%=id%>" <p>Product name <span>*</span>
                                        </p>
                                        <input type="text" name="productname" value="<%=productname%>" id="productname"
                                            required placeholder="Eg: Acer Nitro" class="checkout__input__add">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>CPU <span>*</span></p>
                                        <input type="text" name="cpu" value="<%=cpu%>" id="cpu" required
                                            placeholder="Eg: Intel Core i5-10300H 2.50 GHz Turbo up to 4.5GHz"
                                            class="checkout__input__add">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Processor <span>*</span></p>
                                        <input type="text" name="processor" value="<%=processor%>" id="processor"
                                            required placeholder="Eg: 4 Core">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Graphics <span>*</span></p>
                                        <input type="text" name="graphics" value="<%=graphics%>" id="graphics" required
                                            placeholder="Eg: NVIDIA GeForce RTX 2060 with 6GB GDDR6">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Display <span>*</span></p>
                                        <input type="text" name="display" value="<%=display%>" id="display" required
                                            placeholder="Eg: 15.6 LCD ComfyView In-plane Switching (IPS) Technology Full HD Backlight Technology LED 1920 x 1080 pixels">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p> Connections <span>*</span></p>
                                        <input type="text" name="connections" value="<%=connections%>" id="connections"
                                            required
                                            placeholder="Eg: LAN USB-C 3.2 Gen 2 HDMI USB 3.0 (with power off charging) 3 x USB 3.0 Headphone/microphone combo jac">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Memory <span>*</span></p>
                                        <input type="text" name="memory" value="<%=memory%>" id="memory" required
                                            placeholder="Eg: 16GB DDR4 2933MHz Memory">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Storage <span>*</span></p>
                                        <input type="text" name="storage" value="<%=storage%>" id="storage" required
                                            placeholder="256Gb SSD +1TB HDD">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Battery / Power Supply <span>*</span></p>
                                        <input type="text" name="power" value="<%=power%>" id="power" required
                                            placeholder="Eg: 180 watt / 330 watt power supply">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Weight (in kg) <span>*</span></p>
                                        <input type="number" value="<%=weight%>" name="weight" id="weight" required
                                            placeholder="1 Kg">
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Category (<%=category%>) <span>*</span></p>
                                        <select name="category" id="category">
                                            <option value="pc">PC</option>
                                            <option value="laptop">Laptop</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Price (in &#163;) <span>*</span></p>
                                        <input type="number" value="<%=price%>" name="price" id="price" required
                                            placeholder="&#163;450 ">
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-lg-12">
                                    <!-- <button id="btn-add-items" class="primary-btn" style="width: 100%;"> Add </button> -->
                                    <button type="submit" class="primary-btn" style="width: 100%;"> Update </button>
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

    