class Player
  def hand
    puts 'Veuillez saisir un numéro.'
    puts "0:pierre\n1:papier\n2:ciseaux"
    input_hand = gets.to_s
    while true
      if input_hand.include?('0')  \
          || input_hand.include?('1') \
          || input_hand.include?('2')
        return input_hand
      else
        puts 'Veuillez saisir un numéro.'
        puts "0:pierre\n1:papier\n2:ciseaux"
        input_hand = gets.to_s
      end
    end
  end
end

class Enemy
  def hand
    return rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    enemy_hand = enemy_hand.to_i
    player_hand = player_hand.to_i
    janken = ["pierre", "papier", "ciseaux"]
    puts "La main de l'autre personne est #{janken[enemy_hand]}."
    if enemy_hand.to_i == player_hand.to_i
        puts 'Aiko'
    return true
    elsif (player_hand == 0 && enemy_hand == 1)    \
            || (player_hand == 1 && enemy_hand == 2)    \
            || (player_hand == 2 && enemy_hand == 0)
      puts 'Vous gagnez'
      return false
    else
      puts 'Vous êtes en train de perdre.'
      return false
    end
  end
end

class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
        next_game = janken.pon(player.hand, enemy.hand)
      break if next_game == false
    end
  end
end
GameStart.jankenpon
