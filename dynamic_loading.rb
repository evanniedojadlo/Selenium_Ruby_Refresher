require_relative 'base'

class DynamicLoading < Base

	START_BUTTON = { css: '#start button' }
	FINISH_TEXT = { id: 'finish' }

	def initialize(driver)
		@driver = driver
		visit 'http://the-internet.herokuapp.com/dynamic_loading/2'
	end

	def start
		click START_BUTTON
	end

	def finish_text_present?
		wait_for(6) { displayed? FINISH_TEXT }
	end

end