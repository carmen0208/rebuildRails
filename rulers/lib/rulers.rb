require "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      end
      puts "env= #{env}"
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      # puts "controller = #{controller}"
      text = controller.send(act)
      # puts "text = #{text}"
      [200, {'Content-Type' => 'text/html'},
        [text]]
    end

  end

  class Controller
    def initialize(env)
      @env = env
    end
    def env
      @env
    end
  end
end
