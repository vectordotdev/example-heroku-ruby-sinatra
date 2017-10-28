require './app'

class Bar < App
  get "/" do
    logger.info("bar")
  end
end