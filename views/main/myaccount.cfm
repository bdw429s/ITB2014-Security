<cfoutput>
	<h1>My Account</h1>
	
	<a href="#event.buildLink( linkTo='main.profile', queryString='userid=#session.user.id#' )#">View my Profile</a>
	
	<h3>My Recent Posts</h3>
	<cfloop query="prc.qStatuses">
		<div class="status_holder <cfif prc.qStatuses.currentrow mod 2>status_mod</cfif>" >
			<div class="status_message">
				#prc.qStatuses.message#
			</div>	
			<div class="status_author">Shared at #timeformat( prc.qStatuses.createdat, "hh:mm tt")# on #dateformat( prc.qStatuses.createdat, "mm/dd/yyyy")#</div> 
		</div>
	</cfloop>	

</cfoutput>