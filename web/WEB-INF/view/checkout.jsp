<%-- 
    Document   : checkout.jsp
    Created on : Jan 12, 2014, 5:32:58 PM
    Author     : Timothy
--%>


<h2>Checkout</h2>
<p>In order to purchase the items in your shopping cart, please provide us with the following information:</p>
<div class="row">
    <div class="col-lg-7">
        <c:if test="${!empty orderFailureFlag}">
            <p>We were unable to process your order. Please try again!</p>
        </c:if>
        <c:if test="${!empty validationErrorFlag}">
            
                    <span>Please provide valid entries for the following field(s):
                        
                        <c:if test="${!empty nameError}">
                            <br><span><strong>Name</strong> (e.g., Bilbo Baggins)</span>
                        </c:if>
                        <c:if test="${!empty emailError}">
                            <br><span><strong>Email</strong> (e.g., b.baggins@hobbit.com)</span>
                        </c:if>
                        <c:if test="${!empty phoneError}">
                            <br><span><strong>Phone number</strong> (e.g., 222333444)</span>
                        </c:if>
                        <c:if test="${!empty addressError}">
                            <br><span><strong>Address</strong> (e.g., Korunní 56)</span>
                        </c:if>
                        <c:if test="${!empty cityRegionError}">
                            <br><span><strong>City region</strong> (e.g., 2)</span>
                        </c:if>
                        <c:if test="${!empty ccNumberError}">
                            <br><span><strong>Credit card</strong> (e.g., 1111222233334444)</span>
                        </c:if>
                        
                    </span>
               
        </c:if> 
        <form action="<c:url value='purchase'/>" method="post" role="form">
            <div class="form-group">
                <label for="name">Name</label>
                <input class="form-control" type="text" name="name" value="${param.name}">           
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input class="form-control" type="text" name="email" value="${param.email}">           
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input class="form-control" type="text" name="phone" value="${param.phone}">           
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input class="form-control" type="text" name="address" value="${param.address}">           
            </div>
            <div class="form-group">
                <label for="cityRegion">Region</label>
                <select name="cityRegion" class="form-control">
                        <c:forEach begin="1" end="10" var="regionNumber">
                            <option value="${regionNumber}"
                                    <c:if test="${param.cityRegion eq regionNumber}">selected</c:if>>${regionNumber}</option>
                        </c:forEach>
                    </select>          
            </div>
           <div class="form-group">
                <label for="creditcard">Credit card number</label>
                <input class="form-control" type="text" name="creditcard" value="${param.creditcard}">           
            </div>
                <input type="submit" value="Submit" class="btn btn-success">
        </form>  
    </div>
    
    <div class="col-lg-5">
        <ul>
            <li>Next-week delivery is guaranteed</li>
            <li>A $ ${initParam.deliverySurcharge}
                delivery surcharge is applied to all purchase orders</li>
        </ul>
        
        <table class="table table-striped table-bordered">
            <tr>
                <th>Subtotal:</th>
                <td class="checkoutPriceColumn">
                    $ ${cart.subtotal}</td>
            </tr>
            <tr>
                <th>Delivery surcharge:</th>
                <td class="checkoutPriceColumn">
                    $ ${initParam.deliverySurcharge}</td>
            </tr>
            <tr>
                <th class="total">Total:</th>
                <td class="total checkoutPriceColumn">
                    $ ${cart.total}</td>
            </tr>
        </table>
    </div>
</div>