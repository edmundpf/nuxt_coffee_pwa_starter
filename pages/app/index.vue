<template lang="pug">
	div
		pageContent(
			title='App page'
			:subtitle='true'
		)
</template>

<script lang="coffee">

	import pageContent from '~/components/pageContent'
	import noAuth from '~/middleware/noAuth'

	export default
		components: {
			pageContent
		}
		middleware: [
			noAuth
		]
</script>