<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Submitted Selection</title>
  <!-- ��Ʈ��Ʈ�� CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h4 id="selectedItem">���õ� ��: <%= request.getParameter("openposition_name") %></h4>
  <button class="btn btn-primary" onclick="history.back()">�ڷ� ����</button>
</div>

</body>
</html>
