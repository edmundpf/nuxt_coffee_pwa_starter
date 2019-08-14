<template lang="pug">
	section
		pageContent(
			:title='actionTitle'
			:subtitle='false'
		)
		form(action='')
			.modal-card.auto-width(v-if='hasModal')
				header.modal-card-head
					p.modal-card-title {{ actionTitle }}
				section.modal-card-body
					authForm(
						:signup='signup'
						:google='google'
						:admin='admin'
						:cancel='cancel'
						:action='action'
						:buttons='false'
						ref='authForm'
					)
				footer.modal-card-foot
					authButtons(
						:cancel='cancel'
						:action='action'
					)
			div(v-else)
				.columns
					.column.is-6-desktop.is-offset-3-tablet.is-10-mobile.is-offset-1-mobile
						authForm(
							:signup='signup'
							:google='google'
							:admin='admin'
							:cancel='cancel'
							:action='action'
							:buttons='true'
							ref='authForm'
						)
</template>

<script lang="coffee">

	import pageContent from '~/components/pageContent'
	import authForm from '~/components/authForm'
	import authButtons from '~/components/authButtons'

	export default
		data: ->
			return
				hasModal: if this.modal? then this.modal else true
				actionTitle: this.title || 'Login'
		props:
			signup: Boolean
			google: Boolean
			admin: Boolean
			modal: Boolean
			title: String
			cancel: String
			action: String
		components: {
			authForm
			authButtons
			pageContent
		}
</script>

<style lang="scss">
	.auto-width {
		width: auto;
	}
</style>