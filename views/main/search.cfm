<cfparam name="rc.q" default="">
<br />
<div class="well">
	<form class="form">
		<input type="query" name="q" />
		<input type="submit" value="Search" />
	</form>
</div>
<cfif Len(rc.q)>
	<cfoutput>
		<div class="alert alert-danger">
			Your search for <strong>#rc.q#</strong> returned zero results.
		</div>
	</cfoutput>
</cfif>