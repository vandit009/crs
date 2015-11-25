package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import vo.LoginVo;

public class LoginDao {
	public void insert(LoginVo v)
	{
		try
		{
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session =sessionFactory.openSession();
			
			Transaction tr = session.beginTransaction();
			
			session.save(v);
			
			tr.commit();
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List search(LoginVo v)
	{
		List l=null;
		try
		{
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session =sessionFactory.openSession();
			
			Transaction tr = session.beginTransaction();
			
			Query q= session.createQuery("from LoginVo where username='"+v.getUsername()+"'");
			l=q.list();
			
			
			tr.commit();
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return l;
	}
	
	@SuppressWarnings("rawtypes")
	public List searchCustom(LoginVo v)
	{
		List l=null;
		try
		{
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			
			Session session =sessionFactory.openSession();
			
			Transaction tr = session.beginTransaction();
			
			Query q= session.createQuery("from StudentRegistrationVo where s2='"+v.getId()+"'");
			l=q.list();
			
			
			tr.commit();
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return l;
	}

	public void update(LoginVo log) {
		// TODO Auto-generated method stub
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		s1.update(log);
		t.commit();
		
	}
	
}
