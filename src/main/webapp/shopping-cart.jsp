<%@page import="java.util.*"%>
<%@page import="Model.CartProductModel"%>
<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | CART" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<% List<CartProductModel> cartProductModels = (List<CartProductModel>) request.getAttribute("cartdetails");
%>


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
        <%if (session.getAttribute("loggedinuserid") != null) {%>
        <div class="row">
            <div class="col-lg-8">
                <div class="shopping__cart__table">
                    <span> Enter quantity to update</span>
                    <input style="border: 2px solid black" type="number" value="1" name="quantity" id="quantity" maxlength="2" min="1"  placeholder="Quantity">

                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Update

                                </th>
                                <th>Sub total</th>
                                <th>Remove</th>
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

                                <td class="quantity__item">
                                    <div class="quantity">


                                        <button  style="color: green; background: none; border: none;" onclick="IncreaseQuantity(<%=cartProductModel.getProductid()%>, <%=session.getAttribute("loggedinuserid")%>)">
                                            <i class="fa fa-plus-circle fa-2x"></i>
                                        </button>
                                        <p></p>
                                        <button style="color: blue; background: none; border: none;"  onclick="DecreaseQuantity(<%=cartProductModel.getQuantity()%>, <%=cartProductModel.getProductid()%>, <%=session.getAttribute("loggedinuserid")%>)" class="btn-dark">
                                            <i class="fa fa-minus-circle fa-2x"></i>
                                        </button>
                                    </div>

                                </td>
                                <td class="cart__price"> <%
                                    int quantity = Integer.valueOf(cartProductModel.getQuantity());
                                    int price = Integer.valueOf(cartProductModel.getPrice());
                                    int subtotal = (quantity * price);
                                    total = total + subtotal;
                                    %>
                                    &#163; <%=subtotal%>

                                </td>
                                <td>
                                    <button onclick="removeFromCart(<%=cartProductModel.getId()%>)" style="color: red; background: none; border: none;"><i class="fa fa-trash fa-2x"></i></button>
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
                    <h6>Cart total</h6>
                    <ul>

                        <li>Total 
                            <span>&#163;<%=total%> </span>
                        </li>
                    </ul>
                    <%
                        if (cartProductModels.size() <= 0) {
                        } else {
                    %>
                    <a href="checkout?userid=<%=session.getAttribute("loggedinuserid")%>" class="primary-btn">Proceed to checkout</a>
                    <%}%>
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

<script>

    function IncreaseQuantity(productid, userid) {
        var quantity = $('#quantity').val();
        if (quantity <= 0) {
            alert('Invalid quantity')
        } else {
            updateCart(quantity, productid, userid);
        }

    }
    function DecreaseQuantity(currentquantity, productid, userid) {

        var quantity = $('#quantity').val();

        if (quantity <= 0) {
            alert('Invalid quantity')
        } else if (currentquantity == quantity) {
            alert('Total quantity cannot be 0')
        } else {
            quantity = 0 - quantity;
            updateCart(quantity, productid, userid);
            console.log(quantity)
        }
    }
    function updateCart(quantity, productid, userid) {


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
                    alert('Cart updated successfully')
                    // Redirect to cart
                    window.location.reload();
                } else if (status == "0") {
                    alert(msg)
                }
            }, error: function (err) {
                console.log(err)
                alert(err)
            }
        })
    }

    function removeFromCart(id) {
        $.ajax({
            url: 'removefromcart',
            data: {
                'id': id
            },
            type: 'post',
            cache: false,
            success: function (data) {
                console.log(data)
                window.location.reload()
            },
            error: function (err) {
                console.log(err)
            }
        })
    }


</script>