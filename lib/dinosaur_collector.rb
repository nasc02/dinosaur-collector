class DinosaurCollector
  def toy_collecting(toys_positions, dino_position, battery)
    # Valores iniciais
    current_position = dino_position
    collected_toys = []
    remaining_battery = battery

    while toys_positions.any?
      # Encontra o brinquedo mais proximo
      nearest_toy_position = toys_positions.min_by do |toy_position|
        distance(current_position, toy_position)
      end

      # Checa se o dinossauro tem bateria o suficiente para chegar no brinquedo.
      distance_to_toy = distance(current_position, nearest_toy_position)
      if distance_to_toy > remaining_battery
        break
      end

      # Coleta o brinquedo
      collected_toys << nearest_toy_position
      toys_positions.delete(nearest_toy_position)
      remaining_battery -= distance_to_toy

      # Move o dinossauro para a posiçao do brinquedo coletado
      current_position = nearest_toy_position
    end

    # Formata o resultado
    collected_toys.unshift(dino_position)
    [
      collected_toys,
      collected_toys.size - 1,
      remaining_battery.round(2)
    ]
  end

  private

  def distance(position_1, position_2)
    Math.sqrt((position_2[0] - position_1[0]) ** 2 + (position_2[1] - position_1[1]) ** 2)
  end
end
