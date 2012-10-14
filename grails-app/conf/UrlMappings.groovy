class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
		"/home" (view: '/home')
		"/index-grails" (view: '/index_grails')
	}
}
