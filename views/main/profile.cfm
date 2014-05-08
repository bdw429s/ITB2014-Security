<cfoutput>

	<div class="profile_holder">
		<div class="profile_fullsize">
			<img src="/img/profiles/#prc.qUser.photo#" border="0" alt="#prc.qUser.firstName# #prc.qUser.lastName#'s Profile Photo">
		</div>
		<div class="profile_details">
			<h1>Profile: #prc.qUser.firstName# #prc.qUser.lastName#</h1>
			
			<div><b>Email:</b> #prc.qUser.email#</div>
			
			<div>&nbsp;</div>
			<div><b>Registered:</b> #timeformat( prc.qUser.createdat, "hh:mm tt")# on #dateformat( prc.qUser.createdat, "mm/dd/yyyy")#</div>
		
		</div>
	</div>
	<h3>About</h3>
	<div>#prc.qUser.about#</div>
	
	<h3>#prc.qUser.firstName# #prc.qUser.lastName#'s Status Posts</h3>
	
	<cfif prc.qStatuses.recordcount eq 0>
		<div class="alert alert-danger">#prc.qUser.firstName# #prc.qUser.lastName# is fighting the silence - 0 Status Updates</div>
	<cfelse>	
		<cfloop query="prc.qStatuses">
			<div class="status_holder <cfif prc.qStatuses.currentrow mod 2>status_mod</cfif>" >
				<div class="status_message">
					#prc.qStatuses.message#
				</div>	
				<div class="status_author">Shared at #timeformat( prc.qStatuses.createdat, "hh:mm tt")# on #dateformat( prc.qStatuses.createdat, "mm/dd/yyyy")#</div> 
			</div>
		</cfloop>	
	</cfif>

</cfoutput>