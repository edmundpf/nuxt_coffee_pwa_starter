<template lang="pug">
	.buttons
		button.button(
			type='button'
			@click="$emit('cancelClick')"
		) {{ cancelText }}
		button.button.is-danger(
			type='button'
			v-if='hasGoogle'
			@click="$emit('googleClick')"
		)
			b-icon(icon='google')
			span Google
		button.button.is-primary(
			type='button'
			@click="$emit('actionClick')"
		) {{ actionText }}
</template>

<script lang="coffee">

	import authForm from '~/components/authForm'

	export default
		data: ->
			return
				cancelText: this.cancel
				actionText: this.action
				hasGoogle: this.google
		props:
			cancel:
				type: String
				default: 'Close'
			action:
				type: String
				default: 'Submit'
			google:
				type: String
				default: true
		components: {
			authForm
		}
</script>