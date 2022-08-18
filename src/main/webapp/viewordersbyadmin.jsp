<%@page import="Model.CartProductUserModel"%>
<%@page import="Model.ProductModel" %>
<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | HOMEPAGE" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<%@page import="java.util.*" %>


<% List<CartProductUserModel> cartProductUserModels = (List<CartProductUserModel>) request.getAttribute("orderdetails"); %>


<table id="example" class="display" style="width:100%; padding: 5px; margin: 5px;">
    <thead>
        <tr>
            <th>Id</th>
            <th>Product name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            <th>Image</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone number</th>
            <th>Address</th>
    <total>

        </tr>
        </thead>
        <tbody>
            <% for (CartProductUserModel cartProductUserModel : cartProductUserModels) {%>
            <tr>
                <td> <%=cartProductUserModel.getId()%> </td>
                <td> <%=cartProductUserModel.getProductname()%>  </td>
                <td> <%=cartProductUserModel.getQuantity()%></td>
                <td> &#163;<%=cartProductUserModel.getPrice()%> </td>
                <td>
                    <%
                        int quantity = Integer.valueOf(cartProductUserModel.getQuantity());
                        int price = Integer.valueOf(cartProductUserModel.getPrice());
                        int total = (quantity * price);
                    %>
                    &#163;<%=total%>
                </td>
                <td> <img src="<%=cartProductUserModel.getImage()%>" width="150px" alt="alt"/> </td>
                <td><%=cartProductUserModel.getFname()%> <%=cartProductUserModel.getLname()%></td>
                <td><%=cartProductUserModel.getEmail()%></td>
                <td><%=cartProductUserModel.getPhonenumber()%></td>
                <td>
                    <%=cartProductUserModel.getHousenumber()%> 
                    <%=cartProductUserModel.getStreetaddress()%>
                    <%=cartProductUserModel.getPostcode()%>
                    <%=cartProductUserModel.getCity()%>
                </td>

            </tr>
            <% }%>

        </tbody>
        <tfoot>
            <tr>
                <th>Id</th>
                <th>Product name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Image</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone number</th>
                <th>Address</th>
            </tr>
        </tfoot>
</table>

<jsp:include page="components/footer.jsp" />

<script>
    $(document).ready(function () {
        $('#example').DataTable();

    });
</script>