export default ({ store, redirect }) ->
	if (store.state.loggedIn && !store.state.remember &&
		(!store.state.session? || !store.state.session))
			store.dispatch('setState',
				loggedIn: false
				remember: false
				session: true
			)