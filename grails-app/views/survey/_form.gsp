<%@ page import="com.chicow.ticbox.engine.Survey" %>



<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'footer', 'error')} ">
	<label for="footer">
		<g:message code="survey.footer.label" default="Footer" />
		
	</label>
	<g:textField name="footer" value="${surveyInstance?.footer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'header', 'error')} ">
	<label for="header">
		<g:message code="survey.header.label" default="Header" />
		
	</label>
	<g:textField name="header" value="${surveyInstance?.header}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="survey.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${surveyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'uuid', 'error')} ">
	<label for="uuid">
		<g:message code="survey.uuid.label" default="Uuid" />
		
	</label>
	<g:textField name="uuid" value="${surveyInstance?.uuid}"/>
</div>

