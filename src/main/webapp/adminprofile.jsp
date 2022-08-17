<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | HOMEPAGE" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

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



        <div id="form-wrap">
            <h3>Admin Profile</h3>
            <p></p>
            <%if (session.getAttribute("loggedinuserid") !=null) {%>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div style="margin: 2px;">

                                <span style="font-weight: bold ;">Name: </span>
                                <span>
                                    <%=fname%>
                                        <%=lname%>
                                </span>
                                <br>

                                <span style="font-weight: bold ;">Email: </span>
                                <span>
                                    <%=email%>
                                </span>
                                <br>

                                <span style="font-weight: bold ;">Phone number: </span>
                                <span>
                                    <%=phonenumber%>
                                </span>
                                <br>


                                <span style="font-weight: bold ;">Street address: </span>
                                <span>
                                    <%=streetaddress%>
                                </span>
                                <br>

                                <span style="font-weight: bold ;">House number: </span>
                                <span>
                                    <%=housenumber%>
                                </span>
                                <br>

                                <span style="font-weight: bold ;">city: </span>
                                <span>
                                    <%=city%>
                                </span>
                                <br>

                                <span style="font-weight: bold ;">post code: </span>
                                <span>
                                    <%=postcode%>
                                </span>


                            </div>
                        </div>
                        <div class="col-sm-6">
                            <p>
                                <a href="./additems.jsp"
                                    style="background-color: green; color: white; padding: 10px; border-radius: 2px;">Add
                                    items <span> <i class="fa fa-plus"></i></span></a>
                            </p>
                            <br>
                            <p>
                                <a href="viewallitems"
                                    style="background-color: rgb(0, 60, 128); color: white; padding: 10px; border-radius: 2px;">Edit
                                    items <span> <i class="fa fa-pencil"></i></span></a>
                            </p>

                        </div>
                    </div>
                </div>
                <%} else {%>
                    <a style="width: 100; margin-bottom: 10px;" href="./login.jsp" class="primary-btn">Login to
                        continute</a>
                    <% } %>

        </div>
        </div>


        <jsp:include page="components/footer.jsp" />