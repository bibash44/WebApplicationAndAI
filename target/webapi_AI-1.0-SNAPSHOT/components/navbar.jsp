<%@page import="java.util.HashMap" %>
    <!-- Page Preloder -->

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
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-wrapper">

            <div class="offcanvas__nav__option">
                <a href="#"><img src="img/icon/register.png" alt=""></a>
                <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
            </div>
            <div id="mobile-menu-wrap"></div>

        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="./index.jsp"><img src="img/logo2.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="./index.jsp">Home</a></li>
                                <li><a href="getitemsbycategory?category=pc">PC</a></li>
                                <li><a href="getitemsbycategory?category=laptop">Laptop</a></li>
                                <li><a href="./contact.jsp">Contacts</a></li>


                                <%if (session.getAttribute("loggedinuserid") !=null) {%>
                                    <li><a href="#"> Hello <span style="font-size: 12px;">
                                                <%=fname%>
                                            </span></a>
                                        <ul class="dropdown">
                                            <li><a href="logout">Logout </a></li>
                                             
                                             <% if(session.getAttribute("usertype").equals("normal")){
                                            
                                            %>
                                            <li><a href="./userprofile.jsp">Profile </a></li>
                                            <%} else if (session.getAttribute("usertype").equals("admin")) {%>
                                                <li><a href="./adminprofile.jsp">Dashboard </a></li>
                                            <%}%>
                                        </ul>
                                        <%} else {%>
                                    <li><a href="#"><img src="img/icon/register.png" alt=""></a>
                                        <ul class="dropdown">
                                            <li><a href="./login.jsp">Login </a></li>
                                            <li><a href="./register.jsp">Register</a></li>
                                        </ul>
                                        <%}%>
                                    </li>
                            </ul>
                        </nav>
                    </div>
                    <%if (session.getAttribute("loggedinuserid") !=null && session.getAttribute("usertype").equals("normal")) {%>
                        <div class="col-lg-3 col-md-3">
                            
                            <div class="header__nav__option">

                                <a href="viewcart?userid=<%=session.getAttribute("loggedinuserid")%>"><img
                                        src="img/icon/cart.png" alt=""> 
                                    </a>

                                    <a href="vieworders?userid=<%=session.getAttribute("loggedinuserid")%>"><img
                                        src="img/icon/orders.png" alt=""> 
                                    </a>


                            </div>
                        </div>
                        <%} else {%>
                            <%}%>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </header>
        <!-- Header Section End -->

        <script>
            function ViewCart(userid) {
                console.log(userid)
                $.ajax({
                    url: 'viewcart',
                    data: {
                        'userid': userid
                    },
                    type: 'get',
                    cache: false,
                    success(data) {
                        console.log(data)
                    },
                    error(err) {
                        console.log(err)
                    }

                })
            } 
        </script>