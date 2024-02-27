require 'net/http'
require 'json'
require 'tty-prompt'


class Translator
  def translater(src_sentence, src_l, trg_l)
    uri = URI("https://api.mymemory.translated.net/get?q=#{src_sentence}&langpair=#{src_l}|#{trg_l}")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      call = JSON.parse(response.body)
      parsed_response = call['responseData']['translatedText']
      return parsed_response
    else
      #response.is_a(Net::HTTPError)
      #JSON.parse(response.body)
      #raise "API request failed with status code: #{response.code}"
    end
  end
end
