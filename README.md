# Nuxt.js + Pug + Coffeescript + Babel + Buefy + Firestore PWA starter template.

> PWA Boilerplate started with a few commands.

## Firebase Setup
* Enable email and google authentification under sign-in methods
* In project settings add a new web-app and save your configuration in *~/modules/authInfo.coffee* as follows
``` coffeescript
export firebaseConfig =
	apiKey: 'xxxxx'
	authDomain: 'xxxxx'
	databaseURL: 'xxxxx'
	projectId: 'xxxxx'
	storageBucket: 'xxxxx'
	messagingSenderId: 'xxxxx'
	appId: 'xxxxx'
```
* Enable cloud firestore
* Add a collection that contains a bcrypt-encrypted secret key to verify admin sign-ups for additional admin functions
* The collection, document name, and key name must match the *collection, document, and field* values under *secretKey* in *~/assets/json/appConfig.json* respectively and can be modified

## Build Setup

``` bash
# Install Dependencies
$ npm install

# Serve development version
$ npm run dev

# Build production version and launch server
$ npm run build
$ npm start

# Generate static project
$ npm run generate
```
