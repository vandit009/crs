package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import vo.CourseVo;
import vo.ScheduleVo;

public class ScheduleDao {
	List ls = new ArrayList();

	public void insert(ScheduleVo v) {
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
		Query q = s1.createQuery("from ScheduleVo");
		ls = q.list();

		return ls;
	}

	public List edit(ScheduleVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from ScheduleVo where id=" + v.getId()
				+ "");
		ls = q.list();

		return ls;
	}

	public void update(ScheduleVo v) {
		try {
			SessionFactory s = new Configuration().configure()
					.buildSessionFactory();
			Session s1 = s.openSession();
			Transaction t = s1.beginTransaction();
			s1.update(v);
			t.commit();
		} catch (Exception z) {

		}
	}

	public List loadpage() {
		// TODO Auto-generated method stub
		List l1 = new ArrayList();
		SessionFactory sessionFactory = new Configuration().configure()
				.buildSessionFactory();

		Session session = sessionFactory.openSession();
		Query qr = session.createQuery("from ScheduleVo");
		l1 = qr.list();
		return l1;

	}

	

	public boolean delete(ScheduleVo cv) {
		// TODO Auto-generated method stub
		try {
			SessionFactory sf = new Configuration().configure()
					.buildSessionFactory();
			Session ss = sf.openSession();
			ss.delete(cv);
			Transaction t = ss.beginTransaction();
			t.commit();
			return true;
		} catch (Exception e) {
			// e.printStackTrace();
			return false;
		}

	}

	public List searchCourses(ScheduleVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from ScheduleVo where s1='"+v.getS1().getId()+"'");
		ls = q.list();

		return ls;
	}


}
