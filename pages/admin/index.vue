<template lang="pug">
	div
		pageContent(
			title='Admin page'
			:subtitle='true'
		)
</template>

<script lang="coffee">

	import pageContent from '~/components/pageContent'
	import noAdminAuth from '~/middleware/noAdminAuth'

	export default
		components: {
			pageContent
		}
		middleware: [
			noAdminAuth
		]
</script>