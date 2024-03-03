
require_relative 'translator'
require_relative 'log'
require 'tty-prompt'
require 'tty-spinner'
require 'colorize'

loop do
  system 'clear'
    puts "SIMPLE TRANSLATER APP(Supports UTF-8 encoding and a maximum of 500 bytes)\n\n".colorize(:blue)

    select_lang = TTY::Prompt.new
    languages = ['en', 'es', 'pt-BR', 'fr', 'it', 'ja']
    src_l = select_lang.select("SELECT YOUR SOURCE LANGUAGE:\n".colorize(:blue), languages)
    trg_l = select_lang.select("SELECT THE TARGED LANGUAGE:\n".colorize(:blue), languages)

    if src_l == trg_l
      puts "PLEASE SELECT TWO DISTINCT LANGUAGES".colorize(:red)
      next
    end

    puts "\nWRITE YOUR SENTENCE:\n".colorize(:blue)
    src_sentence = gets.chomp
    puts "\n"


    spinner = TTY::Spinner.new("[:spinner] Loading ...".colorize(:blue), format: :classic)
    spinner.auto_spin

    translater_output = Translator.new
    output = translater_output.translater(src_sentence, src_l, trg_l)

    spinner.success("Successful!\n".colorize(:green))

    puts "YOUR TRANSLATER:\n#{output}\n\n".colorize(:green)

    save_prompt = TTY::Prompt.new
    select_s = ['YES', 'NO']
    q_save = save_prompt.select("SAVE TRANSLATION TO LOG?".colorize(:blue), select_s)
    if q_save == 'YES'
        s_file = Saver_text.new
        s_file.save_log(src_sentence, output)
    end

    loop_prompt = TTY::Prompt.new
      select = ['YES', 'NO']
    select_loop = loop_prompt.select("\nDO YOU WANT TO TRY AGAIN".colorize(:blue), select)
  break if select_loop == 'NO'
end
