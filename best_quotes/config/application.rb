require "rulers"

module BestQuotes
  class Application < Rulers::Application
    # puts " [1,2,3,4,5].sum = #{[1,2,3,4,5].sum}"
  end
end

$LOAD_PATH << File.join(File.dirname(__FILE__),
"..", "app",  "controllers")
# puts "LOADPATH : #{$LOAD_PATH}"
require "quotes_controller"
