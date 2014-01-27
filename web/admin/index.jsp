<%-- 
    Document   : index.jsp
    Created on : Jan 23, 2014, 3:11:48 PM
    Author     : Timothy & Etienne
--%>
<div class="container">
            <div class="masthead">
                <h3 class="text-muted" align="center" >WebArmory Admin Console</h3>
                              
                <ul class="nav nav-justified">
                    <li><a href="<c:url value='viewCustomers'/>">All customers</a></li>
                    <li><a href="<c:url value='viewOrders'/>">All orders</a></li>
                    <li>
                        <a href="<c:url value='logout'/>">Log out</a>
                    </li>
                </ul>
            </div>

<%-- customerList is requested --%>
<c:if test="${!empty customerList}">
<br/>
    <table class="table table-bordered  table-condensed">

        <tr>
            <th>All Customers</th>
        </tr>

        <tr>
            <th>Customer id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>

        <c:forEach var="customer" items="${customerList}" varStatus="iter">

            <tr class="tableRow"
                onclick="document.location.href='customerRecord?${customer.id}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="customerRecord?${customer.id}" >${customer.id}</a></td>
                <td><a href="customerRecord?${customer.id}" >${customer.name}</a></td>
                <td><a href="customerRecord?${customer.id}" >${customer.email}</a></td>
                <td><a href="customerRecord?${customer.id}" >${customer.phone}</a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<%-- orderList is requested --%>
<c:if test="${!empty orderList}">
 <br/>
    <table class="table table-bordered table-condensed">

        <tr>
            <th>All orders</th>
        </tr>

        <tr class="tableHeading">
            <th>Order id</th>
            <th>Confirmation number</th>
            <th>Amount</th>
            <th>Date created</th>
        </tr>

        <c:forEach var="order" items="${orderList}" varStatus="iter">

            <tr class="tableRow"
                onclick="document.location.href='orderRecord?${order.id}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="orderRecord?${order.id}" >${order.id}</a></td>
                <td><a href="orderRecord?${order.id}" >${order.confirmationNumber}</a></td>
                <td><a href="orderRecord?${order.id}" >
                        <fmt:formatNumber type="currency"
                                          currencySymbol="&dollar; "
                                          value="${order.amount}"/></a></td>

                <td><a href="orderRecord?${order.id}" >
                        <fmt:formatDate value="${order.dateCreated}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<%-- customerRecord is requested --%>
<c:if test="${!empty customerRecord}">
    <br/>
    <table class="table table-bordered table-condensed">

        <tr>
            <th>Customer details</th>
        </tr>
        <tr>
            <td><strong>Customer id:</strong></td>
            <td>${customerRecord.id}</td>
        </tr>
        <tr>
            <td><strong>Name:</strong></td>
            <td>${customerRecord.name}</td>
        </tr>
        <tr>
            <td><strong>Email:</strong></td>
            <td>${customerRecord.email}</td>
        </tr>
        <tr>
            <td><strong>Phone:</strong></td>
            <td>${customerRecord.phone}</td>
        </tr>
        <tr>
            <td><strong>Address:</strong></td>
            <td>${customerRecord.address}</td>
        </tr>
        <tr>
            <td><strong>City region:</strong></td>
            <td>${customerRecord.cityRegion}</td>
        </tr>
        <tr>
            <td><strong>Credit card number:</strong></td>
            <td>${customerRecord.ccNumber}</td>
        </tr>
</table>

        <tr class="tableRow"
            onclick="document.location.href='orderRecord?${order.id}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="orderRecord?${order.id}" >
                    <strong class="btn btn-success">View order summary</strong></a></td>
        </tr>
    

</c:if>

<%-- orderRecord is requested --%>
<c:if test="${!empty orderRecord}">
 <br/>
    <table class="table table-bordered table-condensed">

        <tr>
            <th>Order summary</th>
        </tr>
        <tr>
            <td><strong>Order id:</strong></td>
            <td>${orderRecord.id}</td>
        </tr>
        <tr>
            <td><strong>Confirmation number:</strong></td>
            <td>${orderRecord.confirmationNumber}</td>
        </tr>
        <tr>
            <td><strong>Date processed:</strong></td>
            <td>
                <fmt:formatDate value="${orderRecord.dateCreated}"
                                type="both"
                                dateStyle="short"
                                timeStyle="short"/></td>
        </tr>
 </table>
        <tr>
          
                <table class="table table-bordered table-condensed">
                   <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>

              

                    <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                        <tr>
                            <td>
                               ${products[iter.index].name}
                            </td>
                            <td>
                                ${orderedProduct.quantity}
                            </td>
                            <td class="confirmationPriceColumn">
                                <fmt:formatNumber type="currency" currencySymbol="&dollar; "
                                                  value="${products[iter.index].price * orderedProduct.quantity}"/>
                            </td>
                        </tr>

                    </c:forEach>
                    <tr>
                        <td colspan="2" id="deliverySurchargeCellLeft"><strong>Delivery surcharge:</strong></td>
                        <td id="deliverySurchargeCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&dollar; "
                                              value="${initParam.deliverySurcharge}"/></td>
                    </tr>

                    <tr>
                        <td colspan="2" id="totalCellLeft"><strong>Total amount:</strong></td>
                        <td id="totalCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&dollar; "
                                              value="${orderRecord.amount}"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="tableRow"
            onclick="document.location.href='customerRecord?${customer.id}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="customerRecord?${customer.id}" >
                    <strong class="btn btn-success">View customer details</strong></a></td>
        </tr>
    </table>

</c:if>
</div>