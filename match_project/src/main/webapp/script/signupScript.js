function redirectTo(page) {
	window.location.href = page;
}
// 연도 옵션 동적 생성
var yearDropdown = document.getElementById("year");
var currentYear = new Date().getFullYear();
for (var i = currentYear - 60; i <= currentYear; i++) {
    var option = document.createElement("option");
    option.text = i;
    option.value = i;
    yearDropdown.appendChild(option);
}
function updateDays() {
    var selectedYear = document.getElementById("year").value;
    var selectedMonth = document.getElementById("month").value;
    var daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
    var dayDropdown = document.getElementById("day");
    dayDropdown.innerHTML = ""; // 기존 옵션 제거
    for (var i = 1; i <= daysInMonth; i++) {
        var option = document.createElement("option");
        option.text = i;
        option.value = i;
        dayDropdown.appendChild(option);
    }
}
// 월과 연도 선택시 일 옵션 업데이트
document.getElementById("year").addEventListener("change", updateDays);
document.getElementById("month").addEventListener("change", updateDays);

// 페이지 로드시 초기 일 옵션 설정
updateDays();

document.addEventListener('DOMContentLoaded',function() {
	var keepCheckbox = document.querySelector('.keep input[type="checkbox"]');
	var smallCheckboxes = document.querySelectorAll('.keep-small1 input[type="checkbox"], .keep-small2 input[type="checkbox"]');
	function updateKeepCheckbox() {
		// 작은 체크박스들 중 하나라도 체크가 해제되었는지 확인합니다.
		var anyUnchecked = Array.from(smallCheckboxes).some(function(checkbox) {
			return !checkbox.checked;
		});

		// 작은 체크박스들 중 하나라도 체크가 해제되었다면 keep도 체크를 해제합니다.
		keepCheckbox.checked = !anyUnchecked;
	}

	keepCheckbox.addEventListener('click', function() {
		var isChecked = this.checked;
		smallCheckboxes.forEach(function(smallCheckbox) {
			smallCheckbox.checked = isChecked;
		});
	});

	smallCheckboxes.forEach(function(smallCheckbox) {
		smallCheckbox.addEventListener('click',
				updateKeepCheckbox);
	});
});
document.addEventListener('DOMContentLoaded',function() {
	var keepCheckbox = document.querySelector('.keep2 input[type="checkbox"]');
	var smallCheckboxes = document.querySelectorAll('.keep-small3 input[type="checkbox"], .keep-small4 input[type="checkbox"]');
	function updateKeepCheckbox() {
		// 작은 체크박스들 중 하나라도 체크가 해제되었는지 확인합니다.
		var anyUnchecked = Array.from(smallCheckboxes).some(function(checkbox) {
			return !checkbox.checked;
		});

		// 작은 체크박스들 중 하나라도 체크가 해제되었다면 keep도 체크를 해제합니다.
		keepCheckbox.checked = !anyUnchecked;
	}

	keepCheckbox.addEventListener('click', function() {
		var isChecked = this.checked;
		smallCheckboxes.forEach(function(smallCheckbox) {
			smallCheckbox.checked = isChecked;
		});
	});

	smallCheckboxes.forEach(function(smallCheckbox) {
		smallCheckbox.addEventListener('click',
				updateKeepCheckbox);
	});
});

document.addEventListener('DOMContentLoaded', function() {
	var navTabs = document.querySelectorAll('.nav-tabs .nav-link');
	navTabs.forEach(function(tab) {tab.addEventListener('click', function() {
		var selectedTab = this.getAttribute('data-bs-target');
		var allTabs = document.querySelectorAll('.nav-tabs .nav-link');
			allTabs.forEach(function(tab) {
				var tabId = tab.getAttribute('data-bs-target');
				if (tabId === selectedTab) {
					tab.parentElement.classList.remove('col-4');
					tab.parentElement.classList.add('col-8');
				} else {
					tab.parentElement.classList.remove('col-8');
					tab.parentElement.classList.add('col-4');
				}
			});
		});
	});
});

function execDaumPostcode(userType) {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if (userType === 'user') {
                document.getElementById('user_postcode').value = data.zonecode;
                document.getElementById("user_address").value = addr;
            } else if (userType === 'company') {
                document.getElementById('company_postcode').value = data.zonecode;
                document.getElementById("company_address").value = addr;
            }

            if (userType === 'user') {
                document.getElementById("user_detailaddress").focus();
            } else if (userType === 'company') {
                document.getElementById("company_detailaddress").focus();
            }
        }
    }).open();
}
function inputCheck(userType){
	if(userType === 'user'){
		if(document.userRegFrm.user_name.value==""){
			alert("이름을 입력해주세요.");
			document.userRegFrm.user_name.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_id.value==""){
			alert("아이디를 입력해주세요.");
			document.userRegFrm.user_id.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_pwd.value==""){
			alert("비밀번호를 입력해주세요.");
			document.userRegFrm.user_pwd.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_repwd.value==""){
			alert("비밀번호 확인을 입력해주세요.");
			document.userRegFrm.user_repwd.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_pwd.value != document.userRegFrm.user_repwd.value){
			alert("비밀번호가 틀렸습니다.");
			document.userRegFrm.user_pwd.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_email.value==""){
			alert("이메일을 입력해주세요.");
			document.userRegFrm.user_email.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_phonenum.value==""){
			alert("휴대폰 번호를 입력해주세요.");
			document.userRegFrm.user_phonenum.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_postcode.value==""){
			alert("우편번호를 입력해주세요.");
			document.userRegFrm.user_postcode.focus();
			event.preventDefault();
			return;
		}
		else if(document.userRegFrm.user_address.value==""){
			alert("주소를 입력해주세요.");
			document.userRegFrm.user_address.focus();
			event.preventDefault();
			return;
		}
		document.userRegFrm.submit();
	}
	else if(userType === 'manager'){
		if(document.managerRegFrm.company_rnum.value==""){
			alert("사업자 등록 번호를 입력해주세요.");
			document.managerRegFrm.company_rnum.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.company_name.value==""){
			alert("기업 명을 입력해주세요.");
			document.managerRegFrm.company_name.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.company_head.value==""){
			alert("대표 명을 입력해주세요.");
			document.managerRegFrm.company_head.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_name.value==""){
			alert("가입자 명을 입력해주세요.");
			document.managerRegFrm.manager_name.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_id.value==""){
			alert("아이디를 입력해주세요.");
			document.managerRegFrm.manager_id.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_pwd.value==""){
			alert("비밀번호를 입력해주세요.");
			document.managerRegFrm.manager_pwd.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_repwd.value==""){
			alert("비밀번호 확인을 입력해주세요.");
			document.managerRegFrm.manager_repwd.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_pwd.value != document.managerRegFrm.manager_repwd.value){
			alert("비밀번호가 틀렸습니다.");
			document.managerRegFrm.manager_pwd.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_email.value==""){
			alert("이메일을 입력해주세요.");
			document.managerRegFrm.manager_email.focus();
			event.preventDefault();
			return;
		}
		else if(document.managerRegFrm.manager_phonenum.value==""){
			alert("휴대폰 번호를 입력해주세요.");
			document.managerRegFrm.manager_phonenum.focus();
			event.preventDefault();
			return;
		}
		document.managerRegFrm.submit();
	}
}

document.addEventListener("DOMContentLoaded", function() {
    // "가입하기" 버튼을 가져옵니다.
    var joinButton = document.querySelector(".user-button");

    // "가입하기" 버튼 클릭 이벤트에 대한 핸들러 함수를 정의합니다.
    joinButton.addEventListener("click", function(event) {
        // "user-keep1" 체크박스 요소들을 가져옵니다.
        var checkboxes = document.querySelectorAll("#user-keep1");

        // 모든 체크박스가 체크되어 있는지 확인합니다.
        var allChecked = true;
        checkboxes.forEach(function(checkbox) {
            if (!checkbox.checked) {
                allChecked = false;
            }
        });

        // 모든 체크박스가 체크되어 있지 않으면 submit을 막고 알림을 표시합니다.
        if (!allChecked) {
            event.preventDefault();
            alert("가입하기를 진행하려면 모든 약관에 동의해주세요.");
        }
    });
});

document.addEventListener("DOMContentLoaded", function() {
    // "가입하기" 버튼을 가져옵니다.
    var joinButton = document.querySelector(".manager-button");

    // "가입하기" 버튼 클릭 이벤트에 대한 핸들러 함수를 정의합니다.
    joinButton.addEventListener("click", function(event) {
        // "user-keep1" 체크박스 요소들을 가져옵니다.
        var checkboxes = document.querySelectorAll("#manager-keep1");

        // 모든 체크박스가 체크되어 있는지 확인합니다.
        var allChecked = true;
        checkboxes.forEach(function(checkbox) {
            if (!checkbox.checked) {
                allChecked = false;
            }
        });

        // 모든 체크박스가 체크되어 있지 않으면 submit을 막고 알림을 표시합니다.
        if (!allChecked) {
            event.preventDefault();
            alert("가입하기를 진행하려면 모든 약관에 동의해주세요.");
        }
    });
});