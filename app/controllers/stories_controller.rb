class StoriesController < ApplicationController
  def new
    if params[:age]
      client = OpenAI::Client.new(access_token: ENV["OPEN_AI_SECRET"])
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: "Crie uma história para colocar uma criança de #{params[:age]} anos para dormir contendo as seguintes palavras: #{params[:words].join(", ")}"}], # Required.
          temperature: 0.7,
        }
      )
      @story = response.dig("choices", 0, "message", "content")
    else
      @words = [
        "Aranha",
        "Baleia",
        "Coelho",
        "Elefante",
        "Formiga",
        "Gorila",
        "Hipopótamo",
        "Jacaré",
        "Leão",
        "Macaco",
        "Onça",
        "Pato",
        "Rato",
        "Sapo",
        "Tartaruga",
        "Urso",
        "Vaca",
        "Zebra",
        "Azul",
        "Brabo",
        "Congelado",
        "Divertido",
        "Esperto",
        "Faminto",
        "Grande",
        "Humilde",
        "Legal",
        "Mentiroso",
        "Narigudo",
        "Otimista",
        "Pequeno",
        "Quieto",
        "Responsável",
        "Sábio",
        "Teimoso",
        "Unico",
        "Veloz",
        "Zangado",
        "Abacaxi",
        "Bolo",
        "Chocolate",
        "Empada",
        "Feijão",
        "Gelatina",
        "Jabuticaba",
        "Kaki",
        "Leite",
        "Melancia",
        "Nhoque",
        "Ovo",
        "Pepino",
        "Queijo",
        "Rabanete",
        "Salada",
        "Tapioca",
        "Uva",
      ].shuffle
    end
  end
end
