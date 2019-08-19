<template lang="pug">
	authContent(
		:signup='false'
		:google='false'
		:admin='true'
		:modal='false'
		title='Log In'
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