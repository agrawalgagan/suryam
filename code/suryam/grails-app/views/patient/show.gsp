
<%@ page import="com.suryam.domain.Patient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patient">

				<g:if test="${patientInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="patient.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${patientInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="patient.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${patientInstance}" field="phone"/></span>
					
				</li>
				</g:if>

                <g:if test="${patientInstance?.dob}">
                    <li class="fieldcontain">
                        <span id="dob-label" class="property-label"><g:message code="patient.dob.label" default="Dob" /></span>

                        <span class="property-value" aria-labelledby="dob-label"><g:formatDate date="${patientInstance?.dob}" /></span>

                    </li>
                </g:if>

                <g:if test="${patientInstance?.address}">
                    <li class="fieldcontain">
                        <span id="address-label" class="property-label"><g:message code="patient.address.label" default="Address" /></span>

                        <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${patientInstance}" field="address"/></span>

                    </li>
                </g:if>
			
			</ol>
			<g:form url="[resource:patientInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${patientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
