import appConfig from './assets/json/appConfig.json'

module.exports =

	# Render Mode

	mode: 'universal'

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
		name: appConfig.titlea

	# Loading Bar Color

	loading: {
		color: '#3B8070'
	}

	# CSS

	css: [
		src: '~/assets/scss/styles.scss'
		lang: 'scss'
	]

	# Plugins

	plugins: [

	]

	# Modules

	modules: [
		'~/modules/coffeescript'
		'nuxt-buefy'
		[
			'@nuxtjs/pwa'
			oneSignal: false
		]
	]

	# Build Config

	build:

		# Webpack Extension

		extend = (config, ctx) ->

			# Source Map Configuration

			config.devtool = if ctx.isClient then 'eval-source-map' else 'inline-source-map'

#::: End Program :::