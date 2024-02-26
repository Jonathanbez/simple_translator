require 'net/http'
require 'json'
require 'tty-prompt'
require 'translator'
require 'log'


class Translator
  def translater(src_sentence, src_l, trg_l)
    uri = URI("https://api.mymemory.translated.net/get?q=#{src_sentence}&langpair=#{src_l}|#{trg_l}")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      parsed_response = JSON.parse(response.body)
      parsed_response['responseData']['translatedText']

    else
      response.is_a(Net::HTTPError)
      JSON.parse(response.body)
    end
  end
end

prompt = TTY::Prompt.new
languages = %w[en pt-BR es fr]
src_l = prompt.select('Select your source language:', languages)
puts "\n"
trg_l = prompt.select('select the targed language:', languages)

src_sentence = gets.chomp

translater_output = Translator.new
puts translater_output.translater(src_sentence, src_l, trg_l)



s_file = Saver_text.new
s_file.save_log(src_sentence, translater_output)
