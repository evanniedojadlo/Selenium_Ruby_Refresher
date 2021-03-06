#base is used for building out the tests structure

require 'selenium-webdriver'

class Base

	def initialize(driver)
		@driver = driver
	end

	def visit(url)
		@driver.get url
	end

	def find_element(locator)
		@driver.find_element locator
	end

	def click(locator)
		find_element(locator).click
	end

	def send_keys(locator, text)
		find_element(locator).send_keys text
	end

	def displayed?(locator) 
		begin #rescues and returns false instead of failing the entire test
			find_element(locator).displayed?
		rescue Selenium::WebDriver::Error::NoSuchElementError
			false
	end

	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
	end
	
	#private only to this class
	#yield allows us to pass code into this method when we call it in this case yield is replaced with 
	#the find element locator within displayed?

	private

	def rescue_exceptions
		begin
			yield
		rescue Selenium::WebDriver::Error::NoSuchElementError
			false
		end
	end

end






