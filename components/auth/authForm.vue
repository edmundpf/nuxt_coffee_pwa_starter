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
				type='password'
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
				ref='password'
				type='password'
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
				type='password'
				:value='confirmPassword'
				v-model='confirmPassword'
				placeholder='Confirm your password'
				password-reveal
				v-validate="'required|min:8|strongPassword|confirmed:password'"
			)
		b-field
			b-checkbox(
				type='is-primary'
				v-model='rememberMe'
			)
			| Remember me
		actionButtons(
			:config="authConfig"
			v-if='hasButtons'
			@cancelClick="cancelClick(true)"
			@actionClick="actionClick(true)"
			@googleClick="googleClick(true)"
		)
</template>

<script lang="coffee">

	import userInfo from '~/mixins/userInfo'
	import authMixin from '~/mixins/authMixin'
	import authActions from '~/mixins/authActions'
	import actionButtons from '~/components/auth/actionButtons'

	export default
		mixins: [
			userInfo
			authMixin
			authActions
		]
		components: {
			actionButtons
		}

</script>