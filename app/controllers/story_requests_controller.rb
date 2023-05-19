class StoryRequestsController < ApplicationController
  def new
    @story_request = StoryRequest.new
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
    @story_request = StoryRequest.new(story_request_params)

    if @story_request.save
      redirect_to @story_request
    else
      render :new
    end
  end

  def show
    @story_request = StoryRequest.find(params[:id])
    redirect_to @story_request.story if @story_request.story.present?
  end

  private

  def story_request_params
    params.require(:story_request).permit(:age, keywords: [])
  end
end
