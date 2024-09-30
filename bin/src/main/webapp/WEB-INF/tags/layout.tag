<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="home" tagdir="/WEB-INF/tags" %>

<%@ attribute name="pageName" required="true" %>
<%@ attribute name="customScript" required="false" fragment="true"%>

<!doctype html>
<html>
<home:htmlHeader/>

<body>
<home:bodyHeader menuName="${pageName}"/>

<div class="container-fluid">
    <div class="container xd-container">

        <jsp:doBody/>

        <home:pivotal/>
    </div>
</div>
<home:footer/>
<jsp:invoke fragment="customScript" />

</body>

</html>
