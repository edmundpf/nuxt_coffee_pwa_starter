import appConfig from './assets/json/appConfig.json'

module.exports =

	# Render Mode

	mode: 'spa'

	# Web Server

	server:
		port: appConfig.port

	# Page Headers

	head:
		title: appConfig.title
		meta: [
			hid: 'description'
			name: 'description'
			content: appConfig.description
		]

	# Manifest

	manifest:
		name: appConfig.title

	# Modules

	modules: [
		'~/modules/coffeescript'
		'nuxt-buefy'
		[
			'@nuxtjs/pwa'
			oneSignal: false
		]
	]

	# Middleware

	router:
		middleware: [
			'pageType'
			'newSession'
		]

	# Plugins

	plugins: [
		{
			src: '~/plugins/persistState',
			ssr: false
		}
		'~/plugins/validator'
		'~/plugins/firebaseInit'
		'~/plugins/logTools'
	]

	# CSS

	css: [
		src: '~/assets/scss/styles.scss'
		lang: 'scss'
	]

	# Loading Bar Color

	loading: {
		color: '#3B8070'
	}

	# Build Config

	build:

		# Webpack Extension

		extend = (config, ctx) ->

			# Source Map Configuration

			config.devtool = if ctx.isClient then 'eval-source-map' else 'inline-source-map'

#::: End Program :::