<%@page import="Model.ProductModel" %>
<jsp:include page="components/header.jsp">
    <jsp:param name="pagetitle" value="COMPUTER FOR YOU | HOMEPAGE" />
</jsp:include>

<jsp:include page="components/navbar.jsp" />

<%@page import="java.util.*" %>


<% List<ProductModel> productModels = (List<ProductModel>) request.getAttribute("itemsdetails"); %>

<table id="example" class="display" style="width:100%; padding: 5px; margin: 5px;">
    <thead>
        <tr>
            <th>Id</th>
            <th>Product name</th>
            <th>CPU</th>
            <th>Processor</th>
            <th>Graphics</th>
            <th>Display</th>
            <th>Memory</th>
            <th>Storage</th>
            <th>image</th>
            <th>category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% for (ProductModel productModel : productModels) {%>
        <tr>
            <td>
                <%=productModel.getId()%>
            </td>
            <td>
                <%=productModel.getProductname()%>
            </td>
            <td>
                <%=productModel.getCpu()%>
            </td>
            <td>
                <%=productModel.getProcessor()%>
            </td>
            <td>
                <%=productModel.getGraphics()%>
            </td>
            <td>
                <%=productModel.getDisplay()%>
            </td>
            <td>
                <%=productModel.getMemory()%>
            </td>
            <td>
                <%=productModel.getStorage()%>
            </td>
            <td> <img src="<%=productModel.getImage()%>" width="200px" alt="alt" /></td>
            <td>
                <%=productModel.getCategory()%>
            </td>
            <td>
                <span>
                    <button id="btn-delete" onclick="deleteItem(<%=productModel.getId()%>)"
                            data-productid="<%=productModel.getId()%>"
                            style="border: none; background-color: none; color: red;"> <i
                            class="fa fa-trash"></i>
                    </button>
                </span>

                <span>
                    <a  href="getsingleitem?id=<%=productModel.getId()%>"id="btn-edit"
                        style="border: none; background-color: none; color: green;"> <i class="fa fa-pencil"></i>
                    </a>
                </span>
            </td>
        </tr>
        <% }%>

    </tbody>
    <tfoot>
        <tr>
            <th>Id</th>
            <th>Product name</th>
            <th>CPU</th>
            <th>Processor</th>
            <th>Graphics</th>
            <th>Display</th>
            <th>Memory</th>
            <th>Storage</th>
            <th>image</th>
            <th>category</th>
        </tr>
    </tfoot>
</table>

<jsp:include page="components/footer.jsp" />
<script>
    $(document).ready(function () {
        $('#example').DataTable();

    });



    function deleteItem(id) {
        console.log(id);
        $.ajax({
            type: 'post',
            url: 'deleteitem',
            data: {
                'id': id
            },
            cache: false,
            success: function (data) {
                console.log(data)
                window.location.reload();
            },
            error: function (err) {
                console.log(err)
            }

        })
    }



</script>