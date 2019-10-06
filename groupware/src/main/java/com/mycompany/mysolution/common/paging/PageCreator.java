package com.mycompany.mysolution.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageCreator {
	
	private Page paging;
	
	private Integer displayBoardCount = 10;
	private final Integer displayPageNum = 10;		
	
	protected Integer totalCount;
	protected Integer pageNum = 1;
	protected Integer pageStart;
	protected Integer pageEnd;
	protected Integer pageRealEnd;
	
	protected boolean prev;
	protected boolean next;
	
	public PageCreator(Integer pageNum, Integer displayBoardCount, Integer totalCount) {
		
		this.pageNum = pageNum;
		this.displayBoardCount = displayBoardCount;
		this.totalCount = totalCount;
		this.pageEnd = (int)Math.ceil((pageNum / (double)displayPageNum)) * displayPageNum;
		this.pageStart = pageEnd - (displayPageNum - 1);
		this.pageRealEnd = (int)Math.ceil(this.totalCount / (double)this.displayBoardCount);
		this.prev = (pageStart == 1) ? false : true;
		this.next = (pageEnd >= pageRealEnd) ? false : true;
		this.pageEnd = (pageEnd >= pageRealEnd) ? pageRealEnd : pageEnd;
		
		return;
		
	}
	
public PageCreator(Integer pageNum, Integer pageTotalCount) {
		
		this.pageNum = pageNum;
		this.totalCount = pageTotalCount;
		this.pageEnd = (int)Math.ceil((pageNum / (double)displayPageNum)) * displayPageNum;
		this.pageStart = pageEnd - (displayPageNum - 1);
		this.pageRealEnd = (int)Math.ceil(this.totalCount / (double)this.displayBoardCount);
		this.prev = (pageStart == 1) ? false : true;
		this.next = (pageEnd >= pageRealEnd) ? false : true;
		this.pageEnd = (pageEnd >= pageRealEnd) ? pageRealEnd : pageEnd;
		
		return;
		
	}
	
}
