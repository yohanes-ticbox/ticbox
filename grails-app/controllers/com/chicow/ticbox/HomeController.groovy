package com.chicow.ticbox

class HomeController {

    def index() { }

	def respondentRegister(){
		redirect(controller:"register",action:"respondent")
	}
}
