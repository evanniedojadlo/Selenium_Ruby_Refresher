require 'selenium-webdriver'
require_relative 'login' #used relative because this is in the same directory

describe 'Login' do 

	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
		@login = Login.new(@driver)
	end

	after(:each) do
		@driver.quit
	end

	it 'succeeded' do
		@login.with 'tomsmith', 'SuperSecretPassword!'
		expect(@login.success_message_present?).to be_true
	end

end