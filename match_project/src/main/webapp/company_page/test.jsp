<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>��¥�� �ð� �Է� ��</title>
  <!-- ��Ʈ��Ʈ�� CSS �߰� -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
  <h2>��¥�� �ð� �Է�</h2>
  <form id="datetimeForm" class="mt-3">
    <!-- ���� ��¥�� �ð��� ���ÿ� �Է� �޴� �ʵ� -->
    <div class="form-group">
      <label for="startDateTime">���� ��¥�� �ð�:</label>
      <input type="datetime-local" id="startDateTime" name="startDateTime" class="form-control">
    </div>
  
    <button type="button" class="btn btn-primary" onclick="submitDateTime()">����</button>
  </form>
</div>

<script>
  function submitDateTime() {
    var startDateTime = document.getElementById('startDateTime').value;
  
    alert("������ ��¥�� �ð�: " + startDateTime);
  }
</script>

<!-- ��Ʈ��Ʈ�� JS �߰� -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
