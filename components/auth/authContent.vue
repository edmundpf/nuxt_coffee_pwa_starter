<template lang="pug">
	section
		pageContent(
			:title='titleText'
			:subtitle='false'
			v-if='!hasModal'
		)
		form(@submit.prevent='authEvent')
			actionModal(
				v-if='hasModal'
				ref='authModal'
				:body='authFormComponent'
				:config='authConfig'
				@googleClick='googleAuth'
				@actionClick='authEvent'
			)
			.columns(v-else)
				.column.is-4-desktop.is-offset-4-tablet.is-10-mobile.is-offset-1-mobile
					authForm(
						:config='authConfig'
						@googleClick='googleAuth'
						@actionClick='authEvent'
					)
</template>

<script lang="coffee">

	import authMixin from '~/mixins/authMixin'
	import authActions from '~/mixins/authActions'
	import pageContent from '~/components/pageContent'
	import authForm from '~/components/auth/authForm'
	import actionButtons from '~/components/auth/actionButtons'
	import actionModal from '~/components/auth/actionModal'

	export default
		data: ->
			return
				authFormComponent: authForm
		mixins: [
			authMixin
			authActions
		]
		components: {
			authForm
			actionButtons
			actionModal
			pageContent
		}
		watch:
			modalActive: (newVal, oldVal) ->
				this.$refs.authModal.modalActive = newVal

</script>