module Concerns
  module WebmotorsCars
    extend ActiveSupport::Concern

    def brands
      parse_json request_api("http://www.webmotors.com.br/carro/marcas")
    end

    def models(params)
      parse_json request_api("http://www.webmotors.com.br/carro/modelos", params)
    end

    private
    def request_api(uri, params = {})
      Net::HTTP.post_form(URI(uri), params)
    end

    def parse_json(response)
      JSON.parse response.body
    end
  end
end