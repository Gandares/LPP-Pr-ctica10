RSpec.describe Alimento do

  before (:all) do

    vaca=Comida.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
    cordero=Comida.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
    camarones=Comida.new("Camarones",17.6,1.5,0.6,18.0,2.0)
    choco=Comida.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
    salmon=Comida.new("Salmón",19.9,0.0,13.6,6.0,3.7)
    cerdo=Comida.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
    pollo=Comida.new("Pollo",20.6,0.0,5.6,5.7,7.1)
    queso=Comida.new("Queso",25.0,1.3,33.0,11.0,41.0)
    cerveza=Comida.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
    leche=Comida.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
    huevo=Comida.new("Huevos",13.0,1.1,11.0,4.2,5.7)
    cafe=Comida.new("Café",0.1,0.0,0.0,0.4,3.4)
    tofu=Comida.new("Tofu",8.0,1.9,4.8,2.0,2.2)
    lentejas=Comida.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
    nuez=Comida.new("Nuez",20.0,21.0,54.0,0.3,7.9)

    @plato=DSLplato.new("Plato de prueba") do
      ingrediente pollo, :gramos => 100
      ingrediente huevo, :gramos => 100
    end

    entrante=DSLplato.new("Nueces") do
      ingrediente nuez, :gramos => 50
    end

    platoprincipal=DSLplato.new("Carne de vaca con queso") do
      ingrediente vaca, :gramos => 150
      ingrediente queso, :gramos => 50
    end

    bebida=DSLplato.new("Cerveza") do
      ingrediente cerveza, :gramos => 30
    end

    postre=DSLplato.new("cafe con leche") do
      ingrediente cafe, :gramos => 15
      ingrediente leche, :gramos => 15
    end

    @menu=DSLmenu.new("Menu casual con entrante, plato principal, bebida, postre") do
      componente entrante, :precio => 0.7
      componente platoprincipal, :precio => 5
      componente bebida, :precio => 1
      componente postre, :precio => 1.5
    end
    #     puts entrante.get_energeticval
    #     puts entrante.impacto_ambiental
    #     puts platoprincipal.get_energeticval
    #     puts platoprincipal.impacto_ambiental
    #     puts bebida.get_energeticval
    #     puts bebida.impacto_ambiental
    #     puts postre.get_energeticval
    #     puts postre.impacto_ambiental
  end

  it 'Plato en formato DSL' do
    expect(@plato).to respond_to(:size)
    expect(@plato.size).to eq(2)
  end

  it 'Plato DSL bien formateado' do
    expect(@plato.to_s).to eq("Plato de prueba -> Pollo (100), Huevos (100), ")
  end

  it 'Menú en formato DSL' do
    expect(@menu).to respond_to(:size)
    expect(@menu.size).to eq(4)
  end

  it 'Menu DSL bien formateado' do
    expect(@menu.to_s).to eq("Menu casual con entrante, plato principal, bebida, postre -> Nueces (0.7€), Con un valor energético de 650.0 e impacto ambiental de 8.2, Carne de vaca con queso (5€), Con un valor energético de 514.5 e impacto ambiental de 266.0, Cerveza (1€), Con un valor energético de 16.4 e impacto ambiental de 0.46, cafe con leche (1.5€), Con un valor energético de 61.6 e impacto ambiental de 15.9, Precio total: 8.2€")
  end

end
