<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accordion Example</title>
    <!-- ��Ʈ��Ʈ�� CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* ���ڵ�� ������ ��Ÿ�� */
        .accordion-content {
            max-height: 200px; /* �ִ� ���� ���� */
            overflow-y: auto; /* ������ ��ĥ ��� ��ũ�� ǥ�� */
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Accordion Example</h2>
    <div id="accordion">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Section 1
                    </button>
                </h5>
            </div>
        
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body accordion-content">
                    Content for Section 1
                </div>
            </div>
        </div>
        

    </div>
</div>

<!-- jQuery �� ��Ʈ��Ʈ�� JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
