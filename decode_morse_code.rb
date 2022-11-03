def decoder(morse_code)
  morse_dict = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
    '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N',
    '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S', '-' => 'T',
    '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z'
  }
  code = ''
  text = ''
  space_counter = 0
  morse_code.each_char do |char|
    if space_counter == 3
      text << ' '
      space_counter = 0
      code = ''
    end
    if char != ' '
      code << char.upcase
      space_counter = 0
    elsif char == ' '
      text << morse_dict[code] unless code.empty?
      code = ''
      space_counter += 1
    end
  end
  unless code.empty?
    text << morse_dict[code]
    code = ''
  end
  print text
end
decoder('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
