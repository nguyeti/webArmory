<%-- 
    Document   : login
    Created on : Jan 23, 2014, 3:10:48 PM
    Author     : Timothy
--%>


    
<form class="form-signin" role="form" action="<c:url value='j_security_check'/>" method=post>
    <h2 class="form-signin-heading">Admin console</h2>
    <input type="text" class="form-control" placeholder="username" required autofocus name="j_username">
    <input type="password" class="form-control" placeholder="password" required name="j_password">
    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
</form>

  
    
