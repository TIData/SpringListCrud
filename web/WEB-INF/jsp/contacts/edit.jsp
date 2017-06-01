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

        <spring:message code="label_contact_new" var="labelContactNew"/>
        <spring:message code="label_contact_update" var="labelContactUpdate"/>
        <spring:message code="label_contact_first_name" var="labelContactFirstName"/>
        <spring:message code="label_contact_last_name" var="labelContactLastName"/>
        <spring:message code="label_contact_birth_date" var="labelContactBirthDate"/>
        <spring:message code="label_contact_description" var="labelContactDescription"/>
        <spring:message code="label_contact_photo" var="labelContactPhoto"/>

        <spring:url value="/contacts/edit/" var="editContactUrl"/> 

         <!-- TODO New of Update? -->
         <spring:eval expression="contact.id == null ? labelContactNew:labelContactUpdate" var="formTitle"/>
    </head>

    <body>

        <spring:url value="/scripts/jquery-1.7.1.js" var="jquery_url" /> 
        <spring:url value="/scripts/jquery-ui-1.8.16.custom.min.js" var="jquery_ui_url" />          
        <spring:url value="/styles/custom-theme/jquery-ui-1.8.16.custom.css" var="jquery_ui_theme_css" />     

        <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_theme_css}"/>        
        <script src="${jquery_url}" type="text/javascript"><jsp:text/></script>
        <script src="${jquery_ui_url}" type="text/javascript"><jsp:text/></script>

        <script type="text/javascript">
            $(function () {
                $('#birthDate').datepicker({
                    dateFormat: 'yy-mm-dd',
                    changeYear: true
                });

                $("#contactDescription").ckeditor(
                        {
                            toolbar: 'Basic',
                            uiColor: '#CCCCCC'
                        }
                );
            });
        </script>

        <h1>${formTitle}</h1>

        <form:form modelAttribute="contact" method="post" >

             <!--TODO --> 
            <!--c:if test=" -->
            <c:if test="${not empty message}">
                <h3>
                    <div id="error" class="${message.type}">${message.message}</div>
                </h3>
            </c:if>
            

            <form:hidden path="id" />

            <p><label>${labelContactFirstName}*</label>
                <form:input path="firstname" size = "20"/>
                <form:errors path="firstname" cssClass="error"/>
            </p>


            <p><label>${labelContactLastName}*</label>
                <form:input path="lastname" size = "20"/>
                <form:errors path="lastname" cssClass="error"/>
            </p>


            <p><label>${labelContactBirthDate}*</label>
                <form:input path="birthDate" size = "20"/>
                <form:errors path="birthDate" cssClass="error"/>
            </p>


            <p><label>${labelContactDescription}*</label>
                <form:textarea cols="60" rows="8" path="description" id="contactDescription"/>
                <form:errors path="description" cssClass="error"/>
            </p>


            <form:hidden path="version" />

            <input type="submit" align="center" value="Save"/>&nbsp;
            <input type="reset" align="center" value="Reset"/>

        </form:form>   
    </body>

</html>
