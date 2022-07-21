package Dao;

import java.util.ArrayList;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Vo.UserData;
import Vo.transaction_bank;




public class MainDao {
	
	public void userData_Insert(UserData userdata)
	{
		try{
			
			//System.out.println("user_insert");
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session = sessionFactory.openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.save(userdata);
			
			transaction.commit();
			
			session.close();
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<?> confirm_customer(UserData userdata)
	{
		List<?> ls=new ArrayList<>();
		try
			{
				System.out.println("edit dao"+userdata.getUsername());
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
				
				Session session = sessionFactory.openSession();
				
				Transaction transaction=session.beginTransaction();
				
				Query q = session.createQuery("from UserData where username='"+userdata.getUsername()+"'and password='"+userdata.getPassword()+"'");
										
				ls = q.list();
				
				transaction.commit();
				
				session.close();
				
				}
		catch(Exception ex)
			{
				ex.printStackTrace();
			}
		return ls;
	}
	
	public List<?> give_user_data(UserData userdata)
	{
		List<?> ls=new ArrayList<>();
		try
			{
//				System.out.println("edit dao"+userdata.getUsername());
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
				
				Session session = sessionFactory.openSession();
				
				Transaction transaction=session.beginTransaction();
				
				Query q = session.createQuery("from UserData where rid='"+userdata.getRid()+"' ");
										
				ls = q.list();
				
				transaction.commit();
				
				session.close();
				
				}
		catch(Exception ex)
			{
				ex.printStackTrace();
			}
		return ls;
	}
	
	public void userDelete(UserData userdata)
	{
		try{
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session = sessionFactory.openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.delete(userdata);
			
			System.out.println("delete your one user....");
			
			transaction.commit();
			
			session.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<?> edit_user(UserData userdata)
	{
		List<?> ls=new ArrayList<>();
		try
			{
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
				
				Session session = sessionFactory.openSession();
				
				Transaction transaction=session.beginTransaction();
				
				Query q = session.createQuery("from UserData where rid="+userdata.getRid());
										
				ls = q.list();
				
				transaction.commit();
				
				session.close();
				
			}
		catch(Exception ex)
			{
				ex.printStackTrace();
			}
		return ls;
	}
	
	public void userData_update(UserData userdata)
	{
		try{
			
			System.out.println("user_insert");
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session = sessionFactory.openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.update(userdata);
			
			transaction.commit();
			
			session.close();
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void transaction_enter(transaction_bank trans)
	{
		try{
			
			System.out.println("user_insert");
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session = sessionFactory.openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.save(trans);
			
			transaction.commit();
			
			session.close();
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<?> trans_history(transaction_bank trans_vo,UserData vo)
	{
		List<?> tran_ls=new ArrayList<>();
		try
			{
				System.out.println("transaction histroy page..");
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
				
				Session session = sessionFactory.openSession();
				
				Transaction transaction=session.beginTransaction();
				
				Query q = session.createQuery("from transaction_bank where rid ="+vo.getRid());
										
				tran_ls = q.list();
				
				transaction.commit();
				
				session.close();
				
				}
		catch(Exception ex)
			{
				ex.printStackTrace();
			}
		return tran_ls;
	}
	
	public void Credit_or_Debit_money(transaction_bank trans)
	{
		try{
			
			System.out.println("money is enter successfully..");
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session = sessionFactory.openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.save(trans);
			
			transaction.commit();
			
			session.close();
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
}
