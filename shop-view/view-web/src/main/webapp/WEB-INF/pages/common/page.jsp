
<div class="jogger">
	<c:if test="${pager.currentPage>1 }">
		<a href="javascript:gotoPage('${formName }', ${pager.currentPage-1})">
			&lt;</a>
	</c:if>
	<c:if test="${pager.currentPage==1 }">
		<a href="#"> &lt;</a>
	</c:if>
	<a <c:if test="${pager.currentPage==1}"> class="current" </c:if>
		href="javascript:gotoPage('${formName}', '1');">1</a>&nbsp;
	<c:if test="${pager.totalPage!=1}">
		<c:choose>
			<c:when test="${pager.currentPage<=5}">
				<c:forEach var="i" begin="2" end="${pager.currentPage}">
					<a <c:if test="${pager.currentPage==i}"> class="current" </c:if>
						href="javascript:gotoPage('${formName }', ${i});">${i }</a>&nbsp;  
			            </c:forEach>
			</c:when>
			<c:otherwise>  
			            ...&nbsp;  
			            <c:forEach var="i" begin="${pager.currentPage-3}"
					end="${pager.currentPage}">
					<a <c:if test="${pager.currentPage==i}"> class="current" </c:if>
						href="javascript:gotoPage('${formName}', ${i});">${i }</a>&nbsp;  
			            </c:forEach>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when
				test="${pager.currentPage>=pager.totalPage-4   
			            || pager.totalPage-4<=0}">
				<c:forEach var="i" begin="${pager.currentPage+1}"
					end="${pager.totalPage}">
					<a <c:if test="${pager.currentPage==i}"> class="current" </c:if>
						href="javascript:gotoPage('${formName}', ${i});">${i }</a>&nbsp;  
			            </c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="${pager.currentPage+1}"
					end="${pager.currentPage+3}">
					<a <c:if test="${pager.currentPage==i}"> class="current" </c:if>
						href="javascript:gotoPage('${formName}', ${i});">${i }</a>&nbsp;  
			            </c:forEach>  
			            ...&nbsp;  
			            <a
					<c:if test="${pager.currentPage==pager.totalPage}"> class="current" </c:if>
					href="javascript:gotoPage('${formName }', ${pager.totalPage});">
					${pager.totalPage}</a>&nbsp;  
			        </c:otherwise>
		</c:choose>
	</c:if>
	<c:if test="${pager.currentPage < pager.totalPage}">
		<a href="javascript:gotoPage('${formName}', ${pager.currentPage+1})">&gt;</a>
	</c:if>
	<c:if test="${pager.currentPage >= pager.totalPage}">
		<a href="#">&gt;</a>
	</c:if>
</div>
