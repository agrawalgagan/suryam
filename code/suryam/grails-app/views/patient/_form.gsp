<%@ page import="com.suryam.domain.Patient" %>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="patient.firstName.label" default="First Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${patientInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="patient.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${patientInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'parentName', 'error')} ">
	<label for="parentName">
		<g:message code="patient.parentName.label" default="Parent Name" />
		
	</label>
	<g:textField name="parentName" value="${patientInstance?.parentName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'gender', 'error')} required">
    <label for="gender">
        <g:message code="patient.gender.label" default="Gender" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="gender" from="${com.suryam.domain.Gender?.values()}" keys="${com.suryam.domain.Gender.values()*.name()}" noSelection="['':'--Select--']" required="" value="${patientInstance?.gender?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'dob', 'error')} ">
	<label for="dob">
		<g:message code="patient.dob.label" default="Dob" />
		
	</label>
	%{--<g:datePicker name="dob" precision="day"  value="${patientInstance?.dob}" default="none" noSelection="['': '']" />--}%
    <sur:datePicker name="dob"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'height', 'error')} ">
	<label for="height">
		<g:message code="patient.height.label" default="Height" />
		
	</label>
	<g:field name="height" value="${fieldValue(bean: patientInstance, field: 'height')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="patient.weight.label" default="Weight" />
		
	</label>
	<g:field name="weight" value="${fieldValue(bean: patientInstance, field: 'weight')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="patient.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${patientInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'phone', 'error')} required">
    <label for="phone">
        <g:message code="patient.phone.label" default="Phone" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phone" required="" value="${patientInstance?.phone}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="patient.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${patientInstance?.email}"/>

</div>






