import Vue from 'vue'
import VeeValidate from 'vee-validate'
import { strongPassword } from '~/modules/validations'

#: Add Validations

VeeValidate.Validator.extend('strongPassword', strongPassword)

#: Use with Vue

Vue.use(
	VeeValidate,
	inject: true
)

#::: End Program :::