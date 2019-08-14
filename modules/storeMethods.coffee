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
		showHome: true

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
				'showHome'
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

#: Exports

export {
	indexState,
	topNavState,
	storeMutations,
	storeActions,
	persistPaths,
}

#::: End Program :::