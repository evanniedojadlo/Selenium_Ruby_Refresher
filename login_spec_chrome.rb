require 'selenium-webdriver'

describe 'Login' do

	before(:each) do
		@driver = Selenium::WebDriver.for :chrome
	end

	after(:each) do
		@driver.quit
	end

	it 'succeeded' do
		@driver.get 'http://the-internet.herokuapp.com/login'
		@driver.find_element(id: 'username').send_keys 'tomsmith'
		@driver.find_element(id: 'password').send_keys 'SuperSecretPassword!'
		@driver.find_element(css: 'button').click
		#@driver.find_element(id: 'login').click note that we could also use this option

		expect(@driver.find_element(css: '.flash.success').displayed).to be_true
	end


end