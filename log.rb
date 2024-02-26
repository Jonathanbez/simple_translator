require 'tty-prompt'

class Saver_text
  def save_log(src_sentence, translater_output)
    time = Time.now
    name = time.strftime('%d-%m-%Y %H.%M.%S')
    File.open("#{name}.txt", 'w') do |saver|
      saver.puts "Input text: #{src_sentence}"
      saver.puts "Output text: #{translater_output}"
    end
  end
end
