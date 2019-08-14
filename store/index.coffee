import Cookies from 'js-cookie'
import createPersistedState from 'vuex-persistedstate'
import {
	indexState,
	storeMutations,
	storeActions,
	persistPaths,
} from '~/modules/storeMethods'

#: State, Mutations and Actions

export {
	indexState as state,
	storeMutations as mutations,
	storeActions as actions,
}

#: Plugins

export plugins = [

	# Persisted Store (7 days)

	createPersistedState(
		storage:
			paths: persistPaths()
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