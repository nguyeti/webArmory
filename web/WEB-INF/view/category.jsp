<%-- 
    Document   : category.jsp
    Created on : Jan 12, 2014, 5:32:39 PM
    Author     : Timothy
--%>         
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and French. --%>
<c:set var='view' value='/category' scope='session' />
<!--<p id="categoryTitle">
    <span style="background-color: #f5eabe; padding: 7px;">You are looking at ${selectedCategory.name}</span>
</p>-->

<br/>
<ul class="nav nav-justified">
    
    
    <c:forEach var="category" items="${categories}">
        <c:choose>
            <c:when test="${category.name == selectedCategory.name}">
                <li><a href="#"><fmt:message key="${category.name}"/></a></li>
            </c:when>
            <c:otherwise>
                <li> <a href="category?${category.id}"><fmt:message key="${category.name}"/></a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</ul>
<br/>
<div class="row">
    
    <c:forEach var="product" items="${categoryProducts}" varStatus="iter">
        
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="${initParam.productsImagePath}${product.name}.jpg" alt="${product.name}"/>
                <div class="caption">
                    <center>
                        <h1>${product.name}</h1>
                        <h3>${product.price} $</h3>
                        <form action="addToCart" method="post">
                            <input type="hidden"
                                   name="productId"
                                   value="${product.id}">
                            <input class="btn btn-success" type="submit"
                                   value="<fmt:message key="add"/> &raquo;">
                        </form>
                    </center>
                    
                </div>
            </div>
            <div class="panel-group" id="${product.name}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <a data-toggle="collapse" data-parent="#${product.name}" 
                               href="#${product.id}">
                                <center><b><fmt:message key="characteristics"/></b></center>
                            </a>
                        </h3>
                    </div>
                    <div id="${product.id}" class="panel-collapse collapse">
                        <div class="panel-body">
                            <li><b><fmt:message key="cartridge"/></b> ${product.cartridge}</li>
                            <li><b><fmt:message key="weight"/></b> ${product.weight}</li>
                            <li><b><fmt:message key="firing_range"/></b> ${product.firingRange}</li>
                            <li><b><fmt:message key="maker"/></b> ${product.maker}</li>
                            <li><b><fmt:message key="origin"/></b> ${product.origin}</li>
                            
                        </div>
                    </div>
                </div>
            </div> 
            <div class="panel-group" id="${product.name}2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <a data-toggle="collapse" data-parent="#${product.name}2" 
                               href="#${product.id}2">
                                <center><b>Description</b></center>
                            </a>
                        </h3>
                    </div>
                    <div id="${product.id}2" class="panel-collapse collapse">
                        <div class="panel-body">
                            <fmt:message key="${product.description}"/>
                            
                        </div>
                    </div>
                </div>
            </div> 
            
        </div>
    </c:forEach>
</div>



