<template lang="pug">
	authContent(
		:signup='true'
		:google='false'
		:admin='true'
		:modal='false'
		title='Sign Up'
		cancel='Cancel'
		action='Submit'
	)
</template>

<script lang="coffee">

	import authContent from '~/components/auth/authContent'
	import hasAdminAuth from '~/middleware/hasAdminAuth'

	export default
		components: {
			authContent
		}
		middleware: [
			hasAdminAuth
		]

</script>