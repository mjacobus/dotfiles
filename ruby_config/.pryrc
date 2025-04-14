# vi: ft=ruby
puts "Loading: #{__FILE__}"
irbrc = File.expand_path('~/.irbrc')
if File.exist?(irbrc)
  begin
    eval(File.read(irbrc), TOPLEVEL_BINDING)
  rescue Exception => exception
    puts "Error loading .irbrc: #{exception.message}"
  end
end
