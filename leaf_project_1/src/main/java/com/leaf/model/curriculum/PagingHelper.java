package com.leaf.model.curriculum;

public class PagingHelper {
	private int firstPage; // 첫번�? ?��?���? 번호
	 private int lastPage; // 마�?�? ?��?���? 번호
	 private int prevLink; // [?��?��] 링크 
	 private int nextLink; // [?��?��] 링크
	 private int startRecord; // 목록?�� 구할?�� ?��?��?�� ROWNUM ?��?��
	 private int endRecord; // 목록?�� 구할?�� ?��?��?�� ROWNUM ?��
	 private int listNo; // 목록?��?�� ?��?��?�� ?��?��??�? 붙여�??�� 번호
	 private int[] pageLinks; // 첫번�? ?��?���? 번호�??�� ?��?��?��?�� 1?�� 증�??��?�� 마�?�? ?��?���?번호까�? int[] 배열 

	 public PagingHelper(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {
	  /*
	   * �? ?��?���? ?�� = ?���? 게시�? / ?��?���??�� 게시�? ?�� 
	   *   OR  (?���? 게시�? / ?��?���??�� 게시�? ?��) + 1
	   */
	  int totalPage = ((totalRecord % numPerPage) == 0) ? 
	   totalRecord / numPerPage : totalRecord / numPerPage + 1;
	  /*
	   * ?�� 블럭 <-- 1 2 3 4 5 6 7 8 9 10 -->>
	   */ 
	  int totalBlock = ((totalPage % pagePerBlock) == 0) ? 
	   totalPage / pagePerBlock : totalPage / pagePerBlock + 1;
	  /*
	   * ?��?�� 블럭
	   */
	  int block = ((curPage % pagePerBlock) == 0) ? 
	   curPage / pagePerBlock : curPage / pagePerBlock + 1;
	  
	  this.firstPage = (block - 1) * pagePerBlock + 1;
	  this.lastPage = block * pagePerBlock;
	  if (block >= totalBlock) {
	   this.lastPage = totalPage;
	  }
	  pageLinks = makeArray(firstPage, lastPage);
	  
	  if (block > 1) {
	   this.prevLink = firstPage - 1;
	  }
	  if (block < totalBlock) {
	   this.nextLink = lastPage + 1;
	  }
	  this.listNo = totalRecord - (curPage - 1) * numPerPage;
	  this.startRecord = (curPage - 1) * numPerPage + 1;
	  this.endRecord = startRecord + numPerPage - 1;
	 }
	 
	 private int[] makeArray(int first, int last) {
	  int size = last - first + 1;
	  int[] ret = new int[size]; 
	  for (int i = 0; i < size; i++) {
	   ret[i] = first++;
	  }
	  
	  return ret;
	 }

	 public int getFirstPage() {
	  return firstPage;
	 }

	 public int getLastPage() {
	  return lastPage;
	 }

	 public int getPrevLink() {
	  return prevLink;
	 }

	 public int getNextLink() {
	  return nextLink;
	 }

	 public int getStartRecord() {
	  return startRecord;
	 }

	 public int getEndRecord() {
	  return endRecord;
	 }

	 public int getListNo() {
	  return listNo;
	 }

	 public int[] getPageLinks() {
	  return pageLinks;
	 }
	 
	}