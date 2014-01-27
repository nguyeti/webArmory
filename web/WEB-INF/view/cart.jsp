<%-- 
    Document   : cart.jsp
    Created on : Jan 12, 2014, 5:32:50 PM
    Author     : Timothy & Etienne
--%>
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and French. --%>
<c:set var='view' value='/cart' scope='session' />
<br/>
<div align="center">
   
    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <!--<h3>Your shopping cart contains ${cart.numberOfItems} items.</h3>-->
        </c:when>
       <c:when test="${cart.numberOfItems == 1}">
<!--            <h3>Your shopping cart contains ${cart.numberOfItems} item.</h3>-->
        </c:when>
        <c:otherwise>
            <h3><fmt:message key="empty_cart"/></h3>
        </c:otherwise>
    </c:choose>
            
    <%-- clear cart widget --%>
    <c:if test="${!empty cart && cart.numberOfItems != 0}">
        <a href="viewCart?clear=true" class="btn btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> <fmt:message key="clear"/></a>
    </c:if>
    
    <%-- continue shopping widget --%>
    <c:set var="value">
        <c:choose>
            <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
            <c:when test="${!empty selectedCategory}">
                category
            </c:when>
            <%-- otherwise send user to welcome page --%>
            <c:otherwise>
                index.jsp
            </c:otherwise>
        </c:choose>
    </c:set>
    
    <a href="${value}" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> <fmt:message key="continue"/></a>
    
    <%-- checkout widget --%>
    <c:if test="${!empty cart && cart.numberOfItems != 0}">
        <a href="<c:url value='checkout'/>" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span> <fmt:message key="checkout"/></a>
    </c:if>        
</div>
<br/>
<c:if test="${!empty cart && cart.numberOfItems != 0}">
    <table class="table table-hover">
        <tr class="header">
            <th><fmt:message key="product_name"/></th>
            <th><fmt:message key="price"/></th>
            <th><fmt:message key="quantity"/></th>
        </tr>
        
        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">
            <c:set var="product" value="${cartItem.product}"/>
                <tr> 
                    <td>${product.name}</td>
                    <td>
                        $ ${cartItem.total}
                        <br>
                        <span class="smallText">( $ ${product.price} / unit )</span>
                        </td>

                        <td>
                            <form action="updateCart" method="post">
                                <input type="hidden"
                                       name="productId"
                                       value="${product.id}">
                                <input type="text"
                                       maxlength="2"
                                       size="2"
                                       value="${cartItem.quantity}"
                                       name="quantity"
                                       style="margin:5px">
                                <input type="submit"
                                       name="submit"
                                       value="<fmt:message key="update"/>">
                            </form>
                        </td>
                    </tr>
            </c:forEach>
        </table>
    <h3 align="center"><u><fmt:message key="subtotal"/>:</u> $ ${cart.subtotal}</h3>
</c:if>
