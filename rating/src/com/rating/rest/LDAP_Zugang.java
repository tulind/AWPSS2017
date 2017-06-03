package com.rating.rest;

import javax.naming.directory.*;

import com.rating.domain.Nutzer;

import javax.naming.*;
import java.util.Hashtable;

public class LDAP_Zugang {

	public static Nutzer sucheNutzer(String kuerzel, String passwort) throws NamingException {
		String url = "ldap://ads.hs-karlsruhe.de:389";
		String s_p = "CN=kubu1011,OU=_sg_WIB,OU=_fk_IWI,OU=HS Studenten,OU=HS Users,OU=HS,DC=ads,DC=hs-karlsruhe,DC=de";

		pwd password = new pwd();
		String pwd = password.getPwd();

		Hashtable<String, Object> env_test = new Hashtable<>();
		env_test.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		env_test.put(Context.PROVIDER_URL, url);
		env_test.put(Context.SECURITY_AUTHENTICATION, "simple");
		env_test.put(Context.SECURITY_PRINCIPAL, s_p);
		env_test.put(Context.SECURITY_CREDENTIALS, pwd);

		DirContext ctx = new InitialDirContext(env_test);

		String filter = "(cn=" + kuerzel + ")";
		SearchControls ctrl = new SearchControls();
		ctrl.setSearchScope(SearchControls.SUBTREE_SCOPE);
		NamingEnumeration<SearchResult> answer = ctx.search("DC=ads,DC=hs-karlsruhe,DC=de", filter, ctrl);

		String dn;

		if (answer.hasMore()) {
			SearchResult result = (SearchResult) answer.next();
			dn = result.getNameInNamespace().toString();

			try {
				Hashtable<String, String> env = new Hashtable<>();
				env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
				env.put(Context.PROVIDER_URL, url);
				env.put(Context.SECURITY_AUTHENTICATION, "simple");
				env.put(Context.SECURITY_PRINCIPAL, dn);
				env.put(Context.SECURITY_CREDENTIALS, passwort);

				DirContext context = new InitialDirContext(env);

				Attributes attr = context.getAttributes(dn);

				String rolle;

				if (dn.contains("HS_Mitarbeiter")) {
					rolle = "Dozent";
				} else {
					rolle = "Student";
				}

				Nutzer nutzer = new Nutzer("" + attr.get("sn").get(), "" + attr.get("givenName").get(),
						"" + attr.get("mail").get(), "" + attr.get("cn").get(), rolle);

				return nutzer;

			} catch (Exception e) {
				throw e;
			}

		} else {
			dn = null;
		}

		return null;
	}
}
