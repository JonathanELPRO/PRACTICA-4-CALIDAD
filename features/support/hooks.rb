After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

# After do |scenario|
#   if scenario.failed?
#     timestamp = Time.now.strftime('%Y%m%d-%H%M%S')
#     screenshot_path = "screenshots/failed_scenario_#{timestamp}.png"
#     page.save_screenshot(screenshot_path)
#     puts "Screenshot taken: #{screenshot_path}"
#   end
# end
