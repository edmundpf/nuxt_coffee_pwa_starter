<template lang="pug">
	div
		b-field(label='Email')
			b-input(
				name='email'
				:value='email'
				v-model='email'
				placeholder='Your email'
				v-validate="'required|email'"
				type="{ 'is-danger': hasEmailError }"
				message='emailErrorMsg'
			)
		b-field(
			label='Secret Key'
			v-if='hasAdmin'
		)
			b-input(
				name='secretKey'
				:value='secretKey'
				v-model='secretKey'
				placeholder='Your secret key'
				password-reveal
				v-validate="'required|min:8'"
				type="{ 'is-danger': hasSecretKeyError }"
				:message='secretKeyErrorMsg'
			)
		b-field(label='Password')
			b-input(
				name='password'
				:value='password'
				v-model='password'
				placeholder='Your password'
				password-reveal
				v-validate="'required|min:8|strongPassword'"
				type="{ 'is-danger': hasPasswordError }"
				:message='passwordErrorMsg'
			)
		b-field(
			label='Confirm Password'
			v-if='hasSignup'
		)
			b-input(
				name='confirmPassword'
				:value='confirmPassword'
				v-model='confirmPassword'
				placeholder='Confirm your password'
				password-reveal
				v-validate="'required|min:8|strongPassword'"
				type="{ 'is-danger': hasConfirmPasswordError }"
				:message='confirmPasswordErrorMsg'
			)
		b-field
			b-checkbox(type='is-primary')
			| Remember me
		authButtons(
			:cancel='cancel'
			:action='action'
			:google='google'
			v-if='hasButtons'
		)
</template>

<script lang="coffee">

	import userInfo from '~/mixins/userInfo'
	import authButtons from '~/components/authButtons'

	export default
		data: ->
			return
				hasSignup: if this.signup? then this.signup else true
				hasAdmin: if this.admin? then this.admin else false
				hasButtons: if this.buttons? then this.buttons else true
		props:
			signup: Boolean
			google: Boolean
			admin: Boolean
			buttons: Boolean
			cancel: String
			action: String
		mixins: [
			userInfo
		]
		components: {
			authButtons
		}
</script>