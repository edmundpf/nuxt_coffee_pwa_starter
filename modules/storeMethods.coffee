import omit from 'lodash/omit'
import { dbEditUser } from '~/modules/firebaseMethods'


#: INDEX

# Index State

indexState = ->
	return
		admin: false
		loggedIn: false
		remember: false
		session: false
		loginType: 'email'
		uid: ''
		email: ''
		subtitle: ''
		message: ''

# Omit Keys for DB

dbOmit = [
	'uid'
	'loggedIn'
	'remember'
	'session'
	'subtitle'
	'message'
	'topNav'
]

#: Mutate State

mutateState = (state, payload) ->
	for key of payload
		if state[key]?
			state[key] = payload[key]


#: Store Mutations

storeMutations =

	# Mutate State

	mutateState: mutateState

	# Mutate Data

	mutateData: (state, payload) ->
		mutateState(state, payload)
		dbEditUser(state.uid || payload.uid, omit(payload, dbOmit))

	# Init Data

	initData: (state, payload) ->
		mutateState(state, payload)
		dbEditUser(state.uid || payload.uid, omit(state, dbOmit))

#: Store Actions

storeActions =

	# Set State

	setState: (context, payload) ->
		context.commit('mutateState', payload)

	# Set Data

	setData: (context, payload) ->
		context.commit('initData', payload)

	#: Update Data

	updateData: (context, payload) ->
		context.commit('mutateData', payload)

#: TOP NAVBAR

# Top Navbar State

topNavState = ->
	return
		isHome: true
		isSignup: false
		isLogin: false

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

#: Persisted Paths

persistPaths = ->
	paths =
		'index':
			obj: indexState()
			omit: [
				'subtitle'
				'message'
				'session'
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
			if state == 'index' && !attr.omit.includes(path)
				persist.push(path)
			else if state != 'index' && !attr.omit.includes(path)
				persist.push("#{state}.#{path}")
	return persist

#: Session Storage paths

sessionPaths = [
	'session'
]

#: Exports

export {
	indexState,
	storeMutations,
	storeActions,
	topNavState,
	topNavMutations,
	topNavActions,
	persistPaths,
	sessionPaths,
}

#::: End Program :::