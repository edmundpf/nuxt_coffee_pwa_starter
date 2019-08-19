import {
	topNavState,
	storeMutations,
	storeActions,
	topNavMutations,
	topNavActions,
} from '~/modules/storeMethods'

mutations = {
	...storeMutations,
	...topNavMutations
}

actions = {
	...storeActions,
	...topNavActions,
}

export {
	topNavState as state,
	mutations,
	actions,
}