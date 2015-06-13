require_relative 'base'

describe 'Dynamic Loading' do


#creates driver and dynamic loading object with an instance of the page object
	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
		@dynamic_loading = DynamicLoading.new(@driver)
	end

	after(:each) do
		@driver.quit
	end

	it "displayed 'Hello World!' text" do
		@dynamic_loading.start
		expect(@dynamic_loading.finish_text_present?).to be_true
	end

end