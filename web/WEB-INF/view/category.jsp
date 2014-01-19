<%-- 
    Document   : category.jsp
    Created on : Jan 12, 2014, 5:32:39 PM
    Author     : Timothy
--%>         

<p id="categoryTitle">
    <span style="background-color: #f5eabe; padding: 7px;">You are looking at ${selectedCategory.name}</span>
</p>

<br/>
<ul class="nav nav-justified">
    
    
    <c:forEach var="category" items="${categories}">
        <c:choose>
            <c:when test="${category.name == selectedCategory.name}">
                <li><a href="#">${category.name}</a></li>
            </c:when>
            <c:otherwise>
                <li> <a href="category?${category.id}">${category.name}</a></li>
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
                                   value="Add to cart &raquo;">
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
                                <center><b>Characteristics</b></center>
                            </a>
                        </h3>
                    </div>
                    <div id="${product.id}" class="panel-collapse collapse">
                        <div class="panel-body">
                            <li><b>Cartridge:</b> ${product.cartridge}</li>
                            <li><b>Weight:</b> ${product.weight}</li>
                            <li><b>Firing Range:</b> ${product.firingRange}</li>
                            <li><b>Maker:</b> ${product.maker}</li>
                            <li><b>Origin:</b> ${product.origin}</li>
                            
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
                            ${product.description}
                            
                        </div>
                    </div>
                </div>
            </div> 
            
        </div>
    </c:forEach>
</div>



