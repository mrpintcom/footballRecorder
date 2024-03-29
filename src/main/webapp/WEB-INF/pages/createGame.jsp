<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Game Management</title>
    <%--<link--%>
    <%--href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"--%>
    <%--rel="stylesheet" />--%>
    <%--<script--%>
    <%--src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>--%>
    <script src="<c:url value="/resources/js/jquery.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.min.js" />" type="text/javascript" ></script>
    <script src="<c:url value="/resources/js/jquery.dataTables.min.js" />" type="text/javascript"></script>
    <link href="<c:url value="/resources/css/jquery.dataTables.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery.dataTables_themeroller.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/smoothness/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp" />
<div class="wrapper">

    <div class="add">
        <h1>Create New Game</h1>
        <p>Create a new game to get started!</p>

        <form:form method="POST" commandName="game"
                   action="${pageContext.request.contextPath}/game/create.html">
            <div class="control-group">
                <label class="control-label" for="inputOpponent">Opponent</label>
                <div class="controls">
                    <form:input type="text" id="inputOpponent" path="Opponent" placeholder="Opponent"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputDate">Date</label>
                <div class="controls">
                    <form:input type="text" id="inputDate" placeholder="Date" path="Date"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputLocation">Location</label>
                <div class="controls">
                    <form:input type="text" id="inputLocation" placeholder="Location" path="Location"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputWeather">Weather</label>
                <div class="controls">
                    <form:input type="text" id="inputWeather" placeholder="Weather" path="Weather"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputFieldType">FieldType</label>
                <div class="controls">
                    <form:input type="text" id="inputFieldType" placeholder="Field Type"
                                path="FieldType"/>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn">Add Game</button>
                </div>
            </div>
        </form:form>
    </div>
    <div class="gamesTable">
        <div class="table-results">
            <%--<h1>Game History</h1>--%>
            <table class = "table table-hover" id="example"  cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th>Opponent</th>
                    <th>Date</th>
                    <th>Field Type</th>
                    <th>Location</th>
                    <th>Weather</th>
                    <th>Options</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="game" items="${games}">
                    <tr>
                        <td>${game.opponent}</td>
                        <td>${game.date}</td>
                        <td>${game.fieldType}</td>
                        <td>${game.location}</td>
                        <td>${game.weather}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/game/edit/${game.id}.html">Edit</a><br>
                            <a href="${pageContext.request.contextPath}/game/delete/${game.id}.html">Delete</a><br>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
//    document.getElementById("playersNav").setAttribute("class","active");



$(document).ready(function() {
    oTable = $('#example').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers"
    });
} );
</script>
</html>