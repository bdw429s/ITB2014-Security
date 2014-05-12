<cfoutput query="prc.qStatus">
	<div class="status_holder">
		<div class="status_message">
			#prc.qStatus.message#
		</div>	
		<div class="status_author">
			Shared by <a href="#event.buildLink( linkTo='main.profile', queryString='userid=#prc.qStatus.userid#' )#">#prc.qStatus.firstName# #prc.qStatus.lastName#</a>

			 at #timeformat( prc.qStatus.createdat, "hh:mm tt")# on #dateformat( prc.qStatus.createdat, "mm/dd/yyyy")#</div> 
	</div>
</cfoutput>