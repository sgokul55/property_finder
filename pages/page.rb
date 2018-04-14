require_relative "../locators/locator.rb"
module Pages
  class PropertyFinder < Locators::PropertyFinder
    def initialize(driver)
      super()
      @driver_instance = driver
      @dict = {}
    end

    def search_for_property()
      @driver_instance.click(@CATEGORY_SEARCH)
      @driver_instance.click(select_category('Buy'))
      @driver_instance.click(@PROPERTY_SEARCH)
      @driver_instance.click(select_type('Villa'))
      @driver_instance.click(@MIN_BED)
      @driver_instance.click(select_min_bed('3 Bedrooms'))
      @driver_instance.click(@MAX_BED)
      puts select_max_bed('7 Bedrooms')
      @driver_instance.click(select_max_bed('7 Bedrooms'))
      @driver_instance.enter_text(@KEY_WORD,'Dubai')
      sleep 5
      @driver_instance.click(@SORT_DROPDOWN)
      @driver_instance.click(sort_price('Price (low)'))




    end

    def get_location_price
      location_list = @driver_instance.get_texts_as_array(@TITLE_LIST)
      price_list = @driver_instance.get_texts_as_array(@PRICE_LIST)
      return location_list,price_list

    end

    def navigate_to_agent
      @driver_instance.click(@FIND_AGENT)
    end

    def search_for_agent_language(languages)


      @driver_instance.click(@LANGUAGE_SELECT)
      for language in languages
        @driver_instance.scroll_to_element_and_click(select_language(language))
      end

    end


    def search_for_agent_nationalities(nationalities)
      @driver_instance.click(@NATIONALITY_SELECT)
      for nation in nationalities
        @driver_instance.scroll_to_element_and_click(select_nationality(nation))
      end

    end

    def find_agents
      @driver_instance.click(@FIND_BUTTON)
    end

    def get_agent_count
      return @driver_instance.get_text(@AGENTS_COUNT).split(' ')[0]
    end

    def click_first_agent
      @driver_instance.click(@FIRST_AGENT)

    end



    # i) Name
    # ii) Nationality
    # iii) Languages
    # iv) License No
    # v) About Me
    # vi) Phone Number
    # vii) Company Name
    # viii) Experience
    # ix) No of active listings
    # x) LinkedIn URL (if present)

    def get_agent_details_value
      @driver_instance.click(@ABOUT_AGENT)
      details = {}
      details['Name'] = @driver_instance.get_text(@FIRST_AGENT_NAME)
      details['Nationality'] = @driver_instance.get_text(get_agent_details('Nationality'))
      details['Languages'] = @driver_instance.get_text(get_agent_details('Languages'))
      details['License No'] = @driver_instance.get_text(get_agent_details('License No.'))
      details['About Me'] = @driver_instance.get_text(@ABOUT_AGENT_CONTENT)
      details['Phone Number'] = @driver_instance.get_attribute(@FIRST_AGENT_PHONE,'href')
      details['Company Name'] = @driver_instance.get_text(@COMPANY_NAME)
      details['Experience'] = details['About Me'].split('With an experience of')[1]
      details['No of active listings'] = @driver_instance.get_text(get_agent_details('Active listings'))

      profile = @driver_instance.get_text(get_agent_details('LinkedIn'))

      if profile.include? "View profile"
        details['LinkedIn URL'] = @driver_instance.get_attribute(get_agent_LinkedIn_profile(),'href')

      end

      return details

    end

    def take_screen_shot
      @driver_instance.take_screen_shot

    end

    def change_language
      @driver_instance.click(@LANGUAGE_SELECTOR)

    end



  end
end
