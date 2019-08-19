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

	import authMixin from '~/mixins/authMixin'
	import authForm from '~/components/auth/authForm'

	export default
		components: {
			authForm
		}
		mixins: [
			authMixin
		]
</script>