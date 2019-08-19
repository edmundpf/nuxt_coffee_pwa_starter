bcrypt = require('bcryptjs')
import appConfig from '~/assets/json/appConfig.json'
import { fireStore, fireAuth } from '~/plugins/firebaseInit'
import { logJson, logError, logMessage } from '~/modules/logUtils'

#: Google Signin

export googleSignIn = (args) ->
	provider = new fireAuth.GoogleAuthProvider()
	try
		signIn = await fireAuth().signInWithPopup(provider)
		logJson(
			signIn
			msg: 'Google signin successful.'
		)
		this.$store.dispatch('setData',
			uid: signIn.user.uid
			email: signIn.user.email
			loginType: 'google'
			loggedIn: true
			remember: args.rememberMe
		)
		this.$router.push('/app')
	catch err
		logError(
			err
			msg: 'Could not sign in with google.'
			toast: true
		)

#: Email Signup

export emailSignUp = (args) ->
	try
		signIn = await fireAuth().createUserWithEmailAndPassword(
			args.email,
			args.password
		)
		logJson(
			signIn
			msg: 'Email signup successful.'
		)
		this.$store.dispatch('setData',
			uid: signIn.user.uid
			email: signIn.user.email
			loginType: 'email'
			loggedIn: true
			remember: args.rememberMe
		)
		this.$router.push('/app')
	catch err
		logError(
			err
			msg: 'Could not create account with email.'
			toast: true
		)

#: Email Login

export emailLogIn = (args) ->
	try
		signIn = await fireAuth().signInWithEmailAndPassword(
			args.email,
			args.password
		)
		logJson(
			signIn
			msg: 'Email login successful.'
		)
		this.$store.dispatch('updateData',
			uid: signIn.user.uid
			email: signIn.user.email
			loginType: 'email'
			loggedIn: true
			remember: args.rememberMe
		)
		this.$router.push('/app')
	catch err
		logError(
			err
			msg: 'Could not login with email.'
			toast: true
		)

#: Auth Signup

export authSignUp = (args) ->
	try
		getUser = {}
		signIn = {}
		if ((!this.$store.state.uid? || this.$store.state.uid == '') &&
			this.$store.state.email? && this.$store.state.email != '')
				getUser = await dbGetUserByEmail.bind(this)(args.email)
		else if (this.$store.state.uid? && this.$store.state.uid != '' &&
			(!this.$store.state.email? || this.$store.state.email == ''))
				getUser = await dbGetUser.bind(this)(this.$store.state.uid)

		hashedKey = await dbGetSecretKey.bind(this)()
		if hashedKey?
			keyVerified = await verifySecretKey.bind(this)(
				args.secretKey,
				hashedKey
			)
			if keyVerified
				if getUser.email? && !this.$store.state.loggedIn
					signIn = await fireAuth().signInWithEmailAndPassword(
						args.email,
						args.password
					)
					logJson(
						signIn
						msg: 'Admin email login successful.'
					)
				else
					signIn = await fireAuth().createUserWithEmailAndPassword(
						args.email,
						args.password
					)
					logJson(
						signIn
						msg: 'Admin email signup successful.'
					)
				this.$store.dispatch('setData',
					uid: signIn.user.uid
					email: signIn.user.email
					loginType: 'email'
					loggedIn: true
					remember: args.rememberMe
					admin: true
				)
				this.$router.push('/admin')
	catch err
		logError(
			err
			msg: 'Could not create admin account with email.'
			toast: true
		)

#: Auth Login

export authLogIn = (args) ->
	try
		getUser = {}
		if ((!this.$store.state.uid? || this.$store.state.uid == '') &&
			this.$store.state.email? && this.$store.state.email != '')
				getUser = await dbGetUserByEmail.bind(this)(args.email)
		else if (this.$store.state.uid? && this.$store.state.uid != '' &&
			(!this.$store.state.email? || this.$store.state.email == ''))
				getUser = await dbGetUser.bind(this)(this.$store.state.uid)

		hashedKey = await dbGetSecretKey.bind(this)()
		if hashedKey?
			keyVerified = await verifySecretKey.bind(this)(
				args.secretKey,
				hashedKey
			)
			if keyVerified && getUser.admin
				signIn = await fireAuth().signInWithEmailAndPassword(
					args.email,
					args.password
				)
				logJson(
					signIn
					msg: 'Admin email login successful.'
				)
				this.$store.dispatch('updateData',
					uid: signIn.user.uid
					email: signIn.user.email
					loginType: 'email'
					loggedIn: true
					remember: args.rememberMe
					admin: true
				)
				this.$router.push('/admin')
			else
				logMessage(
					'Could not verify admin.',
					'Auth Login',
					toast: true
				)
	catch err
		logError(
			err
			msg: 'Could not create admin account with email.'
			toast: true
		)

#: Sign out

export signOut = () ->
	try
		await fireAuth().signOut()
		logMessage('Signed out successfully.', 'Sign Out')
		this.$store.dispatch('updateData',
			loggedIn: false
			remember: false
		)
		this.$router.push('/')
	catch err
		logError(
			err
			msg: 'Could not sign out user.'
			toast: true
		)

#: Verify secret key

export verifySecretKey = (secretKey, hash) ->
	try
		isVerified = await bcrypt.compare(secretKey, hash)
		if isVerified
			logMessage('Secret key is valid.')
			return true
		else
			logMessage('Secret key is not valid.')
			return false
	catch err
		logError(
			err
			msg: 'Secret key could not be verified.'
		)
		return false

#: Edit user document in DB

export dbEditUser = (uid, obj) ->
	try
		docSet = await fireStore.collection('users').doc(uid).set(
			obj,
			merge: true
		)
		logMessage('User document written to firestore.')
		return true
	catch err
		logError(
			err
			msg: 'Could not write user document to firestore.'
		)
		return false

#: Get user document from DB

export dbGetUser = (uid) ->
	try
		docGet = await fireStore.collection('users').doc(uid).get()
		logJson(
			docGet
			msg: 'User document fetched from firestore.'
		)
		return docGet
	catch err
		logError(
			err
			msg: 'Could not get user document from firestore.'
		)
		return {}

#: Get user document from DB by email

export dbGetUserByEmail = (email) ->
	try
		queryGet = await fireStore.collection('users').where(
			'email',
			'==',
			email
		).limit(1)
		if !queryGet.empty
			docs = []
			queryGet.forEach((child) ->
				docs.push({
					...child.val()
					uid: child.key
				})
			)
			logJson(
				docs[0]
				msg: 'User document fetched from firestore.'
			)
			return docs[0]
		else
			return {}
	catch err
		logError(
			err
			msg: 'Could not get user document from firestore.'
		)
		return {}

#: Get secret key from DB

export dbGetSecretKey = () ->
	try
		docGet = await fireStore.collection(
			appConfig.secretKey.collection
		).doc(
			appConfig.secretKey.document
		).get()
		secretKey = docGet.data()[appConfig.secretKey.field]
		logMessage('Fetched secret key from firestore')
		return secretKey
	catch err
		logError(
			err
			msg: 'Could not get secret key from firestore.'
		)
		return undefined

#::: End Program :::