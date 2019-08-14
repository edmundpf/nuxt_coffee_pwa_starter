#: Store Mutations

export storeMutations = ->

	# Mutate State

	mutateState: (state, payload) ->
		for key of payload
			if state[key]?
				state[key] = payload[key]

#: Store Actions

export storeActions = ->

	# Set State

	setState: (context, payload) ->
		context.commit('mutateState', payload)

#::: End Program :::