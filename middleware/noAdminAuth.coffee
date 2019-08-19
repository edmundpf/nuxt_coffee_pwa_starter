export default ({ store, redirect }) ->
	if !store.state.loggedIn
		return redirect('/account/login')
	else if !store.state.admin
		return redirect('/app')