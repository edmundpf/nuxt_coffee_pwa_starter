<template lang="pug">
	div
		b-field(
			label='Email'
			:type="{ 'is-danger': hasEmailError }"
			:message='emailErrorMsg'
		)
			b-input(
				name='email'
				:value='email'
				v-model='email'
				placeholder='Your email'
				v-validate="'required|email'"

			)
		b-field(
			label='Secret Key'
			v-if='hasAdmin'
			:type="{ 'is-danger': hasSecretKeyError }"
			:message='secretKeyErrorMsg'
		)
			b-input(
				name='secretKey'
				:value='secretKey'
				v-model='secretKey'
				placeholder='Your secret key'
				password-reveal
				v-validate="'required|min:8'"

			)
		b-field(
			label='Password'
			:type="{ 'is-danger': hasPasswordError }"
			:message='passwordErrorMsg'
		)
			b-input(
				name='password'
				:value='password'
				v-model='password'
				placeholder='Your password'
				password-reveal
				v-validate="'required|min:8|strongPassword'"

			)
		b-field(
			label='Confirm Password'
			v-if='hasSignup'
			:type="{ 'is-danger': hasConfirmPasswordError }"
			:message='confirmPasswordErrorMsg'
		)
			b-input(
				name='confirmPassword'
				:value='confirmPassword'
				v-model='confirmPassword'
				placeholder='Confirm your password'
				password-reveal
				v-validate="'required|min:8|strongPassword'"
			)
		b-field
			b-checkbox(type='is-primary')
			| Remember me
		actionButtons(
			:cancel='cancelText'
			:action='actionText'
			:google='hasGoogle'
			@cancel-click="$emit('cancelClick')"
			@action-click="$emit('actionClick')"
			@google-click="$emit('googleClick')"
			v-if='hasButtons'
		)
</template>

<script lang="coffee">

	import userInfo from '~/mixins/userInfo'
	import actionButtons from '~/components/actionButtons'

	export default
		data: ->
			return
				hasSignup: this.config.signup || this.signup
				hasAdmin: this.config.admin || this.admin
				hasButtons: this.config.buttons || this.buttons
				hasGoogle: this.config.google || this.google
				cancelText: this.config.cancel || this.cancel
				actionText: this.config.action || this.action
		props:
			signup:
				type: Boolean
				default: true
			admin:
				type: Boolean
				default: false
			buttons:
				type: Boolean
				default: true
			config:
				type: Object
				default: {}
			google: Boolean
			cancel: String
			action: String
		mixins: [
			userInfo
		]
		components: {
			actionButtons
		}
</script>