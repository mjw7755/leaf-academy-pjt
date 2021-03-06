package com.leaf.model.curriculum;

public class PagingHelper {
	private int firstPage; // μ²«λ²μ§? ??΄μ§? λ²νΈ
	 private int lastPage; // λ§μ?λ§? ??΄μ§? λ²νΈ
	 private int prevLink; // [?΄? ] λ§ν¬ 
	 private int nextLink; // [?€?] λ§ν¬
	 private int startRecord; // λͺ©λ‘? κ΅¬ν ? ?°?΄? ROWNUM ??
	 private int endRecord; // λͺ©λ‘? κ΅¬ν ? ?°?΄? ROWNUM ?
	 private int listNo; // λͺ©λ‘?? ??? ????λ‘? λΆμ¬μ§?? λ²νΈ
	 private int[] pageLinks; // μ²«λ²μ©? ??΄μ§? λ²νΈλΆ??° ????¬ 1?© μ¦κ???¬ λ§μ?λ§? ??΄μ§?λ²νΈκΉμ? int[] λ°°μ΄ 

	 public PagingHelper(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {
	  /*
	   * μ΄? ??΄μ§? ? = ? μ²? κ²μλ¬? / ??΄μ§??Ή κ²μλ¬? ? 
	   *   OR  (? μ²? κ²μλ¬? / ??΄μ§??Ή κ²μλ¬? ?) + 1
	   */
	  int totalPage = ((totalRecord % numPerPage) == 0) ? 
	   totalRecord / numPerPage : totalRecord / numPerPage + 1;
	  /*
	   * ? λΈλ­ <-- 1 2 3 4 5 6 7 8 9 10 -->>
	   */ 
	  int totalBlock = ((totalPage % pagePerBlock) == 0) ? 
	   totalPage / pagePerBlock : totalPage / pagePerBlock + 1;
	  /*
	   * ??¬ λΈλ­
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