<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.member.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
MemberService memSVC = new MemberService();
MemberVO memberVO = memSVC.getOneMember((Integer) (session.getAttribute("memID")));
%>
<%@include file="/frontend/frontendhead.jsp"%>

<html>
<head>
<title>�|����� - listOneMember.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 15px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�|����� - ListOneMember.jsp</h3>
				<h4>
					<a href="../index.jsp"><img src="images/back1.gif" width="100"
						height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�|���s��</th>
			<th>����</th>
			<th>�m�W</th>
			<th>�ϥΪ̦W��</th>
			<th>�K�X</th>
			<th>�ʧO</th>
			<th>�q��</th>
			<th>Email</th>
			<th>�a�}</th>
			<th>�ͤ�</th>
			<th>�ҩ�</th>
			<th>�H�W�O�I</th>
			<th>���A</th>
			<th>�ק�</th>

		</tr>
		<tr>
			<td><%=memberVO.getMemID()%></td>
			<td><%=memberVO.getGradeID()%></td>
			<td><%=memberVO.getMemName()%></td>
			<td><%=memberVO.getMemAccount()%></td>
			<td><%=memberVO.getMemPassWord()%></td>
			<td><%=memberVO.getMemGender()%></td>
			<td><%=memberVO.getMemPh()%></td>
			<td><%=memberVO.getMemEmail()%></td>
			<td><%=memberVO.getMemAddress()%></td>
			<td><%=memberVO.getMemBirthday()%></td>
			<td><%=memberVO.getMemCard()%></td>
			<td><%=memberVO.getMemStatus()%></td>
			<td>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/frontend/member/member.do"
					style="margin-bottom: 0px;">
					<input type="submit" value="�ק�"> <input type="hidden"
						name="memID" value="${memberVO.memID}"> <input
						type="hidden" name="action" value="getOne_For_Update">
				</FORM>
			</td>
		</tr>
	</table>

</body>
</html>
<%@include file="/frontend/frontendfoot.jsp"%>