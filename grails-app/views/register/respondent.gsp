<html>

<head>
	<meta name='layout' content='ticbox_main'/>
	<title><g:message code='spring.security.ui.register.title'/></title>
</head>

<body>

<!--
<div class='body'>
	
	<section id="forms">
	  <div class="row">
	    <div class="span8 offset2">

	
<g:form action='register' name='registerForm'>

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>

	<br/>



      <form class="form-horizontal well">
        <fieldset>
          
          <div class="control-group">
            <label class="control-label" for="input01">Username</label>
            <div class="controls">
              	<g:textField name='username' labelCode='user.username.label' bean="${command}"
		                         size='40' labelCodeDefault='Username' value="${command.username}"/>
            </div>
          </div>
		 <div class="control-group">
            <label class="control-label" for="input01">Email</label>
            <div class="controls">
              	<g:textField name='email' bean="${command}" value="${command.email}"
				                   size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>
            </div>
          </div>
		 <div class="control-group">
            <label class="control-label" for="input01">Password</label>
            <div class="controls">
              	<g:passwordField name='password' labelCode='user.password.label' bean="${command}"
		                             size='40' labelCodeDefault='Password' value="${command.password}"/>
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label" for="input01">Re-password</label>
            <div class="controls">
              	<g:passwordField name='password' labelCode='user.password.label' bean="${command}"
		                             size='40' labelCodeDefault='Password' value="${command.password}"/>
            </div>
          </div>

          <div class="control-group">
            <label class="control-label" for="select01">Select list</label>
            <div class="controls">
              	<g:select id="type" name='country' value="${command.country}"
									    noSelection="${['null':'Select One...']}"
									    from='${country}'></g:select>
            </div>
          </div>



          <div class="form-actions">
			<a class="btn btn-primary btn-large">Submit</a>
			<g:submitButton name='Submit' elementId='create' form='registerForm' messageCode='spring.security.ui.register.submit'/>
          </div>
        </fieldset>
      </form>
    							
							


	</g:else>

</g:form>


<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</div>
</div>
</section>
</div>
-->

<div class="body">
  
	<g:if test='${emailSent}'>
		<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:elseif test="${flash.error}">
		<g:message code='${flash.error}'/>
	</g:elseif>
	<g:else>
	
  <section id="forms">

  <div class="row">
    <div class="span6 offset3">
 
		<g:hasErrors bean="${command}">
		<ul class="errors" role="alert">
			<g:eachError bean="${command}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		
      <g:form class="form-horizontal well">
        <fieldset>
          
          <div class="control-group">
		            <label class="control-label" for="input01">Username</label>
		            <div class="controls">
		              	<g:textField name='username' labelCode='user.username.label' bean="${command}"
				                         size='40' labelCodeDefault='Username' value="${command.username}"/>
		            </div>
		          </div>
		
          <div class="control-group">
            <label class="control-label" for="input02">Email</label>
            <div class="controls">
             	<g:textField name='email' bean="${command}" value="${command.email}"
				                   size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="input03">Password</label>
            <div class="controls">
              	<g:passwordField name='password' labelCode='user.password.label' bean="${command}"
		                             size='40' labelCodeDefault='Password' value="${command.password}"/>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="input04">Password Confirm</label>
            <div class="controls">
              	<g:passwordField name='password2' labelCode='user.password2.label' bean="${command}"
		                             size='40' labelCodeDefault='Password2' value="${command.password2}"/>
            </div>
          </div>
          
          <div class="control-group">
            <label class="control-label" for="select01">Country</label>
            <div class="controls">
              	<g:select id="type" name='country' value="${command.country}"
									    noSelection="${['null':'Select One...']}"
									    from='${country}'></g:select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="select02">Province</label>
            <div class="controls">
              	<g:select id="type" name='province' value="${command.province}"
									    noSelection="${['null':'Select One...']}"
									    from='${province}'></g:select>
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label" for="select03">City</label>
            <div class="controls">
              	<g:select id="type" name='city' value="${command.city}"
									    noSelection="${['null':'Select One...']}"
									    from='${city}'></g:select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="select04">Gender</label>
            <div class="controls">
              <g:select id="type" name='gender' value="${command.gender}"
									    noSelection="${['null':'Select One...']}"
									    from='${gender}'></g:select>
            </div>
          </div>	
		 	<div class="control-group">
			            <label class="control-label" for="input05">Date of Birth</label>
			            <div class="controls">
			              	<g:datePicker name='dob' bean="${command}"
					                         size='40' labelCodeDefault='dob' noSelection="['':'-Choose-']" value="${command.dob}"/>
					<!-- 						<g:datePicker name="myDate" value="${new Date()}"
											              noSelection="['':'-Choose-']"/> -->
			            </div>
			</div>
			
			
			<div class="control-group">
			<label class="control-label" for="input06">Range Salary</label>
				<div class="controls">
					<g:textField name='salary' labelCode='user.salary.label' bean="${command}"
						size='40' labelCodeDefault='salary' value="${command.salary}"/>
				</div>
			</div>
		  <div class="control-group">
            <label class="control-label" for="select05">Education</label>
            <div class="controls">
              <g:select id="type" name='education' value="${command.education}"
									    noSelection="${['null':'Select One...']}"
									    from='${education}'></g:select>
            </div>
          </div>
			<div class="control-group">
			            <label class="control-label" for="input07">Occupation</label>
			            <div class="controls">
			              	<g:textField name='occupation' labelCode='user.occupation.label' bean="${command}"
					                         size='40' labelCodeDefault='occupation' value="${command.occupation}"/>
			            </div>
			          </div>
		  <div class="control-group">
            <label class="control-label" for="select06">Martial Status</label>
            <div class="controls">
              <g:select id="type" name='martialStatus' value="${command.martialStatus}"
									    noSelection="${['null':'Select One...']}"
									    from='${martialStatus}'></g:select>
            </div>
          </div>
			<div class="control-group">
			            <label class="control-label" for="input08">Child</label>
			            <div class="controls">
			              	<g:textField name='childs' labelCode='user.childs.label' bean="${command}"
					                         size='40' labelCodeDefault='childs' value="${command.childs}"/>
			            </div>
			          </div>

          
          <div class="form-actions">
            <g:actionSubmit name="submit" type="submit" class="btn btn-primary" value="submit" action="registerRespondent"
			   controller="Register">Save changes</g:actionSubmit>
            <g:actionSubmit name="cancel" value="cancel" type="reset" class="btn">Cancel</g:actionSubmit>
          </div>
        </fieldset>
      </g:form>

	  </g:else>
	  <script>
	$(document).ready(function() {
		$('#username').focus();
	});
	</script>
    </div>
  </div>

</section>
  
  </div>

</body>
</html>
