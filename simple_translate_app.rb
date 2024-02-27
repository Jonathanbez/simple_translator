
require_relative 'translator'
require_relative 'log'

puts "SIMPLE TRANSLATER APP\n\n"

prompt = TTY::Prompt.new
languages = %w[en pt-BR es fr]
src_l = prompt.select('Select your source language:', languages)
puts "\n"
trg_l = prompt.select('select the targed language:', languages)

puts "Write your sentence:"
src_sentence = gets.chomp

translater_output = Translator.new
output = translater_output.translater(src_sentence, src_l, trg_l)

puts output
s_file = Saver_text.new
s_file.save_log(src_sentence, output)
