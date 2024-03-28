<%@page import="match.skillBean"%>
<%@page import="match.categoryMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="skill_category" class="match.skillBean"></jsp:useBean>

<%
    // categoryMgr 객체 생성
    categoryMgr mgr = new categoryMgr();
    // 스킬 이름 리스트 가져오기
    Vector<skillBean> skillList = mgr.skillList();

    // 스킬 이름을 저장할 배열 생성
    String[] data = new String[skillList.size()];
    for (int i = 0; i < skillList.size(); i++) {
        data[i] = skillList.get(i).getSkill_sname().toLowerCase();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 및 선택 기능</title>
    <style>
        /* 스타일 설정 */
        .search-container {
            margin-bottom: 20px;
        }
        .grey-box {
            background-color: lightgrey;
            padding: 10px;
            width: 200px; /* 상자 크기를 지정할 수 있게 함 */
            margin-top: 10px;
        }
        .selected-items {
            margin-top: 20px;
        }
        .selected-item {
            display: inline-block;
            background-color: lightblue;
            padding: 5px 20px;
            margin-right: 10px;
            margin-bottom: 10px;
        }
            /* 검색창 디자인 변경 */
    #searchField {
        border: 1px solid #cccccc;
        padding: 8px 10px;
        margin-bottom: 10px;
        width: 100%; /* 검색창의 너비를 조정 */
        border-radius: 4px; /* 둥근 모서리를 만듦 */
    }

    /* 회색 상자 디자인 변경 */
    .grey-box div {
        padding: 5px 10px;
        border-bottom: 1px solid #eeeeee;
        cursor: pointer;
    }
    .grey-box div:hover {
        background-color: #f0f0f0; /* 마우스를 올렸을 때의 배경 색상 */
    }

    /* 선택된 아이템 디자인 변경 */
    .selected-item {
        background-color: #e9e9e9;
        border: 1px solid #d9d9d9;
        border-radius: 4px; /* 둥근 모서리 */
        margin-right: 5px;
        margin-bottom: 5px;
        padding: 3px 7px;
        font-size: 0.9em;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .selected-item:hover {
        opacity: 0.7; /* 마우스를 올렸을 때 투명도 변경 */
    }
    </style>
</head>
<body>
    <div class="search-container">
        <input type="text" id="searchField" onkeyup="searchData()" placeholder="초성으로 검색">
        <span id="searchFieldValue"></span> <!-- 검색 필드 값 출력을 위한 영역 -->
    </div>
    
    <!-- 회색 상자에 스킬 데이터 출력 -->
    <div class="grey-box" id="greyBox" onclick="selectGreyBoxItem(event)"></div>
    
    <!-- 직접입력 버튼 -->
    <button onclick="addCustomItem()">직접입력</button> 

    <!-- 선택된 아이템 출력 -->
    <div class="selected-items" id="selectedItems"></div>

    <script>
    // 선택된 아이템을 저장하는 배열
    var selectedItemsArray = [];

    // 스킬 데이터
    var data = [
        <% 
            for (int i = 0; i < data.length; i++) {
                out.println("'" + data[i] + "'");
                if (i < data.length - 1) {
                    out.println(",");
                }
            }
        %>
    ];

    // 초기에는 회색 상자가 비어있음
    document.getElementById('greyBox').style.display = 'none';

    // 검색 함수
    function searchData() {
        var searchField = document.getElementById('searchField');
        var searchText = searchField.value.toLowerCase();

        // 검색창이 비어있을 때
        if (searchText === '') {
            document.getElementById('greyBox').style.display = 'none'; // 회색 상자 숨기기
            document.getElementById('searchFieldValue').textContent = ''; // 검색 필드 값 영역 초기화
            return;
        }

        document.getElementById('greyBox').style.display = 'block'; // 회색 상자 보이기

        var filteredData = data.filter(function(item) {
            return item.startsWith(searchText);
        });

        // 회색 상자에 데이터 출력
        var greyBox = document.getElementById('greyBox');
        greyBox.innerHTML = '';
        filteredData.forEach(function(item) {
            var div = document.createElement('div');
            div.textContent = item;
            greyBox.appendChild(div);
        });

        // 검색 필드 값 출력
        document.getElementById('searchFieldValue').textContent = searchText;
    }

    // 선택된 아이템을 배열에 추가하고 화면에 표시하는 함수
    function selectItem(item) {
        selectedItemsArray.push(item);
        renderSelectedItems();
    }

    // 선택된 항목을 취소하는 함수
    function deselectItem(item) {
        var index = selectedItemsArray.indexOf(item);
        if (index > -1) {
            selectedItemsArray.splice(index, 1);
            renderSelectedItems();
        }
    }

    // 회색 상자 안의 항목을 선택하는 함수
    function selectGreyBoxItem(event) {
        var clickedItem = event.target.textContent;
        if (!isSelected(clickedItem)) {
            selectItem(clickedItem);
        } else {
            deselectItem(clickedItem);
        }
    }

    // 직접입력 버튼 클릭 시 호출되는 함수
    function addCustomItem() {
        var searchFieldValue = document.getElementById('searchFieldValue').textContent;
        if (searchFieldValue) { // 검색 필드에 값이 있는 경우
            if (!selectedItemsArray.includes(searchFieldValue)) {
                selectItem(searchFieldValue); // 선택된 아이템 목록에 추가
            }
        }
    }

    function renderSelectedItems() {
        var selectedItemsDiv = document.getElementById('selectedItems');
        selectedItemsDiv.innerHTML = '';
        selectedItemsArray.forEach(function(item) {
            var div = document.createElement('div');
            var span = document.createElement('span');
            span.textContent = item;
            div.className = 'selected-item';
            
            var removeBtn = document.createElement('button');
            removeBtn.textContent = 'X';
            removeBtn.className = 'remove-btn';
            removeBtn.onclick = function() {
                deselectItem(item);
            };

            div.appendChild(span);
            div.appendChild(removeBtn);
            selectedItemsDiv.appendChild(div);
        });
    }


    // 선택된 아이템인지 확인하는 함수
    function isSelected(item) {
        return selectedItemsArray.includes(item);
    }
    </script>

</body>
</html>