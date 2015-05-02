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
	
end