<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
	function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '200px'; 
			img.style.height = '300px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}
	</script>
<meta charset="UTF-8">
<title>도서 관리</title>
</head>
<body>
	<h2>도서 추가</h2>
	<form:form enctype="multipart/form-data" commandName="vo">
		<table border="1">
			<tr>
				<td rowspan="6">
					<div id='View_area' style='position:relative; width: 100%; height:100%; color: black; border: 0px solid black; dispaly: inline; '>
					</div>
				</td>
				<th>ISBN</th>
				<td><form:input path="isbn"/></td>
			</tr>
			<tr>
				<th>도서명</th>
				<td><form:input path="bookName"/></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><form:input path="writer"/></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><form:input path="publisher"/></td>
			</tr>
			<tr>
				<th>도서가격</th>
				<td><form:input path="price"/></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="uploadFile" id="uploadFile" onchange="previewImage(this,'View_area')"></td>
			</tr>
			<tr>
				<th width="200">책 소개</th>
				<td colspan="2"><textarea rows="14" cols="50" name="content">
				</textarea></td>
			</tr>
		</table>
		<input type="submit" value="도서정보 추가">
		<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="도서 목록">
	</form:form>
</body>
</html>