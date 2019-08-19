export default ({ route, store }) ->

	# Split Current Path

	curPath = route.name.split('-')

	# Index

	if route.name == 'index'
		store.dispatch('setState',
			subtitle: 'This is an unprotected view'
		)
		store.dispatch('topNav/setState',
			isHome: true
			isLogin: false
			isSignup: false
		)

	# Auth pages

	else if curPath[0] == 'account' && ['login', 'signup'].includes(curPath[1])
		store.dispatch('setState',
			subtitle: 'This is an auth view'
		)
		store.dispatch('topNav/setState',
			isHome: false
		)
		if curPath[1] == 'login'
			store.dispatch('topNav/setAuthType',
				isLogin: true
			)
		else
			store.dispatch('topNav/setAuthType',
				isSignup: true
			)

	# Admin pages

	else if curPath[0] == 'admin' && !['login', 'signup'].includes(curPath[1])
		store.dispatch('setState',
			subtitle: 'This is a protected admin view'
		)
		store.dispatch('topNav/setState',
			isHome: false
			isLogin: false
			isSignup: false
		)

	# App pages

	else if curPath[0] == 'app'
		store.dispatch('setState',
			subtitle: 'This is a protected view'
		)
		store.dispatch('topNav/setState',
			isHome: false
			isLogin: false
			isSignup: false
		)

#::: End Program :::