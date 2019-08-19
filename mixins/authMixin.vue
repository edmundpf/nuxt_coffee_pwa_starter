<script lang="coffee">

	export default

		data: ->

			authState = {}
			authConfig = {}
			keys =
				hasModal: 'modal'
				modalActive: 'modalShow'
				titleText: 'title'
				hasSignup: 'signup'
				hasAdmin: 'admin'
				hasButtons: 'buttons'
				cancelText: 'cancel'
				actionText: 'action'
				hasGoogle: 'google'

			for key, val of keys
				authState[key] = if this.config[val]? then this.config[val] else this[val]
				authConfig[val] = if this.config[val]? then this.config[val] else this[val]

			return {
				...authState,
				authConfig: authConfig
			}

		props:

			# Auth element has modal

			modal:
				type: Boolean
				default: true

			# Modal is active

			modalShow:
				type: Boolean
				default: false

			# Auth element page/modal title

			title:
				type: String
				default: 'Log In'

			# Form element is for signup

			signup:
				type: Boolean
				default: true

			# Form element is for admin

			admin:
				type: Boolean
				default: false

			# Form element has action buttons

			buttons:
				type: Boolean
				default: true

			# Action buttons cancel text

			cancel:
				type: String
				default: 'Close'

			# Action buttons submit text

			action:
				type: String
				default: 'Submit'

			# Action buttons has google button

			google:
				type: Boolean
				default: true

			# Config object for all props

			config:
				type: Object
				default:
					() -> {}

</script>