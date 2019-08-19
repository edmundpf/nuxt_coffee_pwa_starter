#: States

# Index State

indexState = ->
	return
		admin: false
		loggedIn: false
		remember: false
		loginType: 'email'
		subtitle: ''
		message: ''

# Top Navbar State

topNavState = ->
	return
		isHome: true
		isSignup: false
		isLogin: false

#: Persisted Paths

persistPaths = ->
	paths =
		'index':
			obj: indexState()
			omit: [
				'subtitle'
				'message'
			]
		'topNav':
			obj: topNavState()
			omit: [
				'isHome'
				'isSignup'
				'isLogin'
			]
	persist = []
	for state, attr of paths
		for path of attr.obj
			if path == 'index' && !attr.omit.includes(path)
				persist.push(path)
			else if path != 'index' && !attr.omit.includes(path)
				persist.push("#{state}.#{path}")
	return persist

#: Store Mutations

storeMutations =

	# Mutate State

	mutateState: (state, payload) ->
		for key of payload
			if state[key]?
				state[key] = payload[key]

#: Store Actions

storeActions =

	# Set State

	setState: (context, payload) ->
		context.commit('mutateState', payload)

#: Top Navbar Mutations

topNavMutations =

	# Mutate Auth Page Type

	mutateAuthType: (state, payload) ->
		if payload.isSignup? && typeof payload.isSignup == 'boolean'
			state.isSignup = payload.isSignup
			state.isLogin = !payload.isSignup
		else if payload.isLogin? && typeof payload.isLogin == 'boolean'
			state.isLogin = payload.isLogin
			state.isSignup = !payload.isLogin

#: Top Navbar Actions

topNavActions =

	# Set Auth Page Type

	setAuthType: (context, payload) ->
		context.commit('mutateAuthType', payload)

#: Exports

export {
	indexState,
	topNavState,
	storeMutations,
	storeActions,
	topNavMutations,
	topNavActions,
	persistPaths,
}

#::: End Program :::