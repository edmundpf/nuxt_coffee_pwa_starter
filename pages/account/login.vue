<template lang="pug">
	authContent(
		:signup='false'
		:google='true'
		:admin='false'
		:modal='false'
		title='Log In'
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