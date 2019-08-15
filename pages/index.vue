<template lang="pug">
	pageContent(:subtitle='true')
</template>

<script lang="coffee">

	import pageContent from '~/components/pageContent'
	import actionModal from '~/components/actionModal'

	export default
		components: {
			actionModal
			pageContent
		}
</script>