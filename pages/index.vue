<template lang="pug">
	section.container
		div
			h1.title(class='has-text-purple')
				| {{ test }}
			h2.subtitle(class='has-text-grey')
				| {{ $store.state.msg }}
</template>

<script lang="coffee">
	export default
		data: ->
			return
				test: 'Hello World!'
</script>