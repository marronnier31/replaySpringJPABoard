<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f4f7f6; font-family: 'Segoe UI', sans-serif; }
        .list-container { 
            max-width: 900px; margin: 60px auto; 
            background: white; border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            padding: 40px;
        }
        .table { margin-top: 20px; }
        .table thead { background-color: #f8f9fa; }
        .table th { border-top: none; color: #666; font-weight: 600; text-transform: uppercase; font-size: 0.85rem; }
        .btn-write { 
            background: #4a90e2; color: white; border: none;
            padding: 10px 25px; border-radius: 8px; font-weight: 600;
        }
        .btn-write:hover { background: #357abd; color: white; }
        .post-title { text-decoration: none; color: #333; font-weight: 500; }
        .post-title:hover { color: #4a90e2; }

        /* 검색 및 페이징 커스텀 스타일 */
        .search-area .input-group { background: white; border-radius: 10px; overflow: hidden; border: 1px solid #e0e0e0; }
        .search-area .form-control, .search-area .form-select { border: none; box-shadow: none; }
        .search-area .btn-search { background: white; border: none; color: #4a90e2; }
        .search-area .btn-search:hover { background: #f8f9fa; }
        
        .pagination .page-link { color: #666; border: none; margin: 0 3px; border-radius: 8px !important; }
        .pagination .page-item.active .page-link { background-color: #4a90e2; color: white; }
    </style>
</head>
<body>

<div class="list-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold m-0">게시판 목록</h3>
        <a href="/board/boardList" class="btn btn-write">전체게시판목록</a>
        <a href="/board/insertForm" class="btn btn-write">글쓰기</a>
    </div>

    <table class="table table-hover">
        <thead>
            <tr>
                <th class="text-center" style="width: 10%">번호</th>
                <th style="width: 50%">제목</th>
                <th style="width: 15%">작성자</th>
                <th class="text-center" style="width: 25%">작성일</th>
            </tr>
        </thead>
        <tbody>
            <%-- 요청하신 대로 boardList 변수명 유지 --%>
            <c:forEach var="boardList" items="${boardList}">
                <tr>
                    <td class="text-center text-muted">${boardList.no}</td>
                    <td>
                        <a href="/board/detail?no=${boardList.no}" class="post-title">
                            ${boardList.title}
                        </a>
                    </td>
                    <td>${boardList.writer}</td>
                    <td class="text-center text-muted">
                        <fmt:formatDate value="${boardList.regDate}" pattern="yyyy-MM-dd" />
                    </td>
                </tr>
            </c:forEach>
            
            <c:if test="${empty boardList}">
                <tr>
                    <td colspan="4" class="text-center py-5 text-muted">
                        등록된 게시글이 없습니다. 첫 번째 주인공이 되어보세요!
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

    <div class="search-area mt-5">
        <form action="/board/search" method="get" class="d-flex justify-content-center">
            <div class="input-group" style="max-width: 450px;">
                <select name="searchType" class="form-select" style="max-width: 100px;">
                    <option value="title" selected>제목</option>
                    <option value="writer">작성자</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="keyword" class="form-control" placeholder="어떤 글을 찾으시나요?">
                <button class="btn btn-search" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </button>
            </div>
        </form>
    </div>

    <nav class="mt-4">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">다음</a></li>
        </ul>
    </nav>
</div>

</body>
</html>