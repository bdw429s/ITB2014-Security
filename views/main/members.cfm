<cfoutput>
	
	<h2>Who's Who - Meet your Companions</h2>
	
	<cfloop query="prc.qMembers">
		<div class="status_holder <cfif prc.qMembers.currentrow mod 2>status_mod</cfif>" >
			<div class="profile_thumb">
				<a href="#event.buildLink( linkTo='main.profile', queryString='userid=#prc.qMembers.userid#' )#" title="#prc.qMembers.firstName# #prc.qMembers.lastName#"><img src="/img/profiles/#prc.qMembers.photo#" width="100" border="0" alt="#prc.qMembers.firstName# #prc.qMembers.lastName#'s Profile Photo"></a>
			</div>
			<div class="status_message_holder">
				<div class="status_message">
					<h3 class="member_name">#prc.qMembers.firstName# #prc.qMembers.lastName#</h3>
					<b>Last Status:</b><br>
					#prc.qMembers.message#
				</div>	
				<div class="status_author">Shared by <a href="#event.buildLink( linkTo='main.profile', queryString='userid=#prc.qMembers.userid#' )#">#prc.qMembers.firstName# #prc.qMembers.lastName#</a> at #timeformat( prc.qMembers.createdat, "hh:mm tt")# on #dateformat( prc.qMembers.createdat, "mm/dd/yyyy")#</div>
			</div> 
		</div>
	</cfloop>	

</cfoutput>