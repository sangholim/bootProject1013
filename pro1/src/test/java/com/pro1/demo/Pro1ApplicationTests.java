package com.pro1.demo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Pro1ApplicationTests {

	@Test
	public void contextLoads() {
	    int maxPageCount = 81;
	    int divide = 15;
	    System.out.println(maxPageCount % divide);
	    /*
	    	maxPageCount = (maxPageCount % cafeManageForm.getShowDataListCount() == 0)
			? maxPageCount / cafeManageForm.getShowDataListCount()
			: maxPageCount / cafeManageForm.getShowDataListCount() + 1;
		*/

	}

}
