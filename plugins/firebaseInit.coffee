import firebase from 'firebase/app'
import 'firebase/firestore'
import { firebaseConfig } from '~/modules/authInfo'

#: Initialize firebase

if !firebase.apps.length
	firebase.initializeApp(firebaseConfig)

#: Firestore

fireStore = firebase.firestore()

#: Firebase auth

fireAuth = firebase.auth

#: Exports

export {
	fireStore,
	fireAuth,
}

#::: End Program :::