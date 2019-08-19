<script lang="coffee">
	export default
		data: ->
			return
				email: ''
				password: ''
				confirmPassword: ''
				secretKey: ''
				rememberMe: false
		computed:
			hasEmailError: ->
				return this.errors.has('email')
			hasPasswordError: ->
				return this.errors.has('password')
			hasConfirmPasswordError: ->
				return this.errors.has('confirmPassword')
			hasSecretKeyError: ->
				return this.errors.has('secretKey')
			emailErrorMsg: ->
				return this.errors.first('email')
			passwordErrorMsg: ->
				return this.errors.first('password')
			confirmPasswordErrorMsg: ->
				return this.errors.first('confirmPassword')
			secretKeyErrorMsg: ->
				return this.errors.first('secretKey')
</script>