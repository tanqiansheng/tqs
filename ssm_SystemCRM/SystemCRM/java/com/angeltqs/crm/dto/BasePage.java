package com.angeltqs.crm.dto;

import java.util.List;

public class BasePage<T> {
	 long total;
	 List<T> rows;

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "BasePage [total=" + total + ", rows=" + rows + "]";
	}

	public BasePage(long total, List<T> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public BasePage() {
		super();
	}
	

}
