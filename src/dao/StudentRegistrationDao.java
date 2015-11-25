package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import vo.StudentRegistrationVo;

public class StudentRegistrationDao {
	List ls = new ArrayList();
	public void insert(StudentRegistrationVo v) {
		// TODO Auto-generated method stub
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(v);
		t.commit();
		
	}

	public List search(StudentRegistrationVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from StudentRegistrationVo where s2="+v.getS2().getId());
		ls = q.list();
	
		
		return ls;
	}

	public List edit(StudentRegistrationVo v1) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from StudentRegistrationVo where id=" + v1.getId() + "");
		ls = q.list();

		return ls;
	}

	public void update(StudentRegistrationVo v) {
		// TODO Auto-generated method stub
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		System.out.println("Id ="+v.getId());
		s1.update(v);
		t.commit();
		
	}

}
