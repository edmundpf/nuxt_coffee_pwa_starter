import Vue from 'vue'

#: Log JSON

export logJson = (obj, args) ->
	args = {
		msg: null
		...args
	}
	try
		if args.msg?
			console.log("OBJECT LOG: #{args.msg}")
		console.log(JSON.stringify(obj))
	catch err
		console.log(obj)

#: Log Error

export logError = (err, args) ->
	args = {
		msg: null
		toast: false
		...args
	}
	if args.msg?
		console.log("ERROR: #{args.msg}")
	if err.stack?
		stackTrace = err.stack.split('\n')
		for i in [0...stackTrace.length]
			error = stackTrace[i].trim()
			if i == 0
				console.log(error)
			else
				console.log("  >>> #{error}")
	if err.message
		console.log(" >>> MESSAGE: #{err.message}")
	if args.toast
		toast = ''
		if args.msg?
			toast = "#{args.msg} "
		toast += err.message
		Vue.prototype.$buefy.toast.open(
			message: toast
			type: 'is-danger'
			position: 'is-bottom'
		)

#: Log Message w/ title

export logMessage = (msg, title, args) ->
	args = {
		toast: false
		type: 'is-danger'
		...args
	}
	if title?
		console.log("#{title}: #{msg}")
	else
		console.log(msg)
	if args.toast
		Vue.prototype.$buefy.toast.open(
			message: msg
			type: args.type
			position: 'is-bottom'
		)

#::: End Program :::