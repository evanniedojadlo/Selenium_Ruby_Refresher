#base is used for building out the tests structure

require 'selenium-webdriver'

class Base

	def initialize(driver)
		@driver = driver
	end

	def visit(url)
		@driver.get url
	end

	def click(locator)
		find_element(locator).click
	end

	def send_keys(locator, text)
		find_element(locator).send_keys text
	end


	def displayed?(locator)
			find_element(locator).displayed?
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




