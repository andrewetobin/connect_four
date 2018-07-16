# require_relative 'messages'
# require_relative 'connect_four'
# require_relative 'player'

class Validations
  # include Messages

  # def check_for_draw
  #   if @game.round == 22
  #     draw
  #     @game.loop_back
  #   end
  # end

  def check_input(input)
    if ("A".."Z").include?(input.upcase) && input.length == 1
      return input
    else
      invalid_choice
      user_input = input
      player.turn(user_input)
    end
  end


end
