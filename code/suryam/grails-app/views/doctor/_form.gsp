<%@ page import="com.suryam.domain.Doctor" %>



<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="doctor.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${doctorInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'dob', 'error')} required">
	<label for="dob">
		<g:message code="doctor.dob.label" default="Dob" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dob" precision="day"  value="${doctorInstance?.dob}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="doctor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${doctorInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="doctor.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${doctorInstance?.phone}"/>

</div>

