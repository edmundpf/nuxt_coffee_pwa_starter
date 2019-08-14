<template lang="pug">
	.buttons
		button.button(
			type='button'
			@click='$emit("cancelClick")'
		) {{ cancelText }}
		button.button.is-danger(
			type='button'
			v-if='hasGoogle'
			@click='$emit("googleClick")'
		)
			b-icon(icon='google')
			span Google
		button.button.is-primary(
			type='button'
			@click='$emit("actionClick")'
		) {{ actionText }}
</template>

<script lang="coffee">

	import authForm from '~/components/authForm'

	export default
		data: ->
			return
				cancelText: this.cancel || 'Close'
				actionText: this.action || 'Submit'
				hasGoogle: if this.google? then this.google else true
		props:
			cancel: String
			action: String
			google: Boolean
		components: {
			authForm
		}
</script>