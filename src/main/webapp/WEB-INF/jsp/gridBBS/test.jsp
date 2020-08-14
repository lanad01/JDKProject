<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 50%; /* Could be more or less, depending on screen size */
}
</style>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
$("#modal").show();
});
function closeModal() {
$('.searchModal').hide();
};
</script>
<body>
<h2>Search Results

</h2>
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h1>MODAL</h1>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<h2>Modal창 테스트입니다.</h2>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
				</span>
			</div>
		</div>
	</div>

</body>
</html>