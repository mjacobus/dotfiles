# https://docs.ruby-lang.org/en/master/IRB.html
puts "Loading: #{__FILE__}"

def safe_require(file, message: nil)
  require file
rescue LoadError => exception
  message ||= exception.message
  puts message
end

safe_require 'rubygems'
safe_require 'irb/completion'
safe_require 'irb/ext/save-history'
ARGV.concat ['--readline', '--prompt-mode', 'simple']
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:USE_AUTOCOMPLETE] = false

def safe_require(file, message: nil)
  require file
rescue LoadError => exception
  message ||= exception.message
  puts message
end

def load_extension(file, reload: false)
  unless File.exist?(file)
    puts "File #{file} does does exist"
    return
  end

  unless reload
    require file
  end

  code = File.read(file)
  eval(code)
end

safe_require('interactive_editor', message: 'please install interactive_editor so you can use vi inside irb')

def reload_scripts
  load_extension("#{ENV['HOME']}/.irb/work.rb", reload: true)
end

reload_scripts

def r
  reload_scripts
end
