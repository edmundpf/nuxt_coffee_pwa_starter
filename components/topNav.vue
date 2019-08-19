<template lang="pug">
	.div
		b-navbar
			template(slot='brand')
				b-navbar-item(href='/')
					img(
						:src='$icon(64)'
						alt='Starter project'
					)
			template(slot='start')
				b-navbar-item(
					href='/'
					v-if='!$store.state.topNav.isHome'
				)
					| Home
			template(slot='end')
				b-navbar-item(tag='div')
					.buttons
						a.button.is-primary(
							@click='signupClick'
							v-if="!$store.state.loggedIn && !$store.state.topNav.isSignup"
						)
							strong Sign up
						a.button.is-light(
							@click='loginClick'
							v-if="!$store.state.loggedIn && !$store.state.topNav.isLogin"
						)
							| Log in
						a.button.is-danger(
							@click='signOutClick'
							v-if="$store.state.loggedIn"
						)
							| Sign out
		authContent(
			:signup='false'
			:google='true'
			:admin='false'
			:modal='true'
			title='Log In'
			cancel='Close'
			action='Submit'
			:modal-show='loginModalActive'
			v-if="!$store.state.loggedIn && $store.state.topNav.isHome"
			ref='loginModal'
		)
		authContent(
			:signup='true'
			:google='true'
			:admin='false'
			:modal='true'
			title='Sign Up'
			cancel='Close'
			action='Submit'
			:modal-show='signupModalActive'
			v-if="!$store.state.loggedIn && $store.state.topNav.isHome"
			ref='signupModal'
		)
</template>

<script lang="coffee">

	import { signOut } from '~/modules/firebaseMethods'
	import authContent from '~/components/auth/authContent'

	export default
		data: ->
			return
				loginModalActive: false
				signupModalActive: false
		methods:
			signupClick: ->
				if this.$store.state.topNav.isHome
					this.$refs.signupModal.modalActive = true
				else
					this.$router.push('/account/signup')
			loginClick: ->
				if this.$store.state.topNav.isHome
					this.$refs.loginModal.modalActive = true
				else
					this.$router.push('/account/login')
			signOutClick: ->
				await signOut.bind(this)()
		components: {
			authContent
		}

</script>