import { storeMutations, storeActions } from '~/modules/storeMethods'

export state = ->
	pageTitle: 'test'

export {
	storeMutations as mutations,
	storeActions as actions,
}