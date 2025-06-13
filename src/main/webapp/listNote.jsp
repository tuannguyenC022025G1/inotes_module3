<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Các ghi chú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 50px; }
        .table th, .table td { vertical-align: middle; }
        .modal-backdrop {
            background-color: rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Các ghi chú</h2>
    <div class="mb-3">
        <form action="${pageContext.request.contextPath}/notes" method="get" class="d-flex">
            <input type="hidden" name="action" value="search">
            <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm..." value="${param.keyword}">
            <button type="submit" class="btn btn-primary">Tìm</button>
            <a href="${pageContext.request.contextPath}/notes?action=add" class="btn btn-success ms-2">Thêm mới</a>
        </form>
    </div>
    <c:if test="${not empty notes}">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tiêu đề</th>
                <th>Phân loại</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="note" items="${notes}" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>
                    <td>${note.title}</td>
                    <td>${note.type}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/notes?action=view&id=${note.id}" class="btn btn-sm btn-warning">Xem</a>
                        <a href="${pageContext.request.contextPath}/notes?action=edit&id=${note.id}" class="btn btn-sm btn-info">Sửa</a>
                        <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" data-note-id="${note.id}">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty notes}">
        <p class="text-center">Không có ghi chú nào.</p>
    </c:if>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xóa ghi chú này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <form id="deleteForm" action="${pageContext.request.contextPath}/notes" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" id="noteIdToDelete">
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var deleteModal = document.getElementById('deleteModal');
        deleteModal.addEventListener('show.bs.modal', function (event) {
            // Button that triggered the modal
            var button = event.relatedTarget;
            // Extract info from data-* attributes
            var noteId = button.getAttribute('data-note-id');
            // Update the modal's content
            document.getElementById('noteIdToDelete').value = noteId;
        });
    });
</script>
</body>
</html>