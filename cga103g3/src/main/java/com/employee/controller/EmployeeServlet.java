package com.employee.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.employee.model.*;
import com.member.model.MemberService;
import com.member.model.MemberVO;
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

public class EmployeeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();

		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("empID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/employee/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer empID = null;
				try {
					empID = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/employee/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				EmployeeService employeeSvc = new EmployeeService();
				EmployeeVO employeeVO = employeeSvc.getOneEmployee(empID);
				if (employeeVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/employee/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("employeeVO", employeeVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/employee/listOneEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer empID = Integer.valueOf(req.getParameter("empID"));
				
				/***************************2.�}�l�d�߸��****************************************/
				EmployeeService employeeSvc = new EmployeeService();
				EmployeeVO employeeVO = employeeSvc.getOneEmployee(empID);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("employeeVO", employeeVO);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/employee/update_employee_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer empID = Integer.valueOf(req.getParameter("empID").trim());
				
				String empName = req.getParameter("empName");
				String empNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (empName == null || empName.trim().length() == 0) {
					errorMsgs.add("���u�m�W: �ФŪť�");
				} else if(!empName.trim().matches(empNameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���u�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				String empPhone = req.getParameter("empPhone").trim();
				if (empPhone == null || empPhone.trim().length() == 0) {
					errorMsgs.add("¾��ФŪť�");
				}	
                
				
				byte[] empAvatar = req.getPart("empAvatar").getInputStream().readAllBytes();
				if(empAvatar.length==0) {
					empAvatar=null;
				}				
				String empAccount = req.getParameter("empAccount");
				String empAccountReg = "^[(a-zA-Z0-9_)]{2,13}$";
				if (empAccount == null || empAccount.trim().length() == 0) {
					errorMsgs.add("�ϥΪ̩m�W: �ФŪť�");
				} else if(!empAccount.trim().matches(empAccountReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���u�m�W: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��13����");
	            }

				
				
				String empPassWord = req.getParameter("empPassWord");
				String empPassWordReg = "^[(a-zA-Z0-9_)]{2,13}$";
				if (empPassWord == null || empPassWord.trim().length() == 0) {
					errorMsgs.add("�K�X: �ФŪť�");
				} else if(!empPassWord.trim().matches(empPassWordReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�K�X: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��13����");
	            }
				
				
				java.sql.Date empHireDate = null;
				try {
					empHireDate = java.sql.Date.valueOf(req.getParameter("empHireDate").trim());
				} catch (IllegalArgumentException e) {
					empHireDate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
				
				Integer empStatus=Integer.valueOf(req.getParameter("empStatus").trim());;
				
				
				EmployeeVO employeeVO = new EmployeeVO();
				employeeVO.setEmpID(empID);
				employeeVO.setEmpName(empName);
				employeeVO.setEmpPhone(empPhone);
				employeeVO.setEmpAvatar(empAvatar);
				employeeVO.setEmpAccount(empAccount);
				employeeVO.setEmpPassWord(empPassWord);
				employeeVO.setEmpHireDate(empHireDate);
				employeeVO.setEmpStatus(empStatus);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("employeeVO", employeeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/employee/update_employee_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				EmployeeService employeeSvc = new EmployeeService();
				employeeVO = employeeSvc.updateEmployee(empID, empName, empPhone, empAvatar, empAccount,empPassWord, empHireDate
						,empStatus);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("employeeVO", employeeVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/backend/employee/listOneEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);
		}

		
		
		
		
		
		
		
        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String empName = req.getParameter("empName");
				String empNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (empName == null || empName.trim().length() == 0) {
					errorMsgs.add("���u�m�W: �ФŪť�");
				} else if(!empName.trim().matches(empNameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���u�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				String empPhone = req.getParameter("empPhone").trim(); // �q��
				String empPhoneReg = "^[0-9]{10}$";
				if (empPhone == null || empPhone.trim().length() == 0) {
					errorMsgs.add("�q�ܽФŪť�");
				} else if (!empPhone.trim().matches(empPhoneReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�q��: �u��O�Ʀr");
				}
				
				byte[] empAvatar = req.getPart("empAvatar").getInputStream().readAllBytes();       //�Y�K
				if(empAvatar.length==0) {
					empAvatar=null;
				}				
                          

				String empAccount = req.getParameter("empAccount"); // �ϥΪ̦W��
				String empAccountReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (empAccount == null || empAccount.trim().length() == 0) {
					errorMsgs.add("�ϥΪ̦W��: �ФŪť�");
				} else if (!empAccount.trim().matches(empAccountReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�ϥΪ̦W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}
				
				String empPassWord = req.getParameter("empPassWord"); // �K�X
				String empPassWordReg = "^[(a-zA-Z0-9_)]{6,20}$";
				if (empPassWord == null || empPassWord.trim().length() == 0) {
					errorMsgs.add("�K�X: �ФŪť�");
				} else if (!empPassWord.trim().matches(empPassWordReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�K�X: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb6��20����");
				}

				java.sql.Date empHireDate = null; // �J�Ȥ�
				try {
					empHireDate = java.sql.Date.valueOf(req.getParameter("empHireDate").trim());
					System.out.println(empHireDate);
				} catch (IllegalArgumentException e) {
					empHireDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
				Integer empStatus = Integer.valueOf(req.getParameter("empStatus").trim());


				EmployeeVO employeeVO = new EmployeeVO();
				
				employeeVO.setEmpName(empName);
				employeeVO.setEmpPhone(empPhone);
				employeeVO.setEmpAvatar(empAvatar);
				employeeVO.setEmpAccount(empAccount);
				employeeVO.setEmpPassWord(empPassWord);
				employeeVO.setEmpHireDate(empHireDate);
				employeeVO.setEmpStatus(empStatus);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("employeeVO", employeeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/employee/addEmployee.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				EmployeeService empSvc = new EmployeeService();
				employeeVO = empSvc.addEmployee(empName,empPhone,empAvatar, empAccount, empPassWord,
						empHireDate,empStatus);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/backend/employee/listAllEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer empID = Integer.valueOf(req.getParameter("empID"));
				
				/***************************2.�}�l�R�����***************************************/
				EmployeeService employeeSvc = new EmployeeService();
				employeeSvc.deleteEmployee(empID);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/backend/employee/listAllEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
		}
	
	
		
		
		
		/**********************************�n�J***********************************************************************************/
		
		if ("employeeLogin".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();

//			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			
			
		    String empAccount = req.getParameter("empAccount");
		    String empPassWord = req.getParameter("empPassWord");

		    // �i�ˬd�ӱb�� , �K�X�O�_���ġj
			if (empAccount == null || (empAccount.trim()).length() == 0) {
				errorMsgs.add("�п�J�|���b��");
			}
			if (empPassWord == null || (empPassWord.trim()).length() == 0) {
				errorMsgs.add("�п�J�|���K�X");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/employee/employeeLogin.jsp");
				failureView.forward(req, res);
				return;//�{�����_
			}
			
			
			/***************************2.�}�l�d�߸��*****************************************/
			EmployeeService employeeSvc = new EmployeeService();
//			Mem_VO memVO = memSvc.getOneMem(mem_no);
		   EmployeeVO admin = employeeSvc.EmployeeLogin(empAccount, empPassWord);

			if (admin == null ) {
				errorMsgs.add("�b���αK�X��J���~");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/employee/employeeLogin.jsp");
				failureView.forward(req, res);
				
				return;//�{�����_
			}
			/*******************************************************************************************/
			EmployeeVO admin1 = employeeSvc.EmployeeFindempID(empAccount);
			req.setAttribute("employeeVO", admin); // ��Ʈw���X��empVO����,�s�Jreq

			
			
			
			/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
			session.setAttribute("empID", admin1.getEmpID());

			
			
			System.out.println(req.getSession().getAttribute("empID"));      //����Session

//			String location=(String)session.getAttribute("location");
//			res.sendRedirect(location);
			
			String url = "/backend/employee/listOneEmployee.jsp"; 
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
			successView.forward(req, res);

		}
		/**********************************************************************************************************************/

		

		
		/**********************************�n�X*******************************************************************************/
		
		if ("employeeLogout".equals(action)) {
			session.removeAttribute("admin");
			String url = "/backend/employee/employeeLogin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
			successView.forward(req, res);
		}

		
		/**********************************************************************************************************************/

		
		
		
		
		
		
		
	
	
	}
}
