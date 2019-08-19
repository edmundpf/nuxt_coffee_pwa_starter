<template lang="pug">
	div
		pageContent(:subtitle='true')
</template>

<script lang="coffee">

	import pageContent from '~/components/pageContent'
	import hasAuth from '~/middleware/hasAuth'

	export default
		components: {
			pageContent
		}
		middleware: [
			hasAuth
		]
</script>