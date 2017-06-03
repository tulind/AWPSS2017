package com.rating.rest;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import com.rating.domain.*;

public class DatabaseConnector {

	static SessionFactory sessionFactory=null;
	static{
		Configuration config=new Configuration();
		config.configure();
		StandardServiceRegistryBuilder builder=new StandardServiceRegistryBuilder();
		builder.applySettings(config.getProperties());
		MetadataSources metadataSources=new MetadataSources();
		metadataSources.addAnnotatedClass(Kursvorlage.class);
		metadataSources.addAnnotatedClass(Professor.class);
		Metadata metadata=metadataSources.buildMetadata(builder.build());
		sessionFactory=metadata.buildSessionFactory();
	}
	
	public static boolean profAnlegen(String name, String email) {
		
		Session session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		try{
			Professor p = new Professor(name, email);
			session.save(p);
			
		}
		catch(HibernateException he){
			he.printStackTrace();
			trans.rollback();
			session.close();
			return false;
		}
		finally{
			session.close();
			return true;
		}
	}
	
	public static boolean kursAnlegen(String kursName, String semester, String kuerzel) {
		
		Session session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		try{
			
			Kursvorlage kurs=new Kursvorlage(1, kursName, semester,kuerzel);
			session.save(kurs);
			trans.commit();
		}
		catch(HibernateException he){
			he.printStackTrace();
			trans.rollback();
			session.close();
			return false;
		}
		finally{
			session.close();
			return true;
		}
	}
	//toDo
	public static boolean studentKursListeSuchen() {
		
		Session session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		try{
			
		}
		catch(HibernateException he){
			he.printStackTrace();
			trans.rollback();
			session.close();
			return false;
		}
		finally{
			session.close();
			return true;
		}
	}
	//toDo
		public static boolean dozentKursListeSuchen() {
			
			Session session=sessionFactory.openSession();
			Transaction trans=session.beginTransaction();
			try{
				
			}
			catch(HibernateException he){
				he.printStackTrace();
				trans.rollback();
				session.close();
				return false;
			}
			finally{
				session.close();
				return true;
			}
		}
		
		//toDo
		public static boolean kursInfo() {
			
			Session session=sessionFactory.openSession();
			Transaction trans=session.beginTransaction();
			try{
				
			}
			catch(HibernateException he){
				he.printStackTrace();
				trans.rollback();
				session.close();
				return false;
			}
			finally{
				session.close();
				return true;
			}
		}
}
