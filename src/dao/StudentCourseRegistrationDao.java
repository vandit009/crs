package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import vo.StudentCourseRegistrationVo;

public class StudentCourseRegistrationDao {
	List ls = new ArrayList();

	public void insert(StudentCourseRegistrationVo vo) {
		// TODO Auto-generated method stub
		SessionFactory s = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = s.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(vo);
		t.commit();
		
	}

	public List searchRegisteredcourses(StudentCourseRegistrationVo v) {
		try {
			SessionFactory s = new Configuration().configure()
					.buildSessionFactory();
			Session s1 = s.openSession();
			System.out.println("S2 id::::::::::::::::::::::::"
					+ (v.getS2()).getId());

			Query q = s1.createQuery("from StudentCourseRegistrationVo where s2="
					+(v.getS2()).getId());
			ls = q.list();

		} catch (Exception z) {

		}
		return ls;
	}

	public boolean delete(StudentCourseRegistrationVo v) {
		try
		{
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session ss=sf.openSession();
		ss.delete(v);
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
