<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm mới ghi chú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 600px; margin-top: 50px; }
        .form-control { margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Thêm mới ghi chú</h2>
    <form action="${pageContext.request.contextPath}/notes" method="post">
        <input type="hidden" name="action" value="add">
        <div class="form-group">
            <label>Tiêu đề</label>
            <input type="text" name="title" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Nội dung</label>
            <textarea name="content" class="form-control" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <label>Thể loại</label>
            <select name="typeId" class="form-control">
                <option value="1">Cá nhân</option>
                <option value="2">Công ty</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>