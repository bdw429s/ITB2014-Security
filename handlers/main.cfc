component {
	
	function index( event, rc, prc ) {
		if ( ! structKeyExists(session, "user") ) {
			setNextEvent( 'main.login' );		
		}	
		
		
		var statusService = new services.statusService();
		prc.qStatuses = statusService.getStatuses(); //no user id gets all statuses, a user id gets just that user
		
	}
	
	function act_register( event, rc, prc ) {
			
		var userService = new services.userService();
		var saveResult = userService.registerUser( rc );
		if ( saveResult.status == 200 ) {
			session.user = {};
			session.user.id = saveResult.id;
			session.user.loggedIn = now(); 
			session.flash = {};
			session.flash.code = 1;
			session.flash.message = saveResult.message;
			setNextEvent( 'main.index' );
		} 
		else {
			session.flash = {};
			session.flash.code = 0;
			session.flash.message = saveResult.message;
			session.formstruct = form;
			setNextEvent( 'main.login' );
		}
		

	}
	
	function act_status_insert( event, rc, prc ) {
		if ( ! structKeyExists(session, "user") ) {
			setNextEvent( 'main.login' );		
		}	
	
		var statusService = new services.statusService();	
	
		var saveResult = statusService.insert( session.user.id, rc );
		if ( saveResult.status == 200 ){
			session.flash = {};
			session.flash.code = "true";
			session.flash.message = "Status Saved Successfully";
			setNextEvent( 'main.index' );
		} 
		else {
			session.flash = {};
			session.flash.code = "false";
			session.flash.message = saveResult.message;
			setNextEvent( 'main.index' );
		}
	}
	
	
	function login( event, rc, prc ) {
		
	}
	
	function act_login( event, rc, prc ) {			
		userService = new services.userService();
		userid = userService.checkLogin( rc.email, rc.password );
		if ( userid > 0 ) {
			session.user = {};
			session.user.id = userid;
			session.user.loggedIn = now(); 
			setNextEvent( 'main.index' );
		} 
		else {
			session.flash = {};
			session.flash.code = 0;
			session.flash.message = "Login Failed, Please Try Again.";
			setNextEvent( 'main.login' );		
		}
	}
	
	function members( event, rc, prc ) {
		if ( ! structKeyExists(session, "user") ) {
			setNextEvent( 'main.login' );
		}	
		
		var userService = new services.userService();
		prc.qMembers = userService.getUsersWithStatus();
	}
	
	function profile( event, rc, prc ) {
		if ( ! structKeyExists(session, "user") ) {
			location(url="dsp_login.cfm",addtoken="false");		
		}	
		
		var userService = new services.userService(); 
		prc.qUser = userService.getUser(rc.userid);
		
		var statusService = new services.statusService();
		prc.qStatuses = statusService.getStatuses( userid=rc.userid );
	
	}
	
	function myaccount( event, rc, prc ) {
		if ( ! structKeyExists(session, "user") ) {
			setNextEvent( 'main.login' );		
		}	
		
		var statusService = new services.statusService();
		prc.qStatuses = statusService.getStatuses( userid = session.user.id );
		
	}
	
	function logout( event, rc, prc ) {	
		try {
			structdelete(session, "user");
			session.flash = {};
			session.flash.code = 0;
			session.flash.message = "You have been successfully logged out. ";
			setNextEvent( 'main.login' );	
		}
		catch( any e ) {
			setNextEvent( 'main.login' );		
		}
		
	}
	
}