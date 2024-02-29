
require_relative 'translator'
require_relative 'log'

loop do
  puts "SIMPLE TRANSLATER APP\n\n"

  select_lang = TTY::Prompt.new
  languages = %w[en pt-BR es fr]
  src_l = select_lang.select('Select your source language:', languages)
  puts "\n"
  trg_l = select_lang.select('select the targed language:', languages)

  puts "Write your sentence:"
  src_sentence = gets.chomp

  translater_output = Translator.new
  output = translater_output.translater(src_sentence, src_l, trg_l)

  loop_prompt = TTY::Prompt.new
    select = %w['Yes', 'No']
  select_loop = loop_prompt.select("Do you want to try again?", select)
  break if select_loop == 'No'
  puts output
  s_file = Saver_text.new
  s_file.save_log(src_sentence, output)
end
