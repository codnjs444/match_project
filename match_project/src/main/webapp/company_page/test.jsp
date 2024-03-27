<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <style>
.input-container {
    position: relative;
    display: inline-block;
}

.input-container input {
    width: 200px;
    padding-right: 100px; /* 버튼의 너비만큼 입력 필드의 오른쪽 패딩을 추가 */
}

.input-container button {
    position: absolute;
    right: 0;
    top: 0;
    height: 100%; /* 입력 필드의 높이와 동일하게 조정 */
    margin-right: 10px; /* q1_1 아래 여백을 줄여 q1-box 위로 이동 */
}

</style>
<div class="input-container">
    <input type="text" id="postcode" placeholder="우편번호">
    <button onclick="execDaumPostcode()">우편번호 찾기</button>
</div>