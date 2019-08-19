<template lang="pug">
	b-modal(
		:active="modalActive"
		@close="cancelClick(false)"
		has-modal-card
	)
		.modal-card.auto-width
			header.modal-card-head
				p.modal-card-title {{ titleText }}
			section.modal-card-body
				component(
					:is='bodyComponent'
					:config='formConfig'
					ref='modalBody'
				)
			footer.modal-card-foot
				actionButtons(
					:config='authConfig'
					@cancelClick="cancelClick(false)"
					@googleClick="googleClick(false)"
					@actionClick="actionClick(false, 'modalBody')"
				)
</template>

<script lang="coffee">

	import authMixin from '~/mixins/authMixin'
	import authActions from '~/mixins/authActions'
	import authForm from '~/components/auth/authForm'
	import actionButtons from '~/components/auth/actionButtons'

	export default
		data: ->
			return
				bodyComponent: this.body
		props:
			body:
				type: [String, Object]
				default: 'div'
		mixins: [
			authMixin
			authActions
		]
		components: {
			authForm
			actionButtons
		}
		created: ->
			this.formConfig = {
				...this.authConfig,
				buttons: false
			}
</script>

<style lang="scss">
	.auto-width {
		width: auto;
	}
</style>