<%@page import="com.suryam.domain.VisitStatus"%>
<%@ page import="com.suryam.domain.PatientVisit" %>



<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'patient', 'error')} ">
    <label for="patient">
        <g:message code="patientVisit.patient.label" default="Patient" />
    </label>

    ${patientVisitInstance?.patient?.name}

</div>

<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="patientVisit.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
    <g:select name="status" from="${VisitStatus.values()}" value="${patientVisitInstance?.status}"/>
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

<div class="fieldcontain">
    <label for="referringDoctor">
        <g:message code="patientVisit.study.label" default="Studies" />
        <span class="required-indicator">*</span>
    </label>
    <div class="studies">
	    <g:each in="${com.suryam.domain.Study.getRootStudies()}">
	        <div><b>${it.name}</b></div>
	        <g:each in="${it.childStudies}" var="child">
	            <div class="substudies"><g:checkBox name="studys" value="${child.id}" checked="${patientVisitInstance?.studies?.id?.contains(child.id)}"/> 
	            	${child.name} <i>(Rs. ${child.cost})</i>
	            </div>
	        </g:each>
	    </g:each>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'discount', 'error')}">
	<label for="discount">
		<g:message code="patientVisit.discount.label" default="Discount" />
	</label>
    <g:textField name="discount" value="${patientVisitInstance?.discount}"/>
</div>
<div class="fieldcontain">
	<label for="totalCost">
		<g:message code="patientVisit.totalCost.label" default="Total Cost" />
	</label>
    <span id="totalCost">Rs. ${patientVisitInstance?.totalCost}</span>
</div>

<div class="fieldcontain">
	<label for="amountPaid">
		<g:message code="patientVisit.amountPaid.label" default="Amount Paid" />
	</label>
    <g:textField name="amountPaid" value="${patientVisitInstance?.amountPaid}"/>
</div>

<div class="fieldcontain">
	<label for="amountPending">
		<g:message code="patientVisit.amountPending.label" default="Amount Pending" />
	</label>
    <span>Rs. ${patientVisitInstance?.amountPending}</span>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'reportTime', 'error')} ">
    <label for="reportTime">
        <g:message code="patientVisit.reportTime.label" default="Report Time" />

    </label>
    --}%%{--<g:datePicker name="reportTime" precision="day"  value="${patientVisitInstance?.reportTime}" default="none" noSelection="['': '']" />--}%%{--
    <sur:dateTimePicker name="reportTime"/>

</div>--}%
