ROOT_DIRECTIRY = File.dirname(__FILE__)

require 'rspec'
require "rails/all"
require 'rspec/expectations'
require 'require_all'
require_all "#{ROOT_DIRECTIRY}/Test_helpers"

RSpec.configure do |config|
  config.include RSpec::Matchers
  Dir[File.join(File.dirname(__FILE__), './Test_helpers/', '') + "*.rb"].each { |file|
    require_relative file
    name = ''
    File.basename(file).gsub('.rb', '').split("_").map { |ea| ea.capitalize }.each { |e| name << e }
    config.include self.class.const_get(name)
  }

  config.after(:each) do |example_group|
    result_error = example_group.metadata[:example_group][:full_description].to_s + example_group.metadata[:description].to_s
    time = Time.now.strftime('%a_%e_%m_%Y_%l_%M_%p')
    res = "#{result_error} (#{time.to_s})"
    sceenshotname = "#{ROOT_DIRECTIRY}/Reports/#{res}"
    if example_group.exception
      f = File.new("#{ROOT_DIRECTIRY}/Reports/#{res}_BROWSER_LOGS.txt", 'w')
      f.close
      exception = example_group.exception
      filename = File.basename(example_group.metadata[:file_path])
      line_number = example_group.metadata[:line_number]
      report = "#{filename}:#{line_number} -> #{result_error}"
      puts "Occured error: #{exception} \n Failed test: #{report} \n Screenshot: '#{sceenshotname}'"
    end
  end
end