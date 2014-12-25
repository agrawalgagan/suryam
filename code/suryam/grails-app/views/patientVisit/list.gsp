
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
				<li><g:link class="create" action="create" params="['patient.id':patient?.id]"><g:message code="patientVisit.new.label"/></g:link></li>
			</ul>
		</div>
		<div id="list-patientVisit" class="content scaffold-list" role="main">
			<g:link controller="patient" action="show" id="${patient.id}"><h1>${patient?.name}</h1></g:link>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="appointmentTime" title="${message(code: 'patientVisit.appointmentTime.label', default: 'Appointment Time')}" />

                        <g:sortableColumn property="arrivalTime" title="${message(code: 'patientVisit.arrivalTime.label', default: 'Arrival Time')}" />

						<th><g:message code="patientVisit.referringDoctor.label" default="Referring Doctor" /></th>
						
						<th><g:message code="patientVisit.studies.label" default="Referring Doctor" /></th>

                        <g:sortableColumn property="reportTime" title="${message(code: 'patientVisit.reportTime.label', default: 'Report Time')}" />

                        <g:sortableColumn property="status" title="${message(code: 'patientVisit.status.label', default: 'Status')}" />

                        <th><g:message code="default.action.label" default="Action" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patientVisitInstanceList}" status="i" var="patientVisitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><sur:dateTime value="${patientVisitInstance.appointmentTime}" /></td>
					
						<td><sur:dateTime value="${patientVisitInstance.arrivalTime}" /></td>
					
						<td>${fieldValue(bean: patientVisitInstance, field: "referringDoctor.name")}</td>
						
						<td>
							<g:each in="${patientVisitInstance.studies}" var="study">
								<div>${study.displayName}</div>
							</g:each> 
						</td>

                        <td><sur:dateTime value="${patientVisitInstance.reportTime}"/></td>

                        <td><g:message code="patientVisit.status.${patientVisitInstance.status}"/></td>

                        <td><g:link action="edit" id="${patientVisitInstance.id}">Edit</g:link></td>
					
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
