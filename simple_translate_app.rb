
require 'net/http'
require 'json'
require 'tty-prompt'


def translater(languages)
        uri = URI("https://api.mymemory.translated.net/get?q=Hello World!&langpair=#{language}|#{language}")
        response = Net::HTTP.get_response(uri)

        parsed_response = JSON.parse(response.body)
        
        translated_text = parsed_response["responseData"]["translatedText"]
        puts translated_text
end

prompt = TTY::Prompt.new
        languages = ['en','pt-BR','es','fr']
        src_l = prompt.select("Select your source language:", languages)
        puts "\n"
        trg_l = prompt.select("select the targed language:", languages)

translater(src_l, trg_l)

        
        