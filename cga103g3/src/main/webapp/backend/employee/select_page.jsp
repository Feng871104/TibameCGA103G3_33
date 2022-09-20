<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/backend/bkhead.jsp"%>

<html>
<head>
<title> Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3> Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Employee: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllEmployee.jsp'>List</a> all Employees.  <br><br></li>
  
  

  <jsp:useBean id="employeeSvc" scope="page" class="com.employee.model.EmployeeService" />
   
  <li>
     <FORM METHOD="post" ACTION="employee.do" >
       <b>��ܷ|���s��:</b>
       <select size="1" name="empID">
         <c:forEach var="employeeVO" items="${employeeSvc.all}" > 
          <option value="${employeeVO.empID}">${employeeVO.empID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="employee.do" >
       <b>��ܩm�W:</b>
       <select size="1" name="empID">
         <c:forEach var="employeeVO" items="${employeeSvc.all}" > 
          <option value="${employeeVO.empID}">${employeeVO.empName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�|���޲z</h3>

<ul>
  <li><a href='addEmployee.jsp'>Add</a> a new employee.</li>
</ul>

</body>
</html>
<%@include file="/backend/bkhead.jsp"%>