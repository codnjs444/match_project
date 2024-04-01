<!DOCTYPE html>
<html>
<head>
    <title>Dropdown Menu with Search</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<h2>Dropdown Menu with Search</h2>
<div class="dropdown">
    <button onclick="toggleDropdown()" class="btn btn-secondary dropdown-toggle" type="button">Dropdown</button>
    <div id="myDropdown" class="dropdown-menu">
        <input type="text" placeholder="Search.." id="myInput" class="form-control" onkeyup="filterFunction()">
        <a class="dropdown-item" href="#about">About</a>
        <a class="dropdown-item" href="#base">Base</a>
        <a class="dropdown-item" href="#blog">Blog</a>
        <a class="dropdown-item" href="#contact">Contact</a>
        <a class="dropdown-item" href="#custom">Custom</a>
        <a class="dropdown-item" href="#support">Support</a>
        <a class="dropdown-item" href="#tools">Tools</a>
    </div>
</div>

<script>
    function toggleDropdown() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    function filterFunction() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        div = document.getElementById("myDropdown");
        a = div.getElementsByTagName("a");
        for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                a[i].style.display = "";
            } else {
                a[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>
