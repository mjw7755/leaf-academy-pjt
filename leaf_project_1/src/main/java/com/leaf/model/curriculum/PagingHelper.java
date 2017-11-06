package com.leaf.model.curriculum;

public class PagingHelper {
	private int firstPage; // ì²«ë²ˆì§? ?˜?´ì§? ë²ˆí˜¸
	 private int lastPage; // ë§ˆì?ë§? ?˜?´ì§? ë²ˆí˜¸
	 private int prevLink; // [?´? „] ë§í¬ 
	 private int nextLink; // [?‹¤?Œ] ë§í¬
	 private int startRecord; // ëª©ë¡?„ êµ¬í• ?•Œ ?“°?´?Š” ROWNUM ?‹œ?‘
	 private int endRecord; // ëª©ë¡?„ êµ¬í• ?•Œ ?“°?´?Š” ROWNUM ?
	 private int listNo; // ëª©ë¡?—?„œ ?œ„?—?„œ ?ˆœ?„œ??ë¡? ë¶™ì—¬ì§??Š” ë²ˆí˜¸
	 private int[] pageLinks; // ì²«ë²ˆì©? ?˜?´ì§? ë²ˆí˜¸ë¶??„° ?‹œ?‘?•˜?—¬ 1?”© ì¦ê??•˜?—¬ ë§ˆì?ë§? ?˜?´ì§?ë²ˆí˜¸ê¹Œì? int[] ë°°ì—´ 

	 public PagingHelper(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {
	  /*
	   * ì´? ?˜?´ì§? ?ˆ˜ = ? „ì²? ê²Œì‹œë¬? / ?˜?´ì§??‹¹ ê²Œì‹œë¬? ?ˆ˜ 
	   *   OR  (? „ì²? ê²Œì‹œë¬? / ?˜?´ì§??‹¹ ê²Œì‹œë¬? ?ˆ˜) + 1
	   */
	  int totalPage = ((totalRecord % numPerPage) == 0) ? 
	   totalRecord / numPerPage : totalRecord / numPerPage + 1;
	  /*
	   * ?•œ ë¸”ëŸ­ <-- 1 2 3 4 5 6 7 8 9 10 -->>
	   */ 
	  int totalBlock = ((totalPage % pagePerBlock) == 0) ? 
	   totalPage / pagePerBlock : totalPage / pagePerBlock + 1;
	  /*
	   * ?˜„?¬ ë¸”ëŸ­
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