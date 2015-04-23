class Login

#declare all locators on the page
#constants

	USERNAME_INPUT = { id: 'username' }
	PASSWORD_INPUT = { id: 'password' }
	SUBMIT_BUTTON = { css: 'button' }
	SUCCESS_MESSAGE = { css: '.flash.success' }

#with a class we have a constructor or initializer in ruby
#this class has to receive the driver object and so that it's accessible to the entire class we use a class instance variable

def initialize(driver) #class has to receive driver object
	@driver = driver
	@driver.get 'http://the-internet.herokuapp.com/login'
end

def with(username, password)
	@driver.find_element(USERNAME_INPUT).send_keys username
	@driver.find_element(PASSWORD_INPUT).send_keys password
	@driver.find_element(SUBMIT_BUTTON).click
end

#returns boolean
def success_message_present?
	@driver.find_element(SUCCESS_MESSAGE).displayed?
end

end