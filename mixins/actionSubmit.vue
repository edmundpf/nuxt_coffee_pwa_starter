<script lang="coffee">

	export default

		data: ->

			keys =
				hasModal: 'modal'
				titleText: 'title'
				hasSignup: 'signup'
				hasAdmin: 'admin'
				hasButtons: 'buttons'
				cancelText: 'cancel'
				actionText: 'action'
				hasGoogle: 'google'

			return keys

		props:

			# Auth element has modal

			modal:
				type: Boolean
				default: true

			# Auth element page/modal title

			title:
				type: String
				default: 'Login'

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
				type: String
				default: true

			# Config object for all props

			config:
				type: [Object, String]
				default: {}

</script>