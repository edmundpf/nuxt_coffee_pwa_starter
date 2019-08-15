<template lang="pug">
	authContent(
		:signup='true'
		:google='true'
		:admin='true'
		:modal='false'
		title='Sign Up'
		cancel='Cancel'
		action='Submit'
	)
</template>

<script lang="coffee">

	import authContent from '~/components/authContent'

	export default
		components: {
			authContent
		}

</script>