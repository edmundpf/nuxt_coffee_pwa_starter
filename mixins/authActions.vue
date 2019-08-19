<script lang="coffee">

	import { googleSignIn, emailSignUp, emailLogIn } from '~/modules/firebaseMethods'

	export default
		methods:

			# Action button click

			actionClick: (isGrandchild=false, refName=null) ->
				if isGrandchild
					isValidated = await this.validateFields()
					this.$parent.$emit('actionClick', isValidated)
				else
					isValidated = await this.$refs[refName].validateFields()
					this.$emit('actionClick', isValidated)

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

			# Google button click

			googleClick: (isGrandchild=false) ->
				if isGrandchild
					this.$parent.$emit('cancelClick')
				else
					this.$emit('googleClick')

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

			authEvent: (validated) ->
				if validated
					if this.hasSignup
						await emailSignUp.bind(this)(this.email, this.password)
					else
						await emailLogIn.bind(this)(this.email, this.password)
				else
					this.$buefy.toast.open(
						message: 'Form is invalid, please fix fields and try again.'
						type: 'is-danger'
						position: 'is-bottom'
					)

			# Google auth event

			googleAuth: ->
				this.$logMessage('Attempting to login with google', 'Google Auth')
				await googleSignIn.bind(this)()

</script>