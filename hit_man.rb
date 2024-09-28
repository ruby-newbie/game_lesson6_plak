require 'ruby2d'

set title: "Hit the man!",
    width: 1800, height: 1400, resizable: false, background: 'blue'

@score = 0

@man = Sprite.new(
  'man.png',
  width: 240,
  height: 213,
  time: 30,
  loop: false
)

@hit = Sprite.new(
  'hit.png',
  width: 79,
  height: 270, 
  x: 850, 
  y: 850,
  # time: 300
  loop: false
  
)

@score_text = Text.new("Score: #{@score}", size: 100)

tick = 0

on :mouse_down do |event|
  if @man && @man.contains?(event.x, event.y)
    increase_score
  end
end

on :mouse_down do |event|
  @hit.x = event.x - @hit.width/2
  @hit.y = event.x - @hit.height/2
end


update do
  if @score >= 10
    finish_game
  else 
    if tick % 30 == 0 
    @man.x = Random.rand(Window.width - @man.width)
    @man.y = Random.rand(Window.height - @man.height)
    end
  tick += 1
  end
end 

def increase_score
  @score += 1
  @score_text.text = "Score: #{@score}"
  @man.play
end

def finish_game
  @score_text.remove
  @man.remove
  Text.new('You won!', size: 50)
end

show