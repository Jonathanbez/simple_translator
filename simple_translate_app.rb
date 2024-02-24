
require 'net/http'
require 'json'
require 'tty-prompt'

class Translate
        def translater(src_sentence, src_l, trg_l)
                uri = URI("https://api.mymemory.translated.net/get?q=#{src_sentence}&langpair=#{src_l}|#{trg_l}")
                response = Net::HTTP.get_response(uri)

                parsed_response = JSON.parse(response.body)
                
                translated_text = parsed_response["responseData"]["translatedText"]
                puts translated_text
        end
end

prompt = TTY::Prompt.new
        languages = ['en','pt-BR','es','fr']
        src_l = prompt.select("Select your source language:", languages)
        puts "\n"
        trg_l = prompt.select("select the targed language:", languages)



src_sentence = gets.chomp

translater = Translate.new
tranlater.tranlater(src_sentence, src_l, trg_l)
        
        