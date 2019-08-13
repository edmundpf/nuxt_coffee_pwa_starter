import Vuex from 'vuex'
import Cookies from 'js-cookie'
import createPersistedState from 'vuex-persistedstate'

createStore = () =>
	return new Vuex.Store(
		state: () => (
			msg: 'Project loaded!'
		),

		# Mutations

		mutations:

			# Mutate State

			mutateState: (state, payload) ->
				for key of payload
					if state[key]?
						state[key] = payload[key]

		# Actions

		actions:

			# Set State

			setState: (context, payload) ->
				context.commit('mutateState', payload)

		# Persisted Store (7 days)

		plugins: [
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
		],
)

export default createStore