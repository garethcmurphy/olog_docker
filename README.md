

ldapsearch -H ldapi:// -LLL -Q -Y EXTERNAL -b "cn=config" "(olcRootDN=*)" dn olcRootDN olcRootPW



 ldapsearch -x -H ldap://localhost -b dc=ldap -D "cn=admin,dc=ldap" -w admin
