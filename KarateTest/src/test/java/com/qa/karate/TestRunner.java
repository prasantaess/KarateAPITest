package com.qa.karate;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	Karate KarateTestAPI() {
		
		return Karate.run("PostGetPutDel.feature").relativeTo(getClass());
		
		
		
	}

}
