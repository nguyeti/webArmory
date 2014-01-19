<%-- 
    Document   : index.jsp
    Created on : Jan 12, 2014, 9:14:10 PM
    Author     : Timothy
--%>
<!-- Jumbotron -->
<div class="jumbotron">
    
    <h1>Get your weapon now!</h1>
    <p class="lead">What are you waiting for? Buy 1 get 5 FREE!!</p>
    <a href="category?1" class="btn btn-success">Buy now </a>
</div>

<div class="row">
    <c:forEach var="category" items="${categories}">
        
        
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="${initParam.rootImagePath}${category.name}.jpg" alt="${category.name}">
                <div class="caption">
                    <h2>${category.name}</h2>
                    <p>${category.description}</p>
                    <a href="category?${category.id}" class="btn btn-primary">Learn more &raquo;</a>
                </div>
            </div>
        </div>
        
    </c:forEach>
</div>





