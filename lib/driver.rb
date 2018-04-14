require 'selenium-webdriver'
require 'yaml'
class WebDriver


  def initialize(url)
    @capablities = YAML.load_file(File.dirname(__FILE__)+'/../conf/web_conf.yml')
    browser = @capablities['browser']
    if browser == 'chrome'
      @driver=Selenium::WebDriver.for :chrome
    elsif browser == 'firefox'
      @driver=Selenium::WebDriver.for :firefox
    end


    @driver.manage.window.maximize
    @driver.navigate.to url
  end


  def get_driver
    return @driver
  end


  def get_element(xpath)
    return @driver.find_element(:xpath,xpath)
  end

  def take_screen_shot
    time_string = Time.now.strftime('%Y%m%d%H%M%S')
    @driver.save_screenshot('screenshot'+time_string+'.png')
  end

  def enter_text(xpath,text)
    @driver.find_element(:xpath,xpath).click
    @driver.find_element(:xpath,xpath).send_keys(text)
    @driver.find_element(:xpath,xpath).send_keys:return

  end

  def get_text(xpath)
    return @driver.find_element(:xpath,xpath).text
  end

  def click(xpath)
    @driver.find_element(:xpath,xpath).click
    sleep 1
  end

  def get_position(xpath)
    point = @driver.find_element(:xpath,xpath).location
    puts point['x']
    puts point['y']
    return point['x'],point['y']

  end

  def get_attribute(xpath,attribute_name)
    sleep 1
    return @driver.find_element(:xpath,xpath).attribute(attribute_name)

  end

  def get_texts_as_array(xpath)
    elms = @driver.find_elements(:xpath,xpath)
    text_array = []
    for elm in elms
      text_array.push(elm.text)
    end
    return text_array
  end


  def scroll_to_element_and_click(xpath)
    elm = @driver.find_element(:xpath,xpath)
    @driver.action.move_to(elm).perform
    elm.click
  end

  def is_element_present(xpath)
    begin
      return @driver.find_element(:xpath,xpath).displayed?
    rescue
      return false
    end
  end

end
