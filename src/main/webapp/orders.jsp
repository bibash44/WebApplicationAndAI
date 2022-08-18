<%@page import="java.util.*"%>
<%@page import="Model.CartProductModel"%>
<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | CART" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<% List<CartProductModel> cartProductModels = (List<CartProductModel>) request.getAttribute("orderdetails");
%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Your Orders</h4>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <%if (session.getAttribute("loggedinuserid") != null) {%>
        <div class="row">
            <div class="col-lg-8">
                <div class="shopping__cart__table">

                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Sub total</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                int total = 0;
                                for (CartProductModel cartProductModel : cartProductModels) {


                            %>


                            <tr>
                                <td class="product__cart__item">
                                    <div class="product__cart__item__pic">
                                        <img src="<%=cartProductModel.getImage()%>" width="100px" alt="">
                                    </div>
                                    <div class="product__cart__item__text">
                                        <h6><%=cartProductModel.getProductname()%></h6>
                                        <h5>&#163;<%=cartProductModel.getPrice()%> </h5>
                                    </div>
                                </td>
                                <td>
                                    <h5><%=cartProductModel.getQuantity()%></h5>
                                </td>


                                <td class="cart__price"> <%
                                    int quantity = Integer.valueOf(cartProductModel.getQuantity());
                                    int price = Integer.valueOf(cartProductModel.getPrice());
                                    int subtotal = (quantity * price);
                                    total = total + subtotal;
                                    %>
                                    &#163; <%=subtotal%>

                                </td>

                            </tr>
                            <%}%>

                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn">

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">

                    </div>
                </div>
            </div>
            <div class="col-lg-4">

                <div class="cart__total">
                    <h6>Total paid </h6>
                    <ul>

                        <li>Total 
                            <span>&#163;<%=total%> </span>
                        </li>
                    </ul>
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
