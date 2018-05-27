package cn.edu.hzvtc.entities;

import java.util.List;

public class PageBean<T> {
	private int pageNo;
	private int pageSize;

	private int recordCount;
	private List<T> data;

	// 样式一
	private int firstPage;
	private int prePage;
	private int nextPage;
	private int lastPage;

	// 样式二
	private int startPage;
	private int endPage;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
		// 判断样式参数
		// 首页
		firstPage = 1;
		// 末页
		if (recordCount % pageSize == 0) {
			lastPage = (int) (recordCount / pageSize);
		} else {
			lastPage = (int) (recordCount / pageSize) + 1;
		}
		if (lastPage < pageNo)
			pageNo = lastPage;
		// 样式一
		// 上一页
		if (pageNo > 1) {
			prePage = pageNo - 1;
		} else {
			prePage = pageNo;
		}
		// 下一页
		if (pageNo < lastPage) {
			nextPage = pageNo + 1;
		} else {
			nextPage = lastPage;
		}

		startPage = pageNo;
		for (int i = 0; i < 4; i++) {
			if (startPage - 1 > 0)
				startPage = startPage - 1;
			else
				break;
		}
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
