
<%@ page import="com.suryam.domain.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="search-patient" class="content scaffold-create" role="main">
    <h1><g:message code="patient.search.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:form url="[action:'search']" >
        <fieldset class="form">
            <div class="fieldcontain">
                <label for="firstName">
                    <g:message code="patient.firstName.label" default="First Name" />
                </label>
                <g:textField name="firstName" value="${patientSearch?.firstName}"/>
            </div>
            <div class="fieldcontain">
                <label for="lastName">
                    <g:message code="patient.lastName.label" default="Last Name" />
                </label>
                <g:textField name="lastName" value="${patientSearch?.lastName}"/>
            </div>
            <div class="fieldcontain">
                <label for="phone">
                    <g:message code="patient.phone.label" default="Phone" />
                </label>
                <g:textField name="phone" value="${patientSearch?.phone}"/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.search.label', default: 'Search')}" />
        </fieldset>
    </g:form>
</div>
<br>
<div id="list-patient" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="firstName" title="${message(code: 'patient.name.label', default: 'Name')}" />
            <g:sortableColumn property="gender" title="${message(code: 'patient.gender.label')}" />
            <g:sortableColumn property="dob" title="${message(code: 'patient.dob.label')}" />
            <g:sortableColumn property="phone" title="${message(code: 'patient.phone.label', default: 'Phone')}" />
            <g:sortableColumn property="email" title="${message(code: 'patient.email.label')}" />
            <th><g:message code="patientVisit.list.label"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${patientInstanceList}" status="i" var="patientInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${patientInstance.id}">${fieldValue(bean: patientInstance, field: "name")}</g:link></td>
                <td>${fieldValue(bean: patientInstance, field: "gender")}</td>
                <td><sur:dob value="${patientInstance?.dob}"/></td>
                <td>${fieldValue(bean: patientInstance, field: "phone")}</td>
                <td>${fieldValue(bean: patientInstance, field: "email")}</td>
                <td><g:link class="list" controller="patientVisit" action="list" id="${patientInstance?.id}">visits</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${patientInstanceList?.totalCount ?: 0}" max="${com.suryam.util.Constants.DEFAULT_MAX_PAGE_SIZE}"/>
    </div>
</div>
</body>
</html>
