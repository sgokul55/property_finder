
module Locators
  class PropertyFinder

    attr_accessor :CATEGORY_SEARCH
    attr_accessor :PROPERTY_SEARCH
    attr_accessor :MIN_BED
    attr_accessor :MAX_BED
    attr_accessor :KEY_WORD
    attr_accessor :SORT_DROPDOWN
    attr_accessor :TITLE_LIST
    attr_accessor :PRICE_LIST
    attr_accessor :FIND_AGENT
    attr_accessor :LANGUAGE_SELECT
    attr_accessor :NATIONALITY_SELECT
    attr_accessor :FIND_BUTTON
    attr_accessor :AGENTS_COUNT
    attr_accessor :FIRST_AGENT

    attr_accessor :ABOUT_AGENT
    attr_accessor :ABOUT_AGENT_CONTENT
    attr_accessor :FIRST_AGENT_NAME
    attr_accessor :FIRST_AGENT_PHONE
    attr_accessor :COMPANY_NAME

    attr_accessor :LANGUAGE_SELECTOR

    def initialize
      @CATEGORY_SEARCH = "//div[@class= 'searchproperty_column searchproperty_category']"
      @PROPERTY_SEARCH = "//div[@class= 'searchproperty_column searchproperty_type']"
      @MIN_BED = "//div[ contains(@class,'dropdown_item') and  text()= 'Min. bed']/parent::div/parent::div"
      @MAX_BED = "//div[ contains(@class,'dropdown_item') and  text()= 'Max. bed']/parent::div/parent::div"
      @KEY_WORD = "//input[@placeholder='City or Community or Tower']"
      @SORT_DROPDOWN = "//div[@class='propertyheader_sortfield']"
      @TITLE_LIST = "//p[@class='card_location']"
      @PRICE_LIST = "//span[@class='card_pricevalue']"
      @FIND_AGENT = "//a[@href='/en/find-agent']"
      @LANGUAGE_SELECT = "(//div[@class='searchform_column'])[2]"
      @NATIONALITY_SELECT = "(//div[@class='searchform_column'])[3]"
      @FIND_BUTTON = "//button[text()='Find']"
      @AGENTS_COUNT = "//div[@class='heading']//h1"
      @FIRST_AGENT = "//div[@class='tiles']/a"
      @ABOUT_AGENT = "//a[@href='#tab-about']"
      @ABOUT_AGENT_CONTENT = "//div[@data-qs-content='tab-about']"
      @FIRST_AGENT_NAME = "//h1[@class='title title-size1 bioinfo_name']"
      @FIRST_AGENT_PHONE = "//a[@data-qs='phone-button']"
      @COMPANY_NAME = "//div[@class='brokerthumbnail_text']/p"
      @LANGUAGE_SELECTOR = "//a[@data-qs='language-selector']"

    end

    def get_agent_details(label)
      return "//span[text()='"+label+":']/following-sibling::span"

    end

    def get_agent_LinkedIn_profile
      return "//span[text()='LinkedIn:']/following-sibling::span/a"

    end

    def select_language(language)
      return "(//div[@class='searchform_column'])[2]//div[text()='"+language+"']"
    end

    def select_nationality(nationality)
      return "(//div[@class='searchform_column'])[3]//div[text()='"+nationality+"']"
    end

    def select_category(text)

      return "//div[@class= 'searchproperty_column searchproperty_category']//div[contains(@class,'dropdown_item') and text()='"+text+"']"

    end


    def select_type(text)

      return "//div[@class= 'searchproperty_column searchproperty_type']//div[contains(@class,'dropdown_item') and text()='"+text+"']"

    end

    def select_min_bed(text)

      return "//div[text()= 'Min. bed']/parent::div/parent::div//div[contains(@class,'dropdown_item') and text()='"+text+"']"

    end

    def select_max_bed(text)

      return "(//div[text()= 'Max. bed']/parent::div/parent::div//div[contains(@class,'dropdown_item ') and text()='"+text+"'])[last()]"

    end


    def sort_price(text)

      return "//div[@class='propertyheader_sortfield']//div[contains(@class,'dropdown_item ') and text()='"+text+"']"

    end

  end
end
