# https://docs.ruby-lang.org/en/master/IRB.html
require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history" 
IRB.conf[:USE_AUTOCOMPLETE] = false

begin
  require 'interactive_editor'
rescue LoadError => e
  puts "please install interactive_editor so you can use vi inside irb"
end
