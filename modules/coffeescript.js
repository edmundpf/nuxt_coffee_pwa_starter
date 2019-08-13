export default function() {

	// Add .coffee extension for store, middleware, etc.

	this.nuxt.options.extensions.push('coffee')
	this.nuxt.hook('build:before', (builder) => {
		builder.supportedExtensions.push('coffee')
	})

	this.extendBuild((config) => {

		// Add Coffeescript Loader w/ Babel transpile

		config.module.rules.push({
			test: /\.coffee$/,
			use: [
				{
					loader: 'coffee-loader',
					options: {
						transpile: {
							presets: ['@babel/env']
						}
					}
				}
			]
		})

		// Add .coffee extension to webpack

		if (config.resolve.extensions.indexOf('.coffee') === -1) {
			config.resolve.extensions.push('.coffee')
		}
	})
}