{ stringify } = require('flatted/cjs')

#: Log JSON

export logJson = (obj, args) ->
	args = {
		msg: null
		...args
	}
	try
		if args.msg?
			console.log("OBJECT LOG: #{args.msg}")
		console.log(stringify(obj))
	catch err
		console.log(obj)

#: Log Error

export logError = (err, args) ->
	args = {
		msg: null
		...args
	}
	if args.msg?
		console.log("ERROR: #{args.msg}")
	if err.stack?
		stackTrace = err.stack.split('\n')
		for i in [0...len(stackTrace)]
			error = stackTrace[i].trim()
			if i == 0
				console.log(error)
			else
				console.log("  >>> #{error}")
	if err.message
		console.log(" >>> MESSAGE: #{err.message}")

#: Log Message w/ title

export logMessage = (msg, title) ->
	if title?
		console.log("#{title}: #{msg}")
	else
		console.log(msg)

#::: End Program :::