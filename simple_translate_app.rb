
require 'net/http'
require 'json'
require 'tty-prompt'

class Translate
        def translater(src_sentence, src_l, trg_l)
                uri = URI("https://api.mymemory.translated.net/get?q=#{src_sentence}&langpair=#{src_l}|#{trg_l}")
                response = Net::HTTP.get_response(uri)

                begin
                        response.is_a?(Net::HTTPSuccess)
                        parsed_response = JSON.parse(response.body)
                        translated_text = parsed_response["responseData"]["translatedText"]
                        return translated_text
                rescue
                        response.is_a(Net::HTTPError)
                        error_response = JSON.parse(response.body)
                        error_status = error_response["responseStatus"]
                end

        end
end

prompt = TTY::Prompt.new
        languages = ['en','pt-BR','es','fr']
        src_l = prompt.select("Select your source language:", languages)
        puts "\n"
        trg_l = prompt.select("select the targed language:", languages)



src_sentence = gets.chomp

translater = Translate.new
translater.translater(src_sentence, src_l, trg_l)


begin
        parsed_response = JSON.parse(response)
    rescue JSON::ParserError
        puts "Error parsing the API response."
        return
    end

    #system 'clear'
    puts "API returned an error: #{parsed_response['error']['info']}"
        
        