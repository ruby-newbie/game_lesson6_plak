require 'ruby2d'

set title: "Hello Square"

@square = Square.new(
  x: 100, y: 200,
  size: 125,
  color: 'blue',
  z: 10
)


on :key_down do |event|
  # здесь доступен объект event, можно изучить его свойства
  puts event
end


on :key_down do |event|
  if event.key == "down"
        @square.color = "green"
  elsif event.key == "up"
    @square.color = "red"
  end
end



show