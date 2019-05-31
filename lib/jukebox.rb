songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def list(songs)
  puts songs.each_with_index { |s, i| "#{i + 1} #{s}" }.join('\n')
end

def play(songs)
  puts 'Please enter a song name or number:'
  target = gets.chomp

  if target.to_i.to_s == target
    puts songs[target.to_i - 1]
  else
    s = songs.select { |v| v.include? target }

    if s
      puts s.pop
    end
  end

  puts 'Invalid input, please try again'
end

def exit_jukebox
  puts 'Goodbye'
end 

def help
  commands = {
    'help' => 'displays this message',
    'list' => 'displays a list of songs you can play',
    'play' => 'play a song',
    'exit' => 'stops the program'
  }

  puts commands.map { |k, v| " - #{k}\t#{v}" }.join '\n'
end

def run(songs)
  loop do
    puts 'Please enter a command:'

    case gets.chomp
    when 'list'
      list songs
    when 'play'
      play songs
    when 'exit'
      exit_jukebox
      return
    else
      help
    end
  end
end
