package com.act.model;

import static common.Common.*;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

import com.actimg.model.ActImgJDBCDAO;
import com.actimg.model.ActImgVO;

public class ActJDBCDAO implements ActDAO_interface{

	private static final String INSERT_STMT = 
		"insert into activity (StoreID, ActTitle, ActDescription, ActTimeStart, ActTimeEnd, "
		+ "ActDate, RegisMax, ActFee, ActRegistration, ActStatus) "
		+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"select ActID, StoreID, ActTitle, ActDescription, ActTimeStart, ActTimeEnd, "
		+ "ActDate, RegisMax, ActFee, ActRegistration, ActStatus "
		+ "from activity order by ActDate desc";
	private static final String GET_ONE_STMT = 
		"select ActID, StoreID, ActTitle, ActDescription, ActTimeStart, ActTimeEnd, "
		+ "ActDate, RegisMax, ActFee, ActRegistration, ActStatus "
		+ "from activity where ActID = ?";
	private static final String UPDATE = 
		"update activity set StoreID=?, ActTitle=?, ActDescription=?, ActTimeStart=?, ActTimeEnd=?, "
		+ "ActDate=?, RegisMax=?, ActFee=?, ActRegistration=?, ActStatus=? where ActID = ?";
	private static final String UPDATE_STATE = "update activity set ActStatus=2 where ActID = ?";
	private static final String UPDATE_NUM = 
			"update activity a JOIN actregistered r ON a.ActID = r.ActID "
			+ "set a.ActRegistration=a.ActRegistration + r.ActNum where ActID = ?";
	private static final String GET_IMGS_BYACTID_STMT = "SELECT ActImgID, ActID, ActImgFile "
			+ "FROM actimg where ActID = ? order by ActImgID ";
	
	
	@Override
	public void insert(ActVO actVO) {
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
			PreparedStatement pstmt = con.prepareStatement(INSERT_STMT)) {
			Class.forName(driver);
			
			pstmt.setInt(1, actVO.getStoreID());
			pstmt.setString(2, actVO.getActTitle());
			pstmt.setString(3, actVO.getActDescription());
			pstmt.setObject(4, actVO.getActTimeStart());
			pstmt.setObject(5, actVO.getActTimeEnd());
			pstmt.setObject(6, actVO.getActDate());
			pstmt.setInt(7, actVO.getRegisMax());
			pstmt.setInt(8, actVO.getActFee());
			pstmt.setInt(9, actVO.getActRegistration());
			pstmt.setInt(10, actVO.getActStatus());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} 		
	}

	@Override
	public void update(ActVO actVO) {
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
			PreparedStatement pstmt = con.prepareStatement(UPDATE)) {
			Class.forName(driver);

			pstmt.setInt(1, actVO.getStoreID());
			pstmt.setString(2, actVO.getActTitle());
			pstmt.setString(3, actVO.getActDescription());
			pstmt.setObject(4, actVO.getActTimeStart());
			pstmt.setObject(5, actVO.getActTimeEnd());
			pstmt.setObject(6, actVO.getActDate());
			pstmt.setInt(7, actVO.getRegisMax());
			pstmt.setInt(8, actVO.getActFee());
			pstmt.setInt(9, actVO.getActRegistration());
			pstmt.setInt(10, actVO.getActStatus());
			pstmt.setInt(11, actVO.getActID());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}		
	}

	@Override
	public void changeState(Integer actID) {
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
			PreparedStatement pstmt = con.prepareStatement(UPDATE_STATE)) {
			Class.forName(driver);
			pstmt.setInt(1, actID);
			pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
		}	
	}
	
	@Override
	public void numPlus(Integer actID, Integer actRegistration) {
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(UPDATE_NUM)) {
			Class.forName(driver);
			pstmt.setInt(1, actID);
			pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}	
	}

	@Override
	public ActVO findByPrimaryKey(Integer actID) {
		ActVO actVO = null;
		ResultSet rs = null;

		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(GET_ONE_STMT);
				) {
				Class.forName(driver);

			pstmt.setInt(1, actID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// actVo ????????? Domain objects
				actVO = new ActVO();
				actVO.setActID(rs.getInt("actID"));
				actVO.setStoreID(rs.getInt("storeID"));
				actVO.setActTitle(rs.getString("actTitle"));
				actVO.setActDescription(rs.getString("actDescription"));
				actVO.setActTimeStart(rs.getObject("actTimeStart", LocalDateTime.class));
				actVO.setActTimeEnd(rs.getObject("actTimeEnd", LocalDateTime.class));
				actVO.setActDate(rs.getObject("actDate", LocalDateTime.class));
				actVO.setRegisMax(rs.getInt("regisMax"));				
				actVO.setActFee(rs.getInt("actFee"));
				actVO.setActRegistration(rs.getInt("actRegistration"));
				actVO.setActStatus(rs.getInt("actStatus"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		return actVO;
	}

	@Override
	public List<ActVO> getAll() {
		List<ActVO> list = new ArrayList<ActVO>();
		ActVO actVO = null;

		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(GET_ALL_STMT);
				) {
				Class.forName(driver);
				ResultSet rs = pstmt.executeQuery();
			

			while (rs.next()) {
				// actVO ????????? Domain objects
				actVO = new ActVO();
				actVO.setActID(rs.getInt("actID"));
				actVO.setStoreID(rs.getInt("storeID"));
				actVO.setActTitle(rs.getString("actTitle"));
				actVO.setActDescription(rs.getString("actDescription"));
				actVO.setActTimeStart(rs.getObject("actTimeStart", LocalDateTime.class));
				actVO.setActTimeEnd(rs.getObject("actTimeEnd", LocalDateTime.class));
				actVO.setActDate(rs.getObject("actDate", LocalDateTime.class));
				actVO.setRegisMax(rs.getInt("regisMax"));
				actVO.setActFee(rs.getInt("actFee"));
				actVO.setActRegistration(rs.getInt("actRegistration"));
				actVO.setActStatus(rs.getInt("actStatus"));
				list.add(actVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		return list;
	}
	
	@Override
	public Set<ActImgVO> getImgsByAct(Integer actID) {
		Set<ActImgVO> set = new HashSet<ActImgVO>();
		ActImgVO actImgVO = null;
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(GET_IMGS_BYACTID_STMT)) {
			Class.forName(driver);
			
			pstmt.setInt(1, actID);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				actImgVO = new ActImgVO();
				actImgVO.setActImgID(rs.getInt("actImgID"));
				actImgVO.setActID(rs.getInt("actID"));
				actImgVO.setActImgFile(rs.getBytes("actImgFile"));
				set.add(actImgVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}		
		return set;
	}

	@Override
	public void insertWithActImgs(ActVO actVO, List<ActImgVO> imglist) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			// ???auto commit??????
			con.setAutoCommit(false);
			
			// ????????????
			String cols[] = {"ActID"};
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, actVO.getStoreID());
			pstmt.setString(2, actVO.getActTitle());
			pstmt.setString(3, actVO.getActDescription());
			pstmt.setObject(4, actVO.getActTimeStart());
			pstmt.setObject(5, actVO.getActTimeEnd());
			pstmt.setObject(6, actVO.getActDate());
			pstmt.setInt(7, actVO.getRegisMax());
			pstmt.setInt(8, actVO.getActFee());
			pstmt.setInt(9, actVO.getActRegistration());
			pstmt.setInt(10, actVO.getActStatus());
			pstmt.executeUpdate();
			
			// ????????????????????????
			String nextActID = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				nextActID = rs.getString(1);
				System.out.println("???????????????= " + nextActID +"(??????????????????????????????)");
			} else {
				System.out.println("????????????????????????");
			}
			rs.close();
			
			// ???????????????
			ActImgJDBCDAO dao = new ActImgJDBCDAO();
			for (ActImgVO aActImg : imglist) {
				aActImg.setActID(new Integer(nextActID));
				dao.insertfromAct(aActImg, con);
			}
			
			// commit???????????????
			con.commit();
			con.setAutoCommit(true);	// ????????????????????????????????????AutoCommit??????????????????true???????????????????????????
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3??????????????????exception????????????catch?????????
					System.err.print("Transaction is being ");
					System.err.println("rolled back-???-act");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}		
	}

	public static void main(String[] args) {

		ActJDBCDAO dao = new ActJDBCDAO();

		// ??????
		ActVO actVO1 = new ActVO();
		actVO1.setStoreID(51001);
		actVO1.setActTitle("???????????????testtt");
		actVO1.setActDescription("??????????????????I.A.?????????????????????????????????????????????");
		actVO1.setActTimeStart(LocalDateTime.parse("2022-10-08 10:00:00"));
		actVO1.setActTimeEnd(LocalDateTime.parse("2022-10-20 21:00:00"));
		actVO1.setActDate(LocalDateTime.parse("2022-10-22 14:00:00"));
		actVO1.setRegisMax(6);
		actVO1.setActFee(100);
		actVO1.setActRegistration(0);
		actVO1.setActStatus(1);
		dao.insert(actVO1);

		// ??????
		ActVO actVO2 = new ActVO();
		actVO2.setStoreID(51001);
		actVO2.setActTitle("???????????????");
		actVO2.setActDescription("??????????????????I.A.??????????????????~~????????????????????????");
		actVO2.setActTimeStart(LocalDateTime.parse("2022-10-08 10:00:00"));
		actVO2.setActTimeEnd(LocalDateTime.parse("2022-10-20 21:00:00"));
		actVO2.setActDate(LocalDateTime.parse("2022-10-22 14:00:00"));
		actVO2.setRegisMax(6);
		actVO2.setActFee(100);
		actVO2.setActRegistration(0);
		actVO2.setActStatus(1);
		actVO2.setActID(61001);
		dao.update(actVO2);

		// ?????? Primary Key
		ActVO actVO3 = dao.findByPrimaryKey(61001);
		System.out.print(actVO3.getActID() + ", ");
		System.out.print(actVO3.getStoreID() + ", ");
		System.out.print(actVO3.getActTitle() + ", ");
		System.out.print(actVO3.getActDescription() + ", ");
		System.out.print(actVO3.getActTimeStart() + ", ");
		System.out.print(actVO3.getActTimeEnd() + ", ");
		System.out.print(actVO3.getActDate() + ", ");
		System.out.print(actVO3.getRegisMax() + ", ");
		System.out.print(actVO3.getActFee() + ", ");
		System.out.print(actVO3.getActRegistration() + ", ");
		System.out.println(actVO3.getActStatus());
		System.out.println("---------------------");

		// ??????
		List<ActVO> list = dao.getAll();
		for (ActVO aAct : list) {
			System.out.print(aAct.getActID() + ", ");
			System.out.print(aAct.getStoreID() + ", ");
			System.out.print(aAct.getActTitle() + ", ");
			System.out.print(aAct.getActDescription() + ", ");
			System.out.print(aAct.getActTimeStart() + ", ");
			System.out.print(aAct.getActTimeEnd() + ", ");
			System.out.print(aAct.getActDate() + ", ");
			System.out.print(aAct.getRegisMax() + ", ");
			System.out.print(aAct.getActFee() + ", ");
			System.out.print(aAct.getActRegistration() + ", ");
			System.out.print(aAct.getActStatus());
			System.out.println();
		}
	}
}
