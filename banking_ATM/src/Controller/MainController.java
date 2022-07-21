package Controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import Vo.transaction_bank;
import Vo.UserData;
import Dao.MainDao;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String flag = request.getParameter("flag");
		if(flag.equals("delete_user"))
		{
			delete_user(request, response);
		}
		if(flag.equals("edit_user"))
		{
			edit_user(request, response);
		}
		if(flag.equals("trans_history"))
		{
			trans_histroy(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String flag = request.getParameter("flag");
		if(flag.equals("insert_userdata"))
		{
			insert_userdata(request,response);
		}
		if(flag.equals("confirm_user"))
		{
			confirm_user(request,response);
		}
		if(flag.equals("update_userdata"))
		{
			update_userdata(request, response);
		}
		if(flag.equals("enter_money"))
		{
			Add_Remove_money(request, response);
		}
		
	
	}
	
	protected void insert_userdata(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username = request.getParameter("un");
		String password = request.getParameter("pw");
		String firstname = request.getParameter("fn");
		String lastname = request.getParameter("ln");
		String account_type = request.getParameter("acc_type");
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		String trans_type= request.getParameter("trans_type");
		
		UserData vo = new UserData();
		transaction_bank tra_vo = new transaction_bank();
		
		vo.setFirstname(firstname);
		vo.setLastname(lastname);
		vo.setAccount_type(account_type);
		vo.setUsername(username);
		vo.setPassword(password);
		
		tra_vo.setAmount(amount);
		tra_vo.setTransaction_type(trans_type);
		tra_vo.setCustom_id(vo);
		
		MainDao dao = new MainDao();
		dao.userData_Insert(vo);
		dao.transaction_enter(tra_vo);
		
		System.out.println("---------  exexute --------------");
		response.sendRedirect("index.jsp");
		
	}
	
	protected void confirm_user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int pin_no = Integer.parseInt(request.getParameter("id"));
		String username = (String)request.getParameter("user");
		String password = (String)request.getParameter("pass");
		
		UserData Vo = new UserData();
//		Vo.setRid(pin_no);
		Vo.setUsername(username);
		Vo.setPassword(password);
		
		MainDao dao = new MainDao();
		List<?> ls = (List<?>) dao.confirm_customer(Vo);
		
		System.out.println("confirm method successfull excuted");
		System.out.println(ls.size());
		
		if(ls.size()==0)
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			HttpSession hs = request.getSession();
			hs.setAttribute("list",ls);
			response.sendRedirect("Show_CustmerData.jsp");
		}
		
	}
	
	protected void delete_user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("delete user step:1");
		
		int id = Integer.parseInt(request.getParameter("rid"));
		UserData Vo = new UserData();
		MainDao dao = new MainDao();
		
		Vo.setRid(id);
		dao.userDelete(Vo);
		response.sendRedirect("index.jsp");
	}
	
	protected void edit_user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserData Vo = new UserData();
		MainDao dao = new MainDao();
		int id = Integer.parseInt(request.getParameter("rid"));
		
		Vo.setRid(id);
		List<?> ls = (List<?>)dao.edit_user(Vo);
		
		HttpSession hs = request.getSession();
		hs.setAttribute("list",ls);
		response.sendRedirect("edit_customer.jsp");
	
	}
	
	protected void update_userdata(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("rid"));
		String username = request.getParameter("un");
		String password = request.getParameter("pw");
		String firstname = request.getParameter("fn");
		String lastname = request.getParameter("ln");
		String account_type = request.getParameter("acc_type");
		
		UserData vo = new UserData();
		
		vo.setRid(id);
		vo.setFirstname(firstname);
		vo.setLastname(lastname);
		vo.setAccount_type(account_type);
		vo.setUsername(username);
		vo.setPassword(password);
		
		MainDao dao = new MainDao();
		dao.userData_update(vo);
		
		List<?> ls = (List<?>) dao.confirm_customer(vo);
		HttpSession hs = request.getSession();
		hs.setAttribute("list",ls);
		
		response.sendRedirect("Show_CustmerData.jsp"); // jioswhoids
		
	}
	
	protected void trans_histroy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("rid"));
		System.out.println("histrory rid is: "+id);
		
		transaction_bank tVo = new transaction_bank();
		UserData vo = new UserData();
		vo.setRid(id);
		tVo.setCustom_id(vo);
	
		MainDao dao = new MainDao();
		List<?> tran_ls = (List<?>) dao.trans_history(tVo,vo);
		System.out.println("transaction_histroy: "+tran_ls.size());
		
		HttpSession hs = request.getSession();
		hs.setAttribute("trans_ls", tran_ls);
		response.sendRedirect("Transaction_datails.jsp");
	
	}
	
	protected void Add_Remove_money(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int total_amount = Integer.parseInt(request.getParameter("total_amount"));
		int enter_amount = Integer.parseInt(request.getParameter("enter_amount"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String type_transaction = request.getParameter("select_type");
	
		UserData uVo = new UserData();
		transaction_bank tVo = new transaction_bank();
		MainDao dao = new MainDao(); 
		
		
		uVo.setRid(user_id);
		tVo.setTransaction_type(type_transaction);
		
		if(type_transaction.equals("credit"))
		{
			tVo.setAmount(enter_amount);
			tVo.setCustom_id(uVo);
			dao.Credit_or_Debit_money(tVo);
	//		HttpSession hs = request.getSession();
	//		hs.setAttribute("success_massage","Your Transaction is Successfull. Amount is credit..");
	//		response.sendRedirect("index.jsp");
		}
		else
		{
			if(total_amount - enter_amount < 0)
			{
				HttpSession hs = request.getSession();
				hs.setAttribute("error_massage","your Acoount balance is low..");
				response.sendRedirect("Transaction_datails.jsp");
			}
			else
			{
				enter_amount = (-1)*(enter_amount);
				tVo.setAmount(enter_amount);
				tVo.setCustom_id(uVo);
				dao.Credit_or_Debit_money(tVo);
	//			HttpSession hs = request.getSession();
//				hs.setAttribute("success_massage","Your Transaction is Successfull. Amount is debit..");
//				uVo.setRid(user_id);
//				List<?> ls = (List<?>) dao.confirm_customer(uVo);
//				HttpSession hs = request.getSession();
//				hs.setAttribute("list",ls);
	//			System.out.println("list size: "+ls.size()+" Custom id:" + uVo.getRid() );
//				response.sendRedirect("Show_CustmerData.jsp"); // jioswhoids
			}
		}
		List<?> ls = (List<?>) dao.give_user_data(uVo);
		HttpSession hs = request.getSession();
		hs.setAttribute("list",ls);
		
		response.sendRedirect("Show_CustmerData.jsp"); // jioswhoids
		
		
	}
}
