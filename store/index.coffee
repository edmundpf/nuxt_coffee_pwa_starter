import Cookies from 'js-cookie'
import createPersistedState from 'vuex-persistedstate'
import { storeMutations, storeActions } from '~/modules/storeMethods'

#: State

export state = ->
	msg: 'Project loaded!'

#: Mutations and Actions

export {
	storeMutations as mutations,
	storeActions as actions,
}

#: Plugins

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