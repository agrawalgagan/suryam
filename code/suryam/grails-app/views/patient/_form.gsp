<%@ page import="com.suryam.domain.Patient" %>



<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="patient.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${patientInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'dob', 'error')} required">
	<label for="dob">
		<g:message code="patient.dob.label" default="Dob" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dob" precision="day"  value="${patientInstance?.dob}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="patient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${patientInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="patient.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${patientInstance?.phone}"/>

</div>

