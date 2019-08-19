<script lang="coffee">

	import {
		googleSignIn,
		emailSignUp,
		emailLogIn,
		authSignUp,
		authLogIn
	} from '~/modules/firebaseMethods'

	export default
		methods:

			# Action button click

			actionClick: (isDescendant=false, refName=null) ->
				if isDescendant
					retDict =
						email: this.email
						password: this.password
						secretKey: this.secretKey
						rememberMe: this.rememberMe
					isValidated = await this.validateFields()
					this.$emit('actionClick', {
						...retDict,
						valid: isValidated
					})
				else
					retDict =
						email: this.$refs[refName].email
						password: this.$refs[refName].password
						secretKey: this.$refs[refName].secretKey
						rememberMe: this.$refs[refName].rememberMe
					isValidated = await this.$refs[refName].validateFields()
					this.$emit('actionClick', {
						...retDict,
						valid: isValidated
					})

			# Google button click

			googleClick: (isDescendant=false, refName=null) ->
				if isDescendant
					this.$emit(
						'googleClick'
						rememberMe: this.rememberMe
					)
				else
					this.$emit(
						'googleClick'
						rememberMe: this.$refs[refName].rememberMe
					)

			# Cancel button click

			cancelClick: (isGrandchild=false) ->
				if this.hasModal
					if isGrandchild
						this.$parent.$emit('cancelClick')
						this.$parent.$parent.modalActive = false
					else
						this.$emit('cancelClick')
					this.modalActive = false
					this.$parent.modalActive = false
				else
					this.$router.go(-1)


			# Validate fields

			validateFields: ->
				validation = await this.$validator.validateAll()
				try
					if validation
						return true
					else
						return false
				catch err
					return false

			# Auth event

			authEvent: (obj) ->
				if obj.valid
					if !this.hasAdmin && this.hasSignup
						await emailSignUp.bind(this)(obj)
					else if !this.hasAdmin && !this.hasSignup
						await emailLogIn.bind(this)(obj)
					else if this.hasAdmin && this.hasSignup
						await authSignUp.bind(this)(obj)
					else if this.hasAdmin && !this.hasSignup
						await authLogIn.bind(this)(obj)
				else
					this.$buefy.toast.open(
						message: 'Form is invalid, please fix fields and try again.'
						type: 'is-danger'
						position: 'is-bottom'
					)

			# Google auth event

			googleAuth: (obj) ->
				await googleSignIn.bind(this)(obj)

</script>