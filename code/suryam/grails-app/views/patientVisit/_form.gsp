<%@ page import="com.suryam.domain.PatientVisit" %>



<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'patient', 'error')} ">
    <label for="patient">
        <g:message code="patientVisit.patient.label" default="Patient" />
    </label>

    ${patientVisitInstance?.patient?.name}

</div>



<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'appointmentTime', 'error')} required">
	<label for="appointmentTime">
		<g:message code="patientVisit.appointmentTime.label" default="Appointment Time" />
		<span class="required-indicator">*</span>
	</label>
    <sur:dateTimePicker name="appointmentTime" value="${patientVisitInstance?.appointmentTime}" required="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'arrivalTime', 'error')} required">
	<label for="arrivalTime">
		<g:message code="patientVisit.arrivalTime.label" default="Arrival Time" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:datePicker name="arrivalTime" precision="day"  value="${patientVisitInstance?.arrivalTime}"  />--}%
    <sur:dateTimePicker name="arrivalTime" value="${patientVisitInstance?.arrivalTime}" required="true"/>

</div>



<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'referringDoctor', 'error')} required">
	<label for="referringDoctor">
		<g:message code="patientVisit.referringDoctor.label" default="Referring Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="referringDoctor" name="referringDoctor.id" from="${com.suryam.domain.Doctor.list()}" optionKey="id" optionValue="name" noSelection="['' : '--Select--']" required="" value="${patientVisitInstance?.referringDoctor?.id}" class="many-to-one"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'reportTime', 'error')} ">
    <label for="reportTime">
        <g:message code="patientVisit.reportTime.label" default="Report Time" />

    </label>
    --}%%{--<g:datePicker name="reportTime" precision="day"  value="${patientVisitInstance?.reportTime}" default="none" noSelection="['': '']" />--}%%{--
    <sur:dateTimePicker name="reportTime"/>

</div>--}%
