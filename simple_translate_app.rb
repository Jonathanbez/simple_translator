
require 'net/http'
require 'json'
require 'tty-prompt'

class Translator
        def translater(src_sentence, src_l, trg_l)
                uri = URI("https://api.mymemory.translated.net/get?q=#{src_sentence}&langpair=#{src_l}|#{trg_l}")
                response = Net::HTTP.get_response(uri)

                if
                        response.is_a?(Net::HTTPSuccess)
                        parsed_response = JSON.parse(response.body)
                        translated_text = parsed_response["responseData"]["translatedText"]
                        return translated_text
                else
                        response.is_a(Net::HTTPError)
                        error_response = JSON.parse(response.body)
                        error_status = error_response
                        return error_status
                end

        end
end

prompt = TTY::Prompt.new
        languages = ['en','pt-BR','es','fr']
        src_l = prompt.select("Select your source language:", languages)
        puts "\n"
        trg_l = prompt.select("select the targed language:", languages)



src_sentence = gets.chomp


translater = Translator.new
puts translater.translater(src_sentence, src_l, trg_l)

class save_log
        def save_log(src_sentence, translater)
                time = Time.now
                name = time.strftime("%d/%m/%Y %H:%m:%S")
                File.open("#{name}.txt", 'w') do |put|
                        put.puts "Input text: #{src_sentence}"
                        put.puts "Output text: #{translater}"
                end
        end
end
