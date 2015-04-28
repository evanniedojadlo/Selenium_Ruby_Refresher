require 'selenium-webdriver'

class Base

	def initialize(driver)
		@driver = driver
	end

	def visit(url)
		@driver.get url
	end
end