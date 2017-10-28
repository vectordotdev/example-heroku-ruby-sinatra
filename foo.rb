require './app'

class Foo < App
  disable :logging

  get "/" do
    logger.info("foo")
  end
end