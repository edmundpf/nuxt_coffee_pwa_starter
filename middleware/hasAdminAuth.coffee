export default ({ store, redirect }) ->
	if store.state.loggedIn && store.state.admin
		return redirect('/admin')