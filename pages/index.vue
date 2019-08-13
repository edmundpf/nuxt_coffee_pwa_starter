<template lang="pug">
	section.container
		div
			h1.title {{ test }}
			h2.subtitle {{ $store.state.msg }}
</template>

<script lang="coffee">
	export default
		data: ->
			return
				test: 'Hello World!'
</script>