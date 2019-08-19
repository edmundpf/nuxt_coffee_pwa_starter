export default ({ store, redirect }) ->
	if !store.state.loggedIn
		return redirect('/account/login')