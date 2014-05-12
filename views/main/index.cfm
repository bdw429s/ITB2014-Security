<cfoutput>

	<h2><cfinclude template="quotes/#prc.randomQuote#"></h2>
	<h3>Share yours</h3>
	
	<form method="post" action="#event.buildLink( 'main.act_status_insert' )#">
		<textarea name="message" class="status"></textarea>
		
		<input type="submit" name="btn_share" value="Share" class="btn btn-primary">
	</form>
	
	<h2>Whats going on in Time and Space</h2>
	<cfloop query="prc.qStatuses">
		<div class="status_holder <cfif prc.qStatuses.currentrow mod 2>status_mod</cfif>" >
			<div class="profile_thumb">
				<a href="#event.buildLink( linkTo='main.profile', queryString='userid=#prc.qStatuses.userid#' )#" title="#prc.qStatuses.firstName# #prc.qStatuses.lastName#"><img src="/img/profiles/#prc.qStatuses.photo#" width="100" border="0" alt="#prc.qStatuses.firstName# #prc.qStatuses.lastName#'s Profile Photo">
			</div>
			<div class="status_message_holder">
				<div class="status_message">
					#prc.qStatuses.message#
				</div>	
				<div class="status_author">Shared by <a href="#event.buildLink( linkTo='main.profile', queryString='userid=#prc.qStatuses.userid#' )#">#prc.qStatuses.firstName# #prc.qStatuses.lastName#</a> at 
					<a href="#event.buildLink(linkTo='main.status', queryString="id=#prc.qStatuses.statusid#")#">
					#timeformat( prc.qStatuses.createdat, "hh:mm tt")# on #dateformat( prc.qStatuses.createdat, "mm/dd/yyyy")#</a></div>
			</div> 
		</div>
	</cfloop>	
		
</cfoutput>