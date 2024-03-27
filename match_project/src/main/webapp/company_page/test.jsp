<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자격증 선택</title>
    <style>
        /* 선택된 자격증 목록 스타일 */
        .selected-skills {
            margin-top: 10px;
        }
        .selected-skill {
            display: inline-block;
            background-color: #f0f0f0;
            padding: 5px 10px;
            border-radius: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
            cursor: pointer;
        }
        .selected-skill:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row align-items-center mb-30">
            <div class="col">
                <label for="skillInput" class="q1-label1">필수 스킬</label>
            </div>
            <div class="col">
                <input type="text" class="form-control q1-input1" id="skillInput" name="skillInput" oninput="searchSkills(this.value)">
                <div id="skillList" style="display: none;"></div> <!-- 검색된 자격증 목록을 보여주는 곳 -->
            </div>
        </div>
        <div class="selected-skills" id="selectedSkills">
            <!-- 선택된 자격증이 여기에 추가됨 -->
        </div>
    </div>

    <script>
        // 검색된 자격증 목록을 가져오는 함수 (Ajax로 서버와 통신하여 구현)
        function searchSkills(keyword) {
            // 여기에 Ajax 요청을 보내고, 검색된 자격증 목록을 가져와서 화면에 표시하는 로직을 작성
            // 이 예제에서는 간단히 하드코딩된 자격증 목록을 사용
            var skillList = [
                "자격증1", "자격증2", "자격증3", "자격증4", "자격증5" // 실제로는 서버에서 가져온 목록을 사용해야 함
            ];

            // 검색 결과를 화면에 표시
            var skillListContainer = document.getElementById("skillList");
            skillListContainer.innerHTML = ""; // 이전 검색 결과 지우기

            skillList.forEach(function(skill) {
                if (skill.toLowerCase().includes(keyword.toLowerCase())) {
                    var skillItem = document.createElement("div");
                    skillItem.textContent = skill;
                    skillItem.classList.add("skill-item");
                    skillItem.onclick = function() {
                        addSelectedSkill(skill);
                    };
                    skillListContainer.appendChild(skillItem);
                }
            });

            // 검색 결과를 보여주기
            skillListContainer.style.display = skillList.length > 0 ? "block" : "none";
        }

        // 선택된 자격증을 추가하는 함수
        function addSelectedSkill(skill) {
            var selectedSkillsContainer = document.getElementById("selectedSkills");
            var skillElement = document.createElement("div");
            skillElement.textContent = skill;
            skillElement.classList.add("selected-skill");
            skillElement.onclick = function() {
                this.remove(); // 자격증을 선택 취소하면 목록에서 제거
            };
            selectedSkillsContainer.appendChild(skillElement);
            document.getElementById("skillInput").value = ""; // 자격증을 선택하면 입력 필드 비우기
            document.getElementById("skillList").style.display = "none"; // 자격증 선택 후 검색 결과 숨기기
        }
    </script>
</body>
</html>
