package com.nyngw.dto;

import java.util.List;

public class DalListViewVO {

	private int boardTotalCount;
	private int currentPageNumber;
	private List<Diligence_And_LazinessVO> boardList;
	private int pageTotalCount;
	private int boardCountPerPage;
	private int firstRow;
	private int endRow;
	
	public DalListViewVO(List<Diligence_And_LazinessVO> boardList, int boardTotalCount,
			int currentPageNumber, int boardCountPerPage, int startRow,
			int endRow) {
		this.boardList = boardList;
		this.boardTotalCount = boardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.boardCountPerPage = boardCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (boardTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = boardTotalCount / boardCountPerPage;
			if (boardTotalCount % boardCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getBoardTotalCount() {
		return boardTotalCount;
	}

	public void setBoardTotalCount(int boardTotalCount) {
		this.boardTotalCount = boardTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Diligence_And_LazinessVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<Diligence_And_LazinessVO> boardList) {
		this.boardList = boardList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getBoardCountPerPage() {
		return boardCountPerPage;
	}

	public void setBoardCountPerPage(int boardCountPerPage) {
		this.boardCountPerPage = boardCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
}
