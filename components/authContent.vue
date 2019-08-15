<template lang="pug">
	section
		pageContent(
			:title='actionTitle'
			:subtitle='false'
		)
		form(action='')
			actionModal(
				v-if='hasModal'
				:title='title'
				:google='google'
				:cancel='cancel'
				:action='action'
				:body='authFormComponent'
				:bodyConfig='authConfig'
			)
			.columns(v-else)
				.column.is-6-desktop.is-offset-3-tablet.is-10-mobile.is-offset-1-mobile
					authForm(
						:config='authConfig'
						ref='authForm'
					)
</template>

<script lang="coffee">

	import pageContent from '~/components/pageContent'
	import authForm from '~/components/authForm'
	import actionButtons from '~/components/actionButtons'
	import actionModal from '~/components/actionModal'

	export default
		data: ->
			return
				hasModal: this.modal
				actionTitle: this.title
				authFormComponent: authForm
				authConfig:
					signup: this.signup
					google: this.google
					admin: this.admin
					cancel: this.cancel
					action: this.action
					buttons: this.buttons
		props:
			modal:
				type: Boolean
				default: true
			title:
				type: String
				default: 'Login'
			signup: Boolean
			google: Boolean
			admin: Boolean
			cancel: String
			action: String
		components: {
			authForm
			actionButtons
			actionModal
			pageContent
		}
</script>