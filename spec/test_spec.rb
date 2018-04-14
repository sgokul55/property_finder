require 'driver'
require_relative "../pages/page"
require 'csv'

describe "HelloWorld" do
  before(:all) do

    @driver = WebDriver.new('https://www.propertyfinder.ae/')
    sleep 5
    @seach_page = Pages::PropertyFinder.new(@driver)
    @seach_page.search_for_property
    sleep 5
  end




  it "Getting price of listings" do
    location,price = @seach_page.get_location_price

    CSV.open("myfile.csv", "w") do |csv|
      csv << ["Title", "Price"]
      for i in 0..location.size

        csv << [location[i], price[i]]
      end
    end
  end


  it "Finding agents count " do
    @seach_page.navigate_to_agent
    @seach_page.search_for_agent_language(['Arabic','English','Hindi'])
    @seach_page.find_agents
    agents_count1 = @seach_page.get_agent_count
    puts agents_count1
    @seach_page.navigate_to_agent
    @seach_page.search_for_agent_nationalities(['India'])
    @seach_page.find_agents
    agents_count2 = @seach_page.get_agent_count
    puts agents_count2
    expect(agents_count1.to_i>agents_count2.to_i).to eq(true)

  end

  it 'Get Agent Information' do
    @seach_page.navigate_to_agent
    @seach_page.find_agents
    @seach_page.click_first_agent
    values_hash = @seach_page.get_agent_details_value

    open('agent_info.txt', 'w') do |f|
      values_hash.each do |key,value|
        f.puts key+" -------------- "+value
      end
    end



    @seach_page.take_screen_shot
    @seach_page.change_language
    @seach_page.take_screen_shot



  end


end
