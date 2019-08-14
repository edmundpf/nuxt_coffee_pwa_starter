export default ({ route, store }) ->
	if route.name == 'index'
		store.dispatch('setState',
			subtitle: 'This is an unprotected view'
		)
		store.dispatch('topNav/setState',
			showHome: false
		)