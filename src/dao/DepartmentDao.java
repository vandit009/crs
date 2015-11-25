package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import vo.DepartmentVo;

public class DepartmentDao {

	@SuppressWarnings("rawtypes")
	List ls = new ArrayList();

	public void insert(DepartmentVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(v);
		t.commit();
	}

	public List search() {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from DepartmentVo");
		ls = q.list();
		return ls;
	}

	public List edit(DepartmentVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from DepartmentVo where id=" + v.getId() + "");
		ls = q.list();

		return ls;
	}

	public void update(DepartmentVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		s1.update(v);
		t.commit();
	}

	public List loadpage() {
		// TODO Auto-generated method stub
		List l1 = new ArrayList();
		SessionFactory sessionFactory = new Configuration().configure()
				.buildSessionFactory();

		Session session = sessionFactory.openSession();
		Query qr = session.createQuery("from DepartmentVo");
		l1 = qr.list();
		return l1;

	}

	public boolean delete(DepartmentVo cv) {
		// TODO Auto-generated method stub
		try
		{
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session ss=sf.openSession();
		ss.delete(cv);
		Transaction t=ss.beginTransaction();
		t.commit();
		return true;
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			return false;
		}	
		
	}

	
}
