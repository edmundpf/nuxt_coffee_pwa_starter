import Vue from 'vue'
import VeeValidate from 'vee-validate'
import { strongPassword } from '~/modules/validations'

#: Add Validations

VeeValidate.Validator.extend('strongPassword', strongPassword)

# Edit Dictionary

fieldDict =
	en:
		attributes:
			email: 'email address'
			confirmPassword: 'confirm password'

VeeValidate.Validator.localize(fieldDict)

#: Use with Vue

Vue.use(
	VeeValidate,
	inject: true
)

#::: End Program :::