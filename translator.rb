require 'simple_translate_app'

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
