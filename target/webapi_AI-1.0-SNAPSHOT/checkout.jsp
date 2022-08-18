
<%@page import="Model.CartProductModel"%>
<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | CHECKOUT" />
</jsp:include>

<jsp:include page="components/navbar.jsp"/>

<%@page import="java.util.*" %>

<% HashMap<String, String> userDetails = (HashMap) session
            .getAttribute("userdetails");
    String id = "";
    String fname = "";
    String lname = "";
    String email = "";
    String phonenumber = "";
    String streetaddress = "";
    String housenumber = "";
    String city = "";
    String postcode = "";
    String usertype = "";
    if (userDetails != null) {
        id = userDetails.get("id");
        fname = userDetails.get("fname");
        lname = userDetails.get("lname");
        email = userDetails.get("email");
        phonenumber = userDetails.get("phonenumber");
        streetaddress = userDetails.get("streetaddress");
        housenumber = userDetails.get("housenumber");
        city = userDetails.get("city");
        postcode = userDetails.get("postcode");

    }
%>
<% List<CartProductModel> cartProductModels = (List<CartProductModel>) request.getAttribute("cartdetails");
%>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Check Out</h4>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <%if (session.getAttribute("loggedinuserid") != null) {%>
        <div class="checkout__form">

            <div>
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
                                here</a> to enter your code</h6>
                        <h6 class="checkout__title">Billing Details</h6>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Fist Name<span>*</span></p>
                                    <input type="text" required value="<%=fname%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Last Name<span>*</span></p>
                                    <input type="text" required value="<%=lname%>" readonly="readonly">
                                </div>
                            </div>
                        </div>

                        <div class="checkout__input">
                            <p>Street adress<span>*</span></p>
                            <input type="text" required value="<%=streetaddress%>" readonly="readonly">
                            <p>House number<span>*</span></p>
                            <input type="text" required value="<%=housenumber%>" readonly="readonly">
                        </div>
                        <div class="checkout__input">
                            <p>Town/City<span>*</span></p>
                            <input type="text" required value="<%=city%>" readonly="readonly">
                        </div>

                        <div class="checkout__input">
                            <p>Postcode <span>*</span></p>
                            <input type="text" required value="<%=postcode%>" readonly="readonly">
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Phone<span>*</span></p>
                                    <input type="text" required value="<%=phonenumber%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input type="text" required value="<%=email%>" readonly="readonly">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Card number<span>*</span></p>
                            <input type="number" placeholder="16 digit card number" name="cardnumber" id="cardnumber" maxlength="16">
                        </div>

                        <div class="checkout__input">
                            <p>Expiry date <span>*</span></p>
                            <input type="date" placeholder="Card expiry date " name="expirydate" id="expirydate">
                        </div>

                        <div class="checkout__input">
                            <p>Security code  <span>*</span></p>
                            <input type="number" placeholder="3 digit CCV " name="cvv" id="cvv" maxlength="3">
                        </div>



                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4 class="order__title">Your order</h4>
                            <div class="checkout__order__products">Product <span>Total</span></div>
                            <ul class="checkout__total__products">
                                <%
                                    int total = 0;
                                    for (CartProductModel cartProductModel : cartProductModels) {

                                        int quantity = Integer.valueOf(cartProductModel.getQuantity());
                                        int price = Integer.valueOf(cartProductModel.getPrice());
                                        int subtotal = (quantity * price);

                                        total = total + subtotal;
                                        String productname = cartProductModel.getProductname();

                                        if (productname.length() > 18) {
                                            productname = productname.substring(0, 18) + "....";
                                        }

                                %>

                                <li> <%=quantity%> x <%=productname%> <span> &#163; <%=subtotal%></span></li>
                                    <%}%>
                            </ul>
                            <ul class="checkout__total__all">
                                <li>Total <span>&#163; <%=total%></span></li>
                            </ul>
                            <div>We accept</div>
                            <img src="img/payment.jpg" alt="">
                            <%
                                if (cartProductModels.size() <= 0) {
                                } else {
                            %>
                            <button onclick="placeOrder(<%=session.getAttribute("loggedinuserid")%>)" class="site-btn">PLACE ORDER</button>

                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="row" style="width: 100%;">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <a style="width: 100;" href="./login.jsp" class="primary-btn">Login to checkout</a>
            </div>
            <div class="col-lg-4">

            </div>
            <%}%>
        </div>
</section>
<!-- Checkout Section End -->

<!-- Footer Section Begin -->



<jsp:include page="components/footer.jsp"/>

<script>
    function placeOrder(userid) {

        var cardnumber = $('#cardnumber').val();
        var expirydate = $('#expirydate').val()
        var cvv = $('#cvv').val()

        if (cardnumber == null || cardnumber == '' || cardnumber.length != 16) {
            alert('Please enter 16 digit card number')
            $('#cardnumber').focus()

        } else if (expirydate == null || expirydate == '') {
            alert('Please enter expiry date')
            $('#expirydate').focus()

        } else if (cvv == null || cvv == "" || cvv.length != 3) {
            alert('Please enter 3 digit security  code')
            $('#cvv').focus()
        } else {
            $.ajax({
                url: 'placeorder',
                type: 'post',
                data: {
                    'userid': userid
                },
                cache: false,
                success: function (data) {
                    var splittedData = data.split(",");
                    var status = splittedData[0];
                    var msg = splittedData[1];
                    alert(msg)
                    window.location = 'vieworders?userid=' + userid
                },
                error: function (err) {
                    console.log(err)
                }
            })
        }


    }
</script>