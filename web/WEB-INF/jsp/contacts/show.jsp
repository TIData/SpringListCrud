<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SHOW</title>
    </head>
    <body>
              <!-- TODO -->
              <spring:url value="/contacts/edit/" var="editContactUrl"/>
        <spring:message code="date.format.pattern" var="dateFormatPattern"/>

        <table>
            <tr>
                <td>Name</td>
                <td>${contact.firstname}</td>
            </tr>
            <tr>
                <td>Lastname</td>
                <td>${contact.lastname}</td>
            </tr>   
           
            <tr>
                <td>description</td>
                <td>${contact.description}</td>
            </tr>
            
             <tr>
                <td>birthday</td>
                <td><joda:format value="${contact.birthDate}" pattern="${dateFormatPattern}"/></td>
            </tr>
                                                                                                                    
        </table>         
        
          <!-- TODO -->
          <a href="${editContactUrl}${contact.id}.htm">Update</a>
        
    </body>
</html>
