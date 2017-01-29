module Rulers
  class Application
    def get_controller_and_action(env)
      puts "env[\"PATH_INFO\"] = #{env["PATH_INFO"]}"
      _, cont,action,after = env["PATH_INFO"].split('/',4) #The “4” just means “split no more than 4 times”
      # puts "cont,action,after are: #{cont},#{action},#{after}"
      cont = cont.capitalize #"People"
      cont += "Controller"
      puts "cont eventallally= #{cont}"
      [Object.const_get(cont), action]
    end
  end
end
