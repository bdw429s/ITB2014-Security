<cfparam name="prc.uploadSuccess" type="boolean" default="false">
<cfif prc.uploadSuccess>
	<div class="alert alert-success">Updated Photo</div>
<cfelse>
 	<div class="alert alert-danger">Upload Failed</div>
</cfif>