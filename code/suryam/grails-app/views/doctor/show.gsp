
<%@ page import="com.suryam.domain.Doctor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-doctor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-doctor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list doctor">

				<g:if test="${doctorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="doctor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${doctorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doctorInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="doctor.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${doctorInstance}" field="phone"/></span>
					
				</li>
				</g:if>

                <g:if test="${doctorInstance?.dob}">
                    <li class="fieldcontain">
                        <span id="dob-label" class="property-label"><g:message code="doctor.dob.label" default="Dob" /></span>

                        <span class="property-value" aria-labelledby="dob-label"><g:formatDate date="${doctorInstance?.dob}" /></span>

                    </li>
                </g:if>

                <g:if test="${doctorInstance?.address}">
                    <li class="fieldcontain">
                        <span id="address-label" class="property-label"><g:message code="doctor.address.label" default="Address" /></span>

                        <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${doctorInstance}" field="address"/></span>

                    </li>
                </g:if>
			
			</ol>
			<g:form url="[resource:doctorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${doctorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
