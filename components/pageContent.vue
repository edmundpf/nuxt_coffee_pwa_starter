<template lang="pug">
	section.container
		div(class='content has-text-centered')
			h1.title(class='has-text-primary')
				| {{ pageTitle }}
			h2.subtitle(
				class='has-text-grey'
				v-if='hasSubtitle'
			)
				| {{ $store.state.subtitle }}
</template>

<script lang="coffee">
	export default
		data: ->
			return
				pageTitle: this.title
				hasSubtitle: this.subtitle
		props:
			title:
				type: String
				default: 'Index page'
			subtitle:
				type: Boolean
				default: true
</script>