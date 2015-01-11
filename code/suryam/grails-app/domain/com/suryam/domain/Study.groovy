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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((displayName == null) ? 0 : displayName.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		/*if (this == obj)
			return true;*/
		if (getClass() != obj.getClass())
			return false;
		Study other = (Study) obj;
		if (displayName == null) {
			if (other.displayName != null)
				return false;
		} else if (!displayName.equals(other.displayName))
			return false;
		if (type != other.type)
			return false;
		return true;
	}
	
	
}
