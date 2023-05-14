class StoriesController < ApplicationController
  def new
    @story = Story.new
    @keywords = [
      ["🕷️", "Aranha"],
      ["🐋", "Baleia"],
      ["🐇", "Coelho"],
      ["🐘", "Elefante"],
      ["🐜", "Formiga"],
      ["🦍", "Gorila"],
      ["🦛", "Hipopótamo"],
      ["🐊", "Jacaré"],
      ["🦁", "Leão"],
      ["🐒", "Macaco"],
      ["🐆", "Onça"],
      ["🦆", "Pato"],
      ["🐀", "Rato"],
      ["🐸", "Sapo"],
      ["🐢", "Tartaruga"],
      ["🐻", "Urso"],
      ["🐄", "Vaca"],
      ["🦓", "Zebra"],
      ["💙", "Coração azul"],
      ["🥶", "Congelado"],
      ["😂", "Divertido"],
      ["🔥", "Fogo"],
      ["❤️", "Amor"],
      ["🎪", "Circo"],
      ["🧊", "Gelo"],
      ["🤥", "Mentiroso"],
      ["👃", "Nariz"],
      ["✈️", "Avião"],
      ["🤫", "Silencioso"],
      ["🦉", "Coruja"],
      ["🍌", "Banana"],
      ["🦄", "Unicornio"],
      ["🏃‍♂️", "Correr"],
      ["😠", "Zangado"],
      ["🍍", "Abacaxi"],
      ["🍰", "Bolo"],
      ["🍫", "Chocolate"],
      ["🍨", "Sorvete"],
      ["🍚", "Arroz"],
      ["⚽", "Futebol"],
      ["🐐", "Cabra"],
      ["🐑", "Ovelha"],
      ["🥛", "Leite"],
      ["🍉", "Melancia"],
      ["🍝", "Macarrão"],
      ["🥚", "Ovo"],
      ["🥒", "Pepino"],
      ["🧀", "Queijo"],
      ["🥦", "Brócolis"],
      ["🥗", "Salada"],
      ["🚴", "Andar de bicicleta"],
      ["🍇", "Uva"],
      ["🏓", "Ping pong"],
      ["⛸️", "Patinação no gelo"],
      ["🎣", "Pescar"],
      ["🎨", "Desenhar"],
      ["🎤", "Cantar"],
      ["🎸", "Tocar guitarra"],
      ["🥁", "Tocar bateria"],
      ["⛰️", "Montanha"],
      ["🌋", "Vulcão"],
      ["🏕️", "Acampar"],
      ["🏖️", "Praia"],
      ["🏠", "Casa"],
      ["🏰", "Castelo"],
      ["🚂", "Trem"],
      ["🚑", "Ambulância"],
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
