##
## Open LDAP connection and auth
##

require 'net/ldap'

username = ''
password = ''
ldaphost = ''
basedn=''

ldap = Net::LDAP.new(:host => ldaphost, :base => basedn)
filter = Net::LDAP::Filter.eq('uid', username)
ldap.search(:filter => filter) {|entry| username = entry.dn}
ldap.auth(username, password)

if ldap.bind
  print "Good";
else
  print "Bad";
end
