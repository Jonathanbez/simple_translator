require 'tty-prompt'

class Saver_text
  def save_log(src_sentence, output)
    time = Time.now
    date = time.strftime('%d-%m-%Y %H:%M:%S')
    File.open("Tradution - #{date}.txt", 'w') do |saver|
      saver.puts "Input text: #{src_sentence}"
      saver.puts "Output text: #{output}"
    end
  end
end
