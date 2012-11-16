package com.chicow.ticbox.data

import org.bson.types.ObjectId

class Surveyor {
	ObjectId id
	String company
	
    static constraints = {
		company blank: true
    }
}
