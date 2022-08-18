<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | PRODUCT DETAILS" />
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

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Product details</h4>
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shop Details Section Begin -->
        <section class="shop-details">

            <div class="container">

                <div class="row">
                    <div class="col-sm-6 product-image">
                        <img src="<%=image%>" alt="">
                    </div>
                    <div class="col-sm-6 product-details">
                        <p>
                        <h4>
                            <%=productname%>
                        </h4>
                        </p>
                        <p>
                        <h4 style="font-weight: bold">&#163;<%=price%></h4>
                        </p>
                        <p>
                        <h5 style="font-weight: bold">Specifications </h5>
                        </p>
                        <p>
                        <table>
                            <tr>
                                <th>CPU </th>
                                <td style="padding-left: 30px;">
                                     <%=cpu%>
                                </td>
                            </tr>
                            <tr>
                                <th>Processor </th>
                                <td style="padding-left: 30px;">
                                     <%=processor%>
                                </td>
                            </tr>
                            <tr>
                                <th>Graphics </th>
                                <td style="padding-left: 30px;">
                                     <%=graphics%>
                                </td>
                            </tr>
                            <tr>
                                <th>Display </th>
                                <td style="padding-left: 30px;">
                                     <%=display%>
                                </td>
                            </tr>
                            <tr>
                                <th>Connections </th>
                                <td style="padding-left: 30px;">
                                     <%=connections%>
                                </td>
                            </tr>
                            <tr>
                                <th>Memory </th>
                                <td style="padding-left: 30px;">
                                     <%=memory%>
                                </td>
                            </tr>
                            <tr>
                                <th>Storage </th>
                                <td style="padding-left: 30px;">
                                     <%=storage%>
                                </td>
                            </tr>
                            <tr>
                                <th>Battery </th>
                                <td style="padding-left: 30px;">
                                     <%=power%>
                                </td>
                            </tr>
                            <tr>
                                <th>Weight </th>
                                <td style="padding-left: 30px;">
                                     <%=weight%> KG
                                </td>
                            </tr>

                        </table>
                        </p>
                    </div>
                </div>
                <div class="row add-to-cart">
                    <div class="col-sm-6 quantity">
                        <input type="number" value="1" name="quantity" id="quantity" maxlength="2" min="1" placeholder="Quantity">
                    </div>

                    <div class="col-sm-6 btn-cart">
                        <button  onclick="addToCart(<%=id%>, <%=session.getAttribute("loggedinuserid")%>)" class="primary-btn">Add to cart</button>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Details Section End -->


        <jsp:include page="components/footer.jsp" />

        <script>
            function addToCart(productid, userid) {

                var quantity = $('#quantity').val();
                if(quantity<=0 || quantity<="0"){
                    alert('Quantity cannot be 0')
                }


                else{
                    $.ajax({
                    url: 'addtocart',
                    data: {
                        'productid': productid,
                        'userid': userid,
                        'quantity': quantity
                    },
                    type: 'post',
                    cache: false,
                    success: function (data) {
                        var splittedData = data.split(",");
                        var status = splittedData[0];
                        var msg = splittedData[1];
        
        
                        if (status == "1") {
                            alert(msg)
                            // Redirect to cart
                            window.location='viewcart?userid='+userid;
                        } else if (status == "0") {
                            alert(msg)
                        }
                    }, error: function (err) {
                        console.log(err)
                        alert(err)
                    }
                })
                }
                
            }
        </script>