
 <jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | PRODUCT DETAILS" />
  </jsp:include>
 
    <jsp:include page="components/navbar.jsp"/>

     <!-- Breadcrumb Section Begin -->
     <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__links">
                            <a href="./laptop.jsp">Laptops</a>
                            <span>Product detail</span>
                        </div>
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
                    <img src="img/shop-details/product-big-2.png" alt="">
                </div>
                <div class="col-sm-6 product-details">
                    <p><h4>Acer Nitro 5 2020 i5 10TH GEN / RTX 2060 / 16GB RAM / 256GB SSD / 1TB HDD / 15.6" FHD / RGB Keyboard</h4></p>
                    <p><h4 style="font-weight: bold">£650</h4> </p>
                    <p><h5 style="font-weight: bold">Specifications </h5> </p>
                    <p>
                        <table>
                            <tr>
                                <th>CPU </th>
                                <td style="padding-left: 30px;">Intel Core i5-10300H 2.50 GHz Turbo up to 4.5GHz</td>
                            </tr>
                            <tr>
                                <th>Processor </th>
                                <td style="padding-left: 30px;">4 Core</td>
                            </tr>
                            <tr>
                                <th>Graphics </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                            <tr>
                                <th>Display </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                            <tr>
                                <th>Connections </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                            <tr>
                                <th>Memory </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                            <tr>
                                <th>Storage </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                            <tr>
                                <th>Battery </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                            <tr>
                                <th>Weight </th>
                                <td style="padding-left: 30px;">NVIDIA GeForce RTX 2060 with 6GB GDDR6</td>
                            </tr>
                          
                        </table>
                    </p>
                </div>
            </div>
            <div class="row add-to-cart">
                <div class="col-sm-6 quantity">
                    <input type="number" maxlength="2" min="1" placeholder="Quantity">
                </div>

                <div class="col-sm-6 btn-cart">
                  <button class="primary-btn">Add to cart</button>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

 
    <jsp:include page="components/footer.jsp"/>