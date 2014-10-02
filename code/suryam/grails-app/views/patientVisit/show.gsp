
<%@ page import="com.suryam.domain.PatientVisit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patientVisit.label', default: 'PatientVisit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patientVisit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patientVisit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patientVisit">
			
				<g:if test="${patientVisitInstance?.reportTime}">
				<li class="fieldcontain">
					<span id="reportTime-label" class="property-label"><g:message code="patientVisit.reportTime.label" default="Report Time" /></span>
					
						<span class="property-value" aria-labelledby="reportTime-label"><g:formatDate date="${patientVisitInstance?.reportTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientVisitInstance?.appointmentTime}">
				<li class="fieldcontain">
					<span id="appointmentTime-label" class="property-label"><g:message code="patientVisit.appointmentTime.label" default="Appointment Time" /></span>
					
						<span class="property-value" aria-labelledby="appointmentTime-label"><g:formatDate date="${patientVisitInstance?.appointmentTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientVisitInstance?.arrivalTime}">
				<li class="fieldcontain">
					<span id="arrivalTime-label" class="property-label"><g:message code="patientVisit.arrivalTime.label" default="Arrival Time" /></span>
					
						<span class="property-value" aria-labelledby="arrivalTime-label"><g:formatDate date="${patientVisitInstance?.arrivalTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientVisitInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="patientVisit.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${patientVisitInstance?.patient?.id}">${patientVisitInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientVisitInstance?.referringDoctor}">
				<li class="fieldcontain">
					<span id="referringDoctor-label" class="property-label"><g:message code="patientVisit.referringDoctor.label" default="Referring Doctor" /></span>
					
						<span class="property-value" aria-labelledby="referringDoctor-label"><g:link controller="doctor" action="show" id="${patientVisitInstance?.referringDoctor?.id}">${patientVisitInstance?.referringDoctor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:patientVisitInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${patientVisitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
