require_relative 'base'

class Login < Base

#declare all locators on the page
#all caps below are constants

	USERNAME_INPUT = { id: 'username' }
	PASSWORD_INPUT = { id: 'password' }
	SUBMIT_BUTTON = { css: 'button' }
	SUCCESS_MESSAGE = { css: '.flash.success' }
	FAILURE_MESSAGE = { css: '.flash.error' }

#with a class we have a constructor or initializer in ruby
#this class has to receive the driver object and so that it's accessible to the entire class we use a class instance variable

	#class has to receive driver object
	def initialize(driver)
		@driver = driver
		visit 'http://the-internet.herokuapp.com/login'
	end

	#enters username and password
	def with(username, password)
		send_keys USERNAME_INPUT, username
		send_keys PASSWORD_INPUT, password
		click SUBMIT_BUTTON
	end

	#returns boolean
	def success_message_present?
		displayed? SUCCESS_MESSAGE
	end

	#also returns boolean
	def failure_message_present?
		displayed? FAILURE_MESSAGE
	end

end