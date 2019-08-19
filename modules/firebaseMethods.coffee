import { fireStore, fireAuth } from '~/plugins/firebaseInit'

#: Google Signin

export googleSignIn = () ->
	provider = new fireAuth.GoogleAuthProvider()
	try
		signIn = await fireAuth().signInWithPopup(provider)
		this.$logJson(
			signIn
			msg: 'Google signin successful.'
		)
		this.$store.dispatch('setState',
			loggedIn: true
		)
		this.$router.push('/app')
	catch err
		this.$logError(
			err
			msg: 'Could not sign in with google.'
		)
		this.$buefy.toast.open(
			message: 'Could not sign in with google.'
			type: 'is-danger'
			position: 'is-bottom'
		)

#: Email Signup

export emailSignUp = (email, password) ->
	try
		signUp = await fireAuth().createUserWithEmailAndPassword(email, password)
		this.$logJson(
			signUp
			msg: 'Email signup successful'
		)
		this.$store.dispatch('setState',
			loggedIn: true
		)
		this.$router.push('/app')
	catch err
		this.$logError(
			err
			msg: 'Could not create account with email.'
		)
		this.$buefy.toast.open(
			message: 'Could not sign up with email.'
			type: 'is-danger'
			position: 'is-bottom'
		)

#: Email Login

export emailLogIn = (email, password) ->
	try
		signUp = await fireAuth().signInWithEmailAndPassword(email, password)
		this.$logJson(
			signUp
			msg: 'Email login successful'
		)
		this.$store.dispatch('setState',
			loggedIn: true
		)
		this.$router.push('/app')
	catch err
		this.$logError(
			err
			msg: 'Could not login with email.'
		)
		this.$buefy.toast.open(
			message: 'Could not log in with email.'
			type: 'is-danger'
			position: 'is-bottom'
		)

#::: End Program :::