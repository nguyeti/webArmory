<%-- 
    Document   : checkout.jsp
    Created on : Jan 12, 2014, 5:32:58 PM
    Author     : Timothy & Etienne
--%>
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and French. --%>

<c:set var='view' value='/checkout' scope='session' />    
    
<h2><fmt:message key="checkout_page"/></h2>

<p><fmt:message key="info"/></p>
<div class="row">
    <div class="col-lg-7">
            <c:if test="${!empty orderFailureFlag}">
                <p>We were unable to process your order. Please try again!</p>
            </c:if>
                
            <c:if test="${!empty validationErrorFlag}">
                <span class="errorColor"><fmt:message key="info_error"/>
                    <c:if test="${!empty nameError}">
                        <br><span><strong><fmt:message key="name"/></strong> (e.g., Bilbo Baggins)</span>
                    </c:if>
                    <c:if test="${!empty emailError}">
                        <br><span><strong><fmt:message key="email"/></strong> (e.g., b.baggins@hobbit.com)</span>
                    </c:if>
                    <c:if test="${!empty phoneError}">
                        <br><span><strong><fmt:message key="phone"/> number</strong> (e.g., 222333444)</span>
                    </c:if>
                    <c:if test="${!empty addressError}">
                        <br><span><strong><fmt:message key="address"/></strong> (e.g., Korunní 56)</span>
                    </c:if>
                    <c:if test="${!empty cityRegionError}">
                        <br><span><strong><fmt:message key="region"/></strong> (e.g., 2)</span>
                    </c:if>
                    <c:if test="${!empty ccNumberError}">
                        <br><span><strong><fmt:message key="cb"/></strong> (e.g., 1111222233334444)</span>
                    </c:if>
                </span>
            </c:if> 
        
        <form action="<c:url value='purchase'/>" method="post" role="form">
            <div class="form-group">
                <label for="name"><fmt:message key="name"/></label>
                <input class="form-control" type="text" name="name" value="${param.name}">           
            </div>
            <div class="form-group">
                <label for="email"><fmt:message key="email"/></label>
                <input class="form-control" type="text" name="email" value="${param.email}">           
            </div>
            <div class="form-group">
                <label for="phone"><fmt:message key="phone"/></label>
                <input class="form-control" type="text" name="phone" value="${param.phone}">           
            </div>
            <div class="form-group">
                <label for="address"><fmt:message key="address"/></label>
                <input class="form-control" type="text" name="address" value="${param.address}">           
            </div>
            <div class="form-group">
                <label for="cityRegion"><fmt:message key="region"/></label>
                <select name="cityRegion" class="form-control">
                    <c:forEach begin="1" end="10" var="regionNumber">
                        <option value="${regionNumber}"
                                <c:if test="${param.cityRegion eq regionNumber}">selected</c:if>>${regionNumber}</option>
                    </c:forEach>
                </select>          
            </div>
            <div class="form-group">
                <label for="creditcard"><fmt:message key="cb"/></label>
                <input class="form-control" type="text" name="creditcard" value="${param.creditcard}">           
            </div>
                <input type="submit" value="<fmt:message key="submit"/>" class="btn btn-success">
        </form>  
    </div>
        
    <div class="col-lg-5">
        <ul>
            <li><fmt:message key="delivery"/></li>
            <li><fmt:message key="frais_info"/></li>
        </ul>
            
        <table class="table table-striped table-bordered">
            <tr>
                <th><fmt:message key="subtotal"/></th>
                <td class="checkoutPriceColumn">
                    $ ${cart.subtotal}</td>
            </tr>
            <tr>
                <th><fmt:message key="frais"/></th>
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