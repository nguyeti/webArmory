<%-- 
    Document   : index.jsp
    Created on : Jan 12, 2014, 9:14:10 PM
    Author     : Timothy & Etienne
--%>
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and French. --%>
<c:set var='view' value='/index' scope='session' />
<!-- Jumbotron -->
<div class="jumbotron">
    
    <h1><fmt:message key="greeting"/></h1>
    <a href="category?1" class="btn btn-success"><fmt:message key="buy_button"/></a>
</div>

<div class="row">
    <c:forEach var="category" items="${categories}">
        
        
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="${initParam.rootImagePath}${category.name}.jpg" alt="<fmt:message key="${category.name}"/>">
                <div class="caption">
                    <h2><fmt:message key="${category.name}"/></h2>
                    <p><fmt:message key="${category.description}"/></p>
                    <a href="category?${category.id}" class="btn btn-primary"><fmt:message key="learn_more"/> &raquo;</a>
                </div>
            </div>
        </div>
        
    </c:forEach>
</div>





