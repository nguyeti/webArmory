<%-- 
    Document   : confirmation
    Created on : Jan 12, 2014, 5:33:06 PM
    Author     : Timothy & Etienne
--%>
    <p>
        <strong>Your order has been successfully processed and will be delivered within 24 hours.</strong>
        <br><br>
        Please keep a note of your confirmation number:
        <strong>${orderRecord.confirmationNumber}</strong>
        <br>
        If you have a query concerning your order, feel free to <a href="#">contact us</a>.
        <br><br>
        Thank you for shopping at the WebArmory Store!
    </p>

    <div>

        <table class="table table-bordered">
            <tr>
                <th>Order summary</th>
            </tr>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">
                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>${products[iter.index].name}</td>
                    <td>
                        ${orderedProduct.quantity}
                    </td>
                    <td>
                        $ ${products[iter.index].price * orderedProduct.quantity}
                    </td>
                </tr>
            </c:forEach>

            </table>
            <table class="table table-bordered">
            <tr>
                <td><strong>Delivery surcharge</strong></td>
                <td>$ ${initParam.deliverySurcharge}</td>
            </tr>

            <tr>
                <td><strong>Total</strong></td>
                <td>$ ${orderRecord.amount}</td>
            </tr>

            <tr>
                <td><strong>Date processed</strong></td>
                <td> ${orderRecord.dateCreated}
                </td>
            </tr>
        </table>
    </div>

    <div class="summaryColumn" >
        <table class="table table-bordered">
            <tr>
                <th>Delivery address</th>
            </tr>

            <tr>
                <td>
                    ${customer.name}
                    <br>
                    ${customer.address}
                    <br>
                    Region ${customer.cityRegion}
                    <br>
                    <hr>
                    <strong>Email</strong> ${customer.email}
                    <br>
                    <strong>Phone</strong> ${customer.phone}
                </td>
            </tr>
        </table>
    </div>
