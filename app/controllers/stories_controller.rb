class StoriesController < ApplicationController
  def new
    @story = Story.new
    @keywords = [
      ["🕷️ Aranha", "Aranha"],
      ["🐋 Baleia", "Baleia"],
      ["🐇 Coelho", "Coelho"],
      ["🐘 Elefante", "Elefante"],
      ["🐜 Formiga", "Formiga"],
      ["🦍 Gorila", "Gorila"],
      ["🦛 Hipopótamo", "Hipopótamo"],
      ["🐊 Jacaré", "Jacaré"],
      ["🦁 Leão", "Leão"],
      ["🐒 Macaco", "Macaco"],
      ["🐆 Onça", "Onça"],
      ["🦆 Pato", "Pato"],
      ["🐀 Rato", "Rato"],
      ["🐸 Sapo", "Sapo"],
      ["🐢 Tartaruga", "Tartaruga"],
      ["🐻 Urso", "Urso"],
      ["🐄 Vaca", "Vaca"],
      ["🦓 Zebra", "Zebra"],
      ["💙 Coração azul", "Coração azul"],
      ["🥶 Congelado", "Congelado"],
      ["😂 Divertido", "Divertido"],
      ["🔥 Fogo", "Fogo"],
      ["❤️ Amor", "Amor"],
      ["🎪 Circo", "Circo"],
      ["🧊 Gelo", "Gelo"],
      ["🤥 Mentiroso", "Mentiroso"],
      ["👃 Nariz", "Nariz"],
      ["✈️ Avião", "Avião"],
      ["🤫 Silencioso", "Silencioso"],
      ["🦉 Coruja", "Coruja"],
      ["🍌 Banana", "Banana"],
      ["🦄 Unicornio", "Unicornio"],
      ["🏃‍♂️ Correr", "Correr"],
      ["😠 Zangado", "Zangado"],
      ["🍍 Abacaxi", "Abacaxi"],
      ["🍰 Bolo", "Bolo"],
      ["🍫 Chocolate", "Chocolate"],
      ["🍨 Sorvete", "Sorvete"],
      ["🍚 Arroz", "Arroz"],
      ["⚽ Futebol", "Futebol"],
      ["🐐 Cabra", "Cabra"],
      ["🐑 Ovelha", "Ovelha"],
      ["🥛 Leite", "Leite"],
      ["🍉 Melancia", "Melancia"],
      ["🍝 Macarrão", "Macarrão"],
      ["🥚 Ovo", "Ovo"],
      ["🥒 Pepino", "Pepino"],
      ["🧀 Queijo", "Queijo"],
      ["🥦 Brócolis", "Brócolis"],
      ["🥗 Salada", "Salada"],
      ["🚴 Andar de bicicleta", "Andar de bicicleta"],
      ["🍇 Uva", "Uva"],
      ["🏓 Ping pong", "Ping pong"],
      ["⛸️ Patinação no gelo", "Patinação no gelo"],
      ["🎣 Pescar", "Pescar"],
      ["🎨 Desenhar", "Desenhar"],
      ["🎤 Cantar", "Cantar"],
      ["🎸 Tocar guitarra", "Tocar guitarra"],
      ["🥁 Tocar bateria", "Tocar bateria"],
      ["⛰️ Montanha", "Montanha"],
      ["🌋 Vulcão", "Vulcão"],
      ["🏕️ Acampar", "Acampar"],
      ["🏖️ Praia", "Praia"],
      ["🏠 Casa", "Casa"],
      ["🏰 Castelo", "Castelo"],
      ["🚂 Trem", "Trem"],
      ["🚑 Ambulância", "Ambulância"],
    ].shuffle
  end

  def create
    story = Story.new(story_params)

    puts story_params.inspect

    client = OpenAI::Client.new(access_token: ENV["OPEN_AI_SECRET"])
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ 
          role: "user", 
          content: "Crie uma história para colocar uma criança de #{story.age} anos para dormir contendo as seguintes palavras: #{story.keywords.join(", ")}"
        }],
        temperature: 0.7,
      }
    )

    story.body = response.dig("choices", 0, "message", "content")

    if story.save
      redirect_to story
    else
      @errors = story.errors
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:age, keywords: [])
  end
end
