import store from '~/store'
import { logJson, logError } from '~/modules/logUtils'
import { fireStore, fireAuth } from '~/plugins/firebaseInit'

#: Google Signin

googleSignIn = () ->
	provider = new fireAuth.GoogleAuthProvider()
	try
		signIn = await fireAuth().signInWithPopup(provider)
		logJson(
			signIn
			msg: 'Google signin successful.'
		)
		store.dispatch('setState',
			loggedIn: true
		)
	catch err
		logError(
			err
			msg: 'Could not sign in with google.'
		)
