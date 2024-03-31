<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dropdown Menu</title>
  <!-- ��Ʈ��Ʈ�� CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown ��ư
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="max-width: 1000px;">
      <div class="row">
        <!-- ���� �޴� -->
        <div class="col-md-6 pr-0 border-right">
          <h6 class="dropdown-header">���� �޴�</h6>
          <div class="row">
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu1', event)">���� �޴� �׸� 1</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu2', event)">���� �޴� �׸� 2</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu3', event)">���� �޴� �׸� 3</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu4', event)">���� �޴� �׸� 4</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu5', event)">���� �޴� �׸� 5</a>
            </div>
          </div>
        </div>
        <!-- ���� �޴� -->
        <div class="col-md-6" id="right-menu">
          <h6 class="dropdown-header">���� �޴�</h6>
          <!-- ���� �޴��� ������ �̸� ���� -->
          <div id="menu1" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� A')">���� �޴� �׸� A</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� B')">���� �޴� �׸� B</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� C')">���� �޴� �׸� C</a>
          </div>
          <div id="menu2" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� D')">���� �޴� �׸� D</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� E')">���� �޴� �׸� E</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� F')">���� �޴� �׸� F</a>
          </div>
          <div id="menu3" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� G')">���� �޴� �׸� G</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� H')">���� �޴� �׸� H</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� I')">���� �޴� �׸� I</a>
          </div>
          <div id="menu4" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� J')">���� �޴� �׸� J</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� K')">���� �޴� �׸� K</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� L')">���� �޴� �׸� L</a>
          </div>
          <div id="menu5" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� M')">���� �޴� �׸� M</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� N')">���� �޴� �׸� N</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('���� �޴� �׸� O')">���� �޴� �׸� O</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ��Ʈ��Ʈ�� �ڹٽ�ũ��Ʈ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function changeRightMenu(menu, event) {
  event.stopPropagation(); // �̺�Ʈ ���� ����
  // ��� ���� �޴� �����
  document.querySelectorAll('#right-menu > div').forEach(function(div) {
    div.style.display = 'none';
  });
  // �ش� �޴� �����ֱ�
  document.getElementById(menu).style.display = 'block';
}

function selectRightMenuItem(menuItemText) {
  document.getElementById('dropdownMenuButton').textContent = menuItemText; // Dropdown ��ư �ؽ�Ʈ ����
  $('.dropdown-toggle').dropdown('toggle'); // ��Ӵٿ� �ݱ�
}
</script>

</body>
</html>