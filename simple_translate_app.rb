
require_relative 'translator'
require_relative 'log'
require 'tty-prompt'
require 'tty-spinner'

loop do
  system 'clear'
    puts "SIMPLE TRANSLATER APP(Supports UTF-8 encoding and a maximum of 500 bytes)\n\n"

    select_lang = TTY::Prompt.new
    languages = %w[en pt-BR es fr]
    src_l = select_lang.select('SELECT YOUR SOURCE LANGUAGE:\n', languages)
    trg_l = select_lang.select('SELECT THE TARGED LANGUAGE:\n', languages)
    if src_l == trg_l
      puts "PLEASE SELECT TWO DISTINCT LANGUAGES"
      next
    end

    puts "WRITE YOUR SENTENCE:\n"
    src_sentence = gets.chomp
    puts "\n"

    spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2)

    spinner.auto_spin
    translater_output = Translator.new
    output = translater_output.translater(src_sentence, src_l, trg_l)


    puts "YOUR TRANSLATER:\n#{output}\n\n"

    s_file = Saver_text.new
    s_file.save_log(src_sentence, output)

    loop_prompt = TTY::Prompt.new
      select = ['YES', 'NO']
    select_loop = loop_prompt.select("DO YOU WANT TO TRY AGAIN", select)
  break if select_loop == 'NO'
end
