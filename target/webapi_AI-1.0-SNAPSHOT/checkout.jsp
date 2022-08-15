
 <jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | CHECKOUT" />
  </jsp:include>
 
    <jsp:include page="components/navbar.jsp"/>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="./shopping-cart.jsp">Cart</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
                            here</a> to enter your code</h6>
                            <h6 class="checkout__title">Billing Details</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                           
                            <div class="checkout__input">
                                <p>Street adress<span>*</span></p>
                                <input type="text" placeholder="eg: Clay lane" class="checkout__input__add">
                                <p>House number<span>*</span></p>
                                <input type="text" placeholder="Eg: 27">
                            </div>
                            <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <input type="text" placeholder="Eg: Coventry">
                            </div>
                           
                            <div class="checkout__input">
                                <p>Postcode <span>*</span></p>
                                <input type="text" placeholder="Eg: CV1 51B">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                                <div class="checkout__input">
                                    <p>Card number<span>*</span></p>
                                    <input type="text" placeholder="16 digit card number">
                                </div>

                                <div class="checkout__input">
                                    <p>Expiry date <span>*</span></p>
                                    <input type="date" placeholder="Card expiry date ">
                                </div>

                                <div class="checkout__input">
                                    <p>Security code  <span>*</span></p>
                                    <input type="number" placeholder="3 digit CCV ">
                                </div>

                                
                           
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                                    <li>02. German chocolate <span>$ 170.0</span></li>
                                    <li>03. Sweet autumn <span>$ 170.0</span></li>
                                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Total <span>$750.99</span></li>
                                </ul>
                                <div>We accept</div>
                                <img src="img/payment.jpg" alt="">
                                 
                                <button type="button" id="btn-place-order" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

     <!-- Footer Section Begin -->
   

 
    <jsp:include page="components/footer.jsp"/>