package com.chicow.ticbox.engine

import org.bson.types.ObjectId

class Survey {
	ObjectId id
	String name
	String header
	String footer
	String uuid
	
    static constraints = {
    }
}
