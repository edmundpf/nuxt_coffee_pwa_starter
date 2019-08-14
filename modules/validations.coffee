#: Strong Password Validation

export strongPassword =
	getMessage: (field) ->
		'The password must contain at least: 1 letter, 1 number, and one special character.'
	validate: (value) ->
		return RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})").test(value)

#::: End Program :::