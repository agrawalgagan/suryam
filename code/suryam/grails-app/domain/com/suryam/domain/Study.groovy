package com.suryam.domain

class Study {
    String name
    StudyType type
    Float cost
    Study parent
    static constraints = {
        cost nullable: true
        parent nullable: true
        name unique: ["parent","type"]
    }

    static List<Study> getRootStudies(){
        Study.createCriteria().listDistinct {
            isNull("parent")
        }
    }

    List<Study> getChildStudies(){
        return Study.findAllByParent(this, [sort : "name"])
    }
	
	String getDisplayName(){
		String n = parent ? parent.displayName+"->" : ""
		return n+name
	}
}
