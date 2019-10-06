package com.mycompany.mysolution.common.searching;

import com.mycompany.mysolution.common.paging.Page;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Search extends Page {
	
	private String keyword;
	private String condition;
	
	public Search() {
		this.keyword = "";
		this.condition = "";
	}
	
}
