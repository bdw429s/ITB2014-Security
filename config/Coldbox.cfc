component {
	
	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Sample App",
			
			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
					
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};
			
		// Module Directives
		modules = {
			//Turn to false in production
			autoReload = true
		};
		
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" } 
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};
		
		//Register interceptors as an array, we need order
		interceptors = [
			 //SES
			 { class="coldbox.system.interceptors.SES" }
		];
		
	}

}