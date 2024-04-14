<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic Dropdown with Bootstrap</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown button
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <form class="px-4 py-3">
      <div class="form-group">
        <label for="newItemText">New item</label>
        <input type="text" class="form-control" id="newItemText" placeholder="Enter new item">
      </div>
      <button type="button" class="btn btn-primary" onclick="addDropdownItem()">Add item</button>
    </form>
    <div id="dropdownItemList">
      <!-- New items will be added here -->
    </div>
  </div>
</div>

<script type="text/javascript">
function addDropdownItem() {
    var newItemText = document.getElementById("newItemText").value;
    if (newItemText.trim() !== "") {
        var newItem = document.createElement("a");
        newItem.classList.add("dropdown-item");
        newItem.href = "#";
        newItem.textContent = newItemText;

        // Create delete button
        var deleteBtn = document.createElement("button");
        deleteBtn.textContent = "X";
        deleteBtn.className = "btn btn-danger btn-sm";
        deleteBtn.onclick = function() {
            this.parentElement.remove(); // Removes the dropdown item
        };

        newItem.appendChild(deleteBtn);
        document.getElementById("dropdownItemList").appendChild(newItem);
        document.getElementById("newItemText").value = "";  // Clear input field after adding
    } else {
        alert("Please enter some text!");
    }
}
</script>
</body>
</html>


