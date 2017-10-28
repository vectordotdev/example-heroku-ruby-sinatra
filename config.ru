require 'sinatra'
require './bar'
require './foo'

map "/bar" do
  run Bar.new
end

map "/foo" do
  run Foo.new
end