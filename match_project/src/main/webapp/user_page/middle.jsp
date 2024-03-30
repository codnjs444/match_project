<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		.row-cols-4{
			padding-left: 65px;
		}
		.zero{
			flex: 2;
		}
		.first{
			flex: 10;
			padding-left: 0px;
			padding-right: 0px;
		}
		.second{
			flex: 3;
			padding-left: 100px;
		}
		.third{
			flex: 2;
		}
		.acc-btn {
			padding-left: 0px;
			padding-right: 0px;
		}
		.accordion-button {
			padding-left: 5px;
		}
		.accordion-button{
			font-size: 14px;
		}
		.fixed-div1 {
		    position: fixed; /* 고정 위치 */
		    top: 129px; /* 위에서 20px 거리 */
		    right: 220px; /* 오른쪽에서 20px 거리 */
		    width: 300px;
		    height: 80px;
		    border: 1px solid lightgrey;
		    display: flex;
            flex-direction: column;
            justify-content: space-between;
	  	}
		.fixed-div2 {
		    position: fixed; /* 고정 위치 */
		    top: 208px; /* 위에서 20px 거리 */
		    right: 220px; /* 오른쪽에서 20px 거리 */
		    width: 300px;
		    height: 160px;
		    border: 1px solid lightgrey;
	  	}
	  	.fixed-div2 button {
            width: calc(100% / 3); /* Equal width for 3 columns */
            height: calc(100% / 2); /* Equal height for 2 rows */
        }
        .circle{
        	margin-left: 5px;
        	margin-top: 5px;
        	width: 70px;
	        height: 70px;
	        border-radius: 50%; /* 반지름이 너비와 높이의 절반 */
	        border: 1px solid
        }
    </style>
</head>
<body>
	<div class="row row-cols-4">
		<div class="col zero">
		</div>
		<div class="col first">
		    <div class="accordion" id="accordionExample">
		        <div class="row row-cols-6">
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		                            직무
		                        </button>
		                    </h2>
		                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		                            근무지역
		                        </button>
		                    </h2>
		                    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		                            경력
		                        </button>
		                    </h2>
		                    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		                            학력
		                        </button>
		                    </h2>
		                    <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
		                            기업형태
		                        </button>
		                    </h2>
		                    <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
		                            고용형태
		                        </button>
		                    </h2>
		                    <div id="collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
		                            산업
		                        </button>
		                    </h2>
		                    <div id="collapseSeven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
		                            직급/직책/급여
		                        </button>
		                    </h2>
		                    <div id="collapseEight" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
		                            우대전공
		                        </button>
		                    </h2>
		                    <div id="collapseNine" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
		                            스킬
		                        </button>
		                    </h2>
		                    <div id="collapseTen" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
		                            자격증
		                        </button>
		                    </h2>
		                    <div id="collapseEleven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	    <!-- New button added here -->
	    <div class="col second">
		    <div class="row">
		        <div class="col">
		            <div class="fixed-div1">
		            	<div class="row">
		            		<div class="col">
		            			<div class="circle"></div>
		            		</div>
		            		<div class="col">
		            			<input type="text" disabled>
		            		</div>
		            		<div class="col">
		            			<button>
		            				asd
		            			</button>
		            		</div>
		            	</div>
		            </div>
		            <div class="fixed-div2">
		            	<div class="row">
		            		<div class="col">
				                <button class="btn btn-secondary">Button 1</button>
				                <button class="btn btn-secondary">Button 2</button>
				                <button class="btn btn-secondary">Button 3</button>
				            </div>
		            		<div class="col">
				                <button class="btn btn-secondary">Button 4</button>
				                <button class="btn btn-secondary">Button 5</button>
				                <button class="btn btn-secondary">Button 6</button>
			                </div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
	    <div class="col third">
	    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>