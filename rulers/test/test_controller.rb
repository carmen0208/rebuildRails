require_relative "test_helper"

class TestController < Rulers::Controller
  def index
    "Hello!" #Not rendering a views
  end

end

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end

end

class RulerAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/index"

    assert last_response.ok?
    body =  last_response.body
    assert body["Hello"]
  end
end
