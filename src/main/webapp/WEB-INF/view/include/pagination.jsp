<!-- 分页工具 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<ul class="pagination pagination-xs nomargin pagination-custom">
    <li class="">共${page.totalCount}条记录，</li>
    <li>当前第<input name="currentPage" value="${page.pageIndex }" onblur="currentPage(this.value)"
                   style="width:30px;text-align:center; vertical-align:middle" maxlength="3"/>/${page.totalPage }页&nbsp;&nbsp;
    </li>
    <li class="am-pagination-first"><a href="javascript:page(1);">第一页</a></li>
    <li class="am-pagination-prev"><a href="javascript:page(${page.pageIndex > 1? page.pageIndex - 1: 1});">上一页</a></li>
    <li class="am-pagination-next"><a
            href="javascript:page(${page.pageIndex < page.totalPage? page.pageIndex + 1: page.totalPage});">下一页</a></li>
    <li class="am-pagination-last"><a href="javascript:page(${page.totalPage});">最末页</a></li>
</ul>
<script type="text/javascript">
    //分页查询
    function page(n) {
        if (n == ${page.pageIndex }) {
            return;
        }
        $("form#searchForm input[name=pageIndex]").val(n);
        $("form#searchForm").submit();
    }

    function pageSize(n) {
        $("form#searchForm input[name=pageSize]").val(n);
        $("form#searchForm").submit();
    }

    function currentPage(n) {
        $("form#searchForm input[name=pageIndex]").val(n);
        $("form#searchForm").submit();
    }
</script>