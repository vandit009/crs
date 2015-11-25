package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import vo.CourseVo;

public class CourseDao {
	List ls = new ArrayList();

	public void insert(CourseVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(v);
		t.commit();
	}

	public List search() {
		try {
			SessionFactory s = new Configuration().configure()
					.buildSessionFactory();
			Session s1 = s.openSession();
			System.out.println("in search dao....");
			Query q = s1.createQuery("from CourseVo");

			ls = q.list();

			System.out.println("list....." + ls.size());
			return ls;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	public List edit(CourseVo v) {
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Query q = s1.createQuery("from CourseVo where id=" + v.getId()
				+ "");
		ls = q.list();

		return ls;
	}

	public void update(CourseVo v) {
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
		@SuppressWarnings("rawtypes")
		List l1 = new ArrayList();
		SessionFactory sessionFactory = new Configuration().configure()
				.buildSessionFactory();

		Session session = sessionFactory.openSession();
		Query qr = session.createQuery("from CourseVo");
		l1 = qr.list();
		return l1;

	}

	public List searchSubcategory(CourseVo v) {
		@SuppressWarnings("rawtypes")
		List l = null;
		try {

			SessionFactory sessionFactory = new Configuration().configure()
					.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			Query q = session.createQuery("from CourseVo where s1='"+v.getS1().getId()+"' ");
			l = q.list();

			tr.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	public boolean delete(CourseVo cv) {
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

	public List searchCourse(CourseVo v1) {
		@SuppressWarnings("rawtypes")
		List l = null;
		try {

			SessionFactory sessionFactory = new Configuration().configure()
					.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			Query q = session.createQuery("from CourseVo where s1='"+v1.getS1().getId()+"' ");
			l = q.list();

			tr.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}


}
