package com.chicow.ticbox.security

import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.springframework.transaction.interceptor.TransactionAspectSupport

import com.chicow.ticbox.data.Respondent

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {
	
	def respondent() {
			def copy = [:] + (flash.chainedParams ?: [:])
			copy.remove 'controller'
			copy.remove 'action'
			[
			command: new RegisterRespondentCommand(copy), country: ['Indonesia'], 
			province: ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Jogjakarta'],
			gender: ['Male', 'Female'],
			city: ['Jakarta', 'Bandung', 'Semarang', 'Jogjakarta', 'Surabaya'],
			education: ['SD', 'SMP', 'SMA', 'D3', 'S1', 'S2', 'S3'],
			martialStatus: ['Single', 'Married']
			]
		
	}
	
	// check send email & save
	def registerRespondent = { RegisterRespondentCommand command ->
		println "masuk "
		if (command.hasErrors()) {
			println "error mail"
			render view: 'respondent', model: [command: command, country: ['Indonesia'], 
			province: ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Jogjakarta'],
			gender: ['Male', 'Female'],
			city: ['Jakarta', 'Bandung', 'Semarang', 'Jogjakarta', 'Surabaya'],
			education: ['SD', 'SMP', 'SMA', 'D3', 'S1', 'S2', 'S3'],
			martialStatus: ['Single', 'Married']
			 ]
			return
		}

		String salt = saltSource instanceof NullSaltSource ? null : command.username

//		def user = lookupUserClass().newInstance(email: command.email, username: command.username,
//				accountLocked: true, enabled: true)

		def respondent = new Respondent(country: command.country,
										province:	command.province,
										city:		command.city,
										gender:		command.gender,
										dob:		command.dob,
										salary:		command.salary,
										education:	command.education,
										occupation:	command.occupation,
										martialStatus: command.martialStatus,
										childs:		command.childs)
		if(!respondent.validate()){
			respondent.errors.allErrors.each {
		        println it
		    }
			flash.error = "respondent error"
			flash.chainedParams = params
			render view: 'respondent', model: [command: command, country: ['Indonesia'], 
				province: ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Jogjakarta'],
				gender: ['Male', 'Female'],
				city: ['Jakarta', 'Bandung', 'Semarang', 'Jogjakarta', 'Surabaya'],
				education: ['SD', 'SMP', 'SMA', 'D3', 'S1', 'S2', 'S3'],
				martialStatus: ['Single', 'Married']
				 ]
			return
		}
		def user = new User(username: 	command.username,
							email: 	  	command.email,
							password: 	command.password,
							respondent:	respondent)
		if(!user.validate()){
			user.errors.allErrors.each {
		        println it
		    }
			flash.error = "respondent error"
			flash.chainedParams = params
			render view: 'respondent', model: [command: command, country: ['Indonesia'], 
					province: ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Jogjakarta'],
					gender: ['Male', 'Female'],
					city: ['Jakarta', 'Bandung', 'Semarang', 'Jogjakarta', 'Surabaya'],
					education: ['SD', 'SMP', 'SMA', 'D3', 'S1', 'S2', 'S3'],
					martialStatus: ['Single', 'Married']
					 ]
			return
		}
		
		String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName
		String passwordFieldName = SpringSecurityUtils.securityConfig.userLookup.passwordPropertyName

/*		String password = encodePassword(command.password, salt)*/
/*		user."$passwordFieldName" = password*/
			if (!respondent.save()) {
				println "error in save respondent"
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
				return
			}
			if (!user.save()) {
				println "error in save user"
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
				return
			}

			def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
			if (!registrationCode.save()) {
				println "error in save register code"
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
			}
				String url = generateLink('verifyRegistration', [t: registrationCode.token])

				def conf = SpringSecurityUtils.securityConfig
				def body = conf.ui.register.emailBody
				if (body.contains('$')) {
					body = evaluate(body, [user: user, url: url])
				}
				mailService.sendMail {
					to command.email
					from conf.ui.register.emailFrom
					subject conf.ui.register.emailSubject
					html body.toString()
				}
		
		
/*		RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
			if (registrationCode == null || registrationCode.hasErrors()) {
				// null means problem creating the user
				flash.error = message(code: 'spring.security.ui.register.miscError')
				flash.chainedParams = params
				println 
				render view: 'respondent', model: [command: command, country: ['Indonesia'], 
				province: ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Jogjakarta'],
				gender: ['Male', 'Female'],
				city: ['Jakarta', 'Bandung', 'Semarang', 'Jogjakarta', 'Surabaya'],
				education: ['SD', 'SMP', 'SMA', 'D3', 'S1', 'S2', 'S3'],
				martialStatus: ['Single', 'Married']
				 ]
				return
			}*/

	
		render view: 'respondent', model: [emailSent: true]
	}

}

class RegisterRespondentCommand {

	String username
	String email
	String password
	String password2
	String country
	String province
	String city
	String gender
	Date dob
	BigDecimal salary
	String education
	String occupation
	String martialStatus
	Integer childs

	def grailsApplication

	static constraints = {
		username blank: false, nullable: false, validator: { value, command ->
			if (value) {
				def User = command.grailsApplication.getDomainClass(
					SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
				if (User.findByUsername(value)) {
					return 'registerCommand.username.unique'
				}
			}
		}
		email blank: false, nullable: false, email: true
		password blank: false, nullable: false, validator: RegisterController.passwordValidator
		password2 validator: RegisterController.password2Validator
		
		country blank: false, nullable: false
		province blank: false, nullable: false
		city blank: false, nullable: false
		gender blank: false, nullable: false
		dob blank: false, nullable: false
		salary blank: false, nullable: false
		education blank: false, nullable: false
		martialStatus blank: false, nullable: false
		childs blank: false, nullable: false
		
	}
}
