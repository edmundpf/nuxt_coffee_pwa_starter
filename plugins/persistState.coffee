import Cookies from 'js-cookie'
import createPersistedState from 'vuex-persistedstate'
import { persistPaths, sessionPaths } from '~/modules/storeMethods'

#: State storage

export default ({ store }) ->

	# Persisted Store (7 days)

	createPersistedState(
		paths: persistPaths()
		storage:
			removeItem: (key) -> Cookies.remove(key)
			getItem: (key) -> Cookies.get(key)
			setItem: (key, value) -> Cookies.set(
				key,
				value,
				expires: 7,
				secure: false
			)
	)(store)

	# Session Store (cleared after tab close)

	createPersistedState(
		paths: sessionPaths
		storage: window.sessionStorage
	)(store)

#::: End Program :::