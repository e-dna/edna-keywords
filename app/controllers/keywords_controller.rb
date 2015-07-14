class KeywordsController < ApplicationController
  def get
    require 'pismo'
    url = params[:url]
    keywords = []
    text = Pismo[url].body
    extractor = Phrasie::Extractor.new
    extractor.phrases(text)
    keywords = extractor.phrases(text)
    content = text
    response = { status: 'success', url: url, content: content, keywords: keywords}.to_json
    render json: response
  end

  def root
    render json: { status: 'success' }.to_json
  end
end
