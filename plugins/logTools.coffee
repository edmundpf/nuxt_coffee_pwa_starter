import Vue from 'vue'
import { logJson, logError, logMessage } from '~/modules/logUtils'

Vue.prototype.$logJson = logJson
Vue.prototype.$logError = logError
Vue.prototype.$logMessage = logMessage