<template lang="pug">
	authContent(
		:signup='true'
		:google='true'
		:admin='false'
		:modal='false'
		title='Sign Up'
		cancel='Cancel'
		action='Submit'
	)
</template>

<script lang="coffee">

	import authContent from '~/components/auth/authContent'
	import hasAuth from '~/middleware/hasAuth'

	export default
		components: {
			authContent
		}
		middleware: [
			hasAuth
		]

</script>