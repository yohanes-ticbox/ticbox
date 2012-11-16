import com.chicow.ticbox.security.*;
import com.gmongo.GMongo
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
	   // create-drop mongodb schema when in development mode
  		if (Environment.current == Environment.DEVELOPMENT) {
		  		 		  // drop database
		  				      def mongo = new GMongo()
		  				      def db = mongo.getDB('ticbox')
		  				      db.dropDatabase()
		  		 		}
		
		  def adminRole = Role.findByAuthority('ROLE_ADMIN')? Role.findByAuthority('ROLE_ADMIN'):new Role(authority: 'ROLE_ADMIN').save(flush: true) 
		  def respondentRole =Role.findByAuthority('ROLE_RESPONDENT')? Role.findByAuthority('ROLE_RESPONDENT'):new Role(authority: 'ROLE_RESPONDENT').save(flush: true) 
		  def surveyorRole = Role.findByAuthority('ROLE_SURVEYOR')? Role.findByAuthority('ROLE_SURVEYOR'):new Role(authority: 'ROLE_SURVEYOR').save(flush: true)


		  def adminUser = User.findByUsername('admin')?User.findByUsername('admin'):new User(username: 'admin', enabled: true, password: 'password',email:'admin@ticbox.co').save(flush: true)
/*			  def adminUser = new User(username: 'admin', enabled: true, password: 'password',email:'admin@ticbox.co').save(flush: true)*/

		  if (UserRole.findByUser(adminUser) == null) UserRole.create adminUser, adminRole, true

		  assert User.count() == 1; assert Role.count() == 3; assert UserRole.count() == 1;
		
	
    }
    def destroy = {
    }
}
