<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | CART" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Your Cart</h4>
                   
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <%if (session.getAttribute("loggedinuserid") !=null) {%>
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/product/product-10.jpg" width="100px" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6>T-shirt Contrast Pocket</h6>
                                            <h5>$98.49</h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="number" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ 30.00</td>
                                    <td class="cart__close">
                                        <a href=""><i class="fa fa-close"></i></a>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">

                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                          
                            <li>Total <span>$ 169.50</span></li>
                        </ul>
                        <a href="checkout.jsp" class="primary-btn">Proceed to checkout</a>
                    </div>
                </div>
            </div>
            <%} else {%>
                <div class="row" style="width: 100%;">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <a style="width: 100;" href="./login.jsp" class="primary-btn">Login to view cart</a>
                    </div>
                    <div class="col-lg-4">
                   
                </div>
                <%}%>
    </div>
</section>
<!-- Shopping Cart Section End -->


<jsp:include page="components/footer.jsp" />