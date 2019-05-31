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

def help(*_)
  puts COMMANDS.map { |k, v| " - #{k}\t#{v.first}" }.join '\n'
end

def list(songs)
  puts songs.each_with_index { |s, i| "#{i + 1} #{s}" }.join('\n')
end

def play(songs)
  puts 'Please enter a song name or number:'
  target = gets.chomp

  if target.to_i.to_s == target
    song = songs[target.to_i - 1]
  else
    s = songs.select { |v| v.include? target }

    if s
      puts s.pop
    else
      puts 'Invalid input, please try again'
    end
  end
end

def exit_jukebox(*_)
  puts 'Goodbye'
end 

COMMANDS = {
  'help' => ['displays this message', help],
  'list' => ['displays a list of songs you can play', list],
  'play' => ['play a song', play],
  'exit' => ['stop the program', exit_jukebox]
}

def run(songs)
  loop do
    puts 'Please enter a command:'
    reponse = gets.chomp

    if COMMANDS.include? reponse
      COMMANDS[reponse].last.call songs
    else
      help
    end
  end
end
