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
			{
				charset: 'utf-8'
			}
			{
				name: 'viewport'
				content: 'width=device-width, initial-scale=1'
			}
			{
				hid: 'description'
				name: 'description'
				content: appConfig.description
			}
		]
		link: [
			rel: 'icon'
			type: 'image/x-icon'
			href: '/favicon.ico'
		]

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
	]

	# Build Config

	build:

		# Webpack Extension

		extend = (config, ctx) ->

			# Source Map Configuration

			config.devtool = if ctx.isClient then '#eval-source-map' else '#inline-source-map'

#::: End Program :::