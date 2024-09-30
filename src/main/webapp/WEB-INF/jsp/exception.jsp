<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="home" tagdir="/WEB-INF/tags" %>

<home:layout pageName="error">

    <spring:url value="/resources/images/pets.png" var="petsImage"/>
    <img src="${petsImage}" alt="A cat and a dog"/>

    <h2>Something happened...</h2>

    <p>${exception.message}</p>

</home:layout>
