<template lang="pug">
	.modal-card.auto-width
		header.modal-card-head
			p.modal-card-title {{ actionTitle }}
		section.modal-card-body
			component(
				:is='bodyComponent'
				:config='bodyConfiguration'
			)
		footer.modal-card-foot
			actionButtons(
				:cancel='cancel'
				:action='action'
				:google='google'
				@cancel-click="$emit('cancelClick')"
				@action-click="$emit('actionClick')"
				@google-click="$emit('googleClick')"
			)
</template>

<script lang="coffee">

	import authForm from '~/components/authForm'
	import actionButtons from '~/components/actionButtons'

	export default
		data: ->
			return
				actionTitle: this.title
				bodyComponent: this.body
				bodyConfiguration: this.bodyConfiguration
		props:
			title:
				type: String
				default: 'Login'
			body:
				type: [String, Object]
				default: 'div'
			bodyConfig:
				type: Object
				default: {}
			google: Boolean
			cancel: String
			action: String
		components: {
			authForm
			actionButtons
		}
</script>

<style lang="scss">
	.auto-width {
		width: auto;
	}
</style>