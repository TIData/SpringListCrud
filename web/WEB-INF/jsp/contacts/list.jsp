<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <spring:url value="/css/style.css" var="urlCss"/>
        <link rel="stylesheet" href="${urlCss}" type="text/css" />
        <title>Spring 3 MVC CRUD</title>
    </head>
    <body>
        <spring:message code="date.format.pattern" var="dateFormatPattern"/>
        <h2>Show Contacts</h2>
        <table width="50%">
            <tr>
                <th>Name</th>
                <th>Lastname</th>
                <th>Description</th>
                <th>BirthDay</th>
            </tr>

            <!-- TODO -->
            <spring:url value ="/contacts/" var="showContactUrl"/>
            
            <c:forEach items="${contactList}" var="contact" varStatus="status">
                <tr>
                    
                    <td>
                            <!-- TODO-->
                            <a href="${showContactUrl}${contact.id}.htm">${contact.firstname}</a>
  
                         
                    </td> 
                 
                <td>${contact.lastname}</td>
                <td>${contact.description}</td>
                
                <td><joda:format value="${contact.birthDate}" pattern="${dateFormatPattern}"/></td>
            
            </tr>
        </c:forEach>
 
    </table>	
    <br>
    
</body>
</html>