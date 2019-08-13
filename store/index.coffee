import Cookies from 'js-cookie'
import createPersistedState from 'vuex-persistedstate'

# State

export state = ->
	msg: 'Project loaded!'


# Mutations

export mutations = ->

	# Mutate State

	mutateState: (state, payload) ->
		for key of payload
			if state[key]?
				state[key] = payload[key]

# Actions

export actions = ->

	# Set State

	setState: (context, payload) ->
		context.commit('mutateState', payload)

# Plugins

export plugins = [

	# Persisted Store (7 days)

	createPersistedState(
		storage:
			removeItem: (key) -> Cookies.remove(key)
			getItem: (key) -> Cookies.get(key)
			setItem: (key, value) -> Cookies.set(
				key,
				value,
				expires: 7,
				secure: false
			)
	)
]

#::: End Program :::