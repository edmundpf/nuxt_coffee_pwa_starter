<template lang="pug">
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
				v-if='$store.state.topNav.showHome'
			)
				| Home
		template(slot='end')
			b-navbar-item(tag='div')
				.buttons
					a.button.is-primary(
						@click='signupClick'
					)
						strong Sign up
					a.button.is-light(
						@click='loginClick'
					)
						| Log in
</template>

<script lang="coffee">

	export default
		methods:
			signupClick: ->
				return 0
			loginClick: ->
				return 0

</script>