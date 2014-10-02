
<%@ page import="com.suryam.domain.PatientVisit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patientVisit.label', default: 'PatientVisit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-patientVisit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-patientVisit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="reportTime" title="${message(code: 'patientVisit.reportTime.label', default: 'Report Time')}" />
					
						<g:sortableColumn property="appointmentTime" title="${message(code: 'patientVisit.appointmentTime.label', default: 'Appointment Time')}" />
					
						<g:sortableColumn property="arrivalTime" title="${message(code: 'patientVisit.arrivalTime.label', default: 'Arrival Time')}" />
					
						<th><g:message code="patientVisit.patient.label" default="Patient" /></th>
					
						<th><g:message code="patientVisit.referringDoctor.label" default="Referring Doctor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patientVisitInstanceList}" status="i" var="patientVisitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${patientVisitInstance.id}">${fieldValue(bean: patientVisitInstance, field: "reportTime")}</g:link></td>
					
						<td><g:formatDate date="${patientVisitInstance.appointmentTime}" /></td>
					
						<td><g:formatDate date="${patientVisitInstance.arrivalTime}" /></td>
					
						<td>${fieldValue(bean: patientVisitInstance, field: "patient")}</td>
					
						<td>${fieldValue(bean: patientVisitInstance, field: "referringDoctor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${patientVisitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
