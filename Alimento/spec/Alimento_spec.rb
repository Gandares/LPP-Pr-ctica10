RSpec.describe Alimento do

  before (:all) do

    @vaca=Comida.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
    @cordero=Comida.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
    @camarones=Comida.new("Camarones",17.6,1.5,0.6,18.0,2.0)
    @choco=Comida.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
    @salmon=Comida.new("Salmón",19.9,0.0,13.6,6.0,3.7)
    @cerdo=Comida.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
    @pollo=Comida.new("Pollo",20.6,0.0,5.6,5.7,7.1)
    @queso=Comida.new("Queso",25.0,1.3,33.0,11.0,41.0)
    @cerveza=Comida.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
    @leche=Comida.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
    @huevo=Comida.new("Huevos",13.0,1.1,11.0,4.2,5.7)
    @cafe=Comida.new("Café",0.1,0.0,0.0,0.4,3.4)
    @tofu=Comida.new("Tofu",8.0,1.9,4.8,2.0,2.2)
    @lentejas=Comida.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
    @nuez=Comida.new("Nuez",20.0,21.0,54.0,0.3,7.9)

  end

  it 'Debe existir un nombre para el alimento.' do
    expect(@choco.nombre).not_to be nil
  end

  it 'Debe existir la candidad de emision de gases de efecto invernadero en kgCO2eq' do
    expect(@choco.gei).not_to be nil
  end

  it 'Debe existir la candidad de terreno utilizado en m²año.' do
    expect(@choco.terreno).not_to be nil
  end

  it 'Existe un metodo para obtener el nombre del alimento.' do
    expect(@choco).to respond_to(:get_name)
  end

  it 'Existe un metodo para obtener las emisiones de gases de efecto invernadero.' do
    expect(@choco).to respond_to(:get_gei)
  end

  it 'Existe un metodo para obtener el terreno utilizado.' do
    expect(@choco).to respond_to(:get_terreno)
  end

  it 'Existe un metodo para obtener el alimento formateado.' do
    expect(@choco).to respond_to(:to_s)
  end

  it 'Existe un metodo para obtener el valor energetico de un alimento.' do
    expect(@choco).to respond_to(:get_energeticval)
  end

  it 'Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 anos.' do
    expect(@choco.get_energeticval*6+@camarones.get_energeticval+@leche.get_energeticval+@cerveza.get_energeticval*2+@cafe.get_energeticval*3).to be >= 3000
    expect((@choco.get_proteina*6+@camarones.get_proteina+@leche.get_proteina+@cerveza.get_proteina*2+@cafe.get_proteina*3).round).to eq(54)
    expect((@choco.impacto_ambiental*6+@camarones.impacto_ambiental+@leche.impacto_ambiental+@cerveza.impacto_ambiental*2+@cafe.impacto_ambiental*3).round).to eq(79)
  end

  it 'Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 anos.' do
    expect(@choco.get_energeticval*4+@huevo.get_energeticval+@leche.get_energeticval*2+@cafe.get_energeticval*2).to be <= 2300
    expect((@choco.get_proteina*4+@huevo.get_proteina+@leche.get_proteina*2+@cafe.get_proteina*2).round).to eq(41)
    expect((@choco.impacto_ambiental*4+@huevo.impacto_ambiental+@leche.impacto_ambiental*2+@cafe.impacto_ambiental*2).round).to eq(65)
  end

################################################ Clase Lista ####################################################

  before (:each) do

    @lista=Lista.new

  end

  it 'Clase Lista' do
    #Para separar en la visualización del spec
  end

  it 'Debe existir un Nodo de la lista con sus datos, su siguiente y su previo' do
    nodo=Nodo.new
    nodo.value=1
    nodo.next=1
    nodo.prev=1
    expect(nodo.value).not_to be nil
    expect(nodo.next).not_to be nil
    expect(nodo.prev).not_to be nil
  end

  it 'Debe existir una Lista con su cabeza y su cola' do
    expect(@lista).to respond_to(:head)
    expect(@lista).to respond_to(:tail)
  end

  it 'Se puede insertar un elemento en la Lista' do
    expect(@lista).to respond_to(:insert)
  end

  it 'Se pueden insertar varios elementos en la Lista' do
    @lista.insert(2)
    @lista.insert(3)
    @lista.insert(4)
    expect(@lista.size).to eq(3)
  end

  it 'Se extrae el primer elemento de la Lista' do
    expect(@lista).to respond_to(:pop_front)
    @lista.insert(3)
    @lista.insert(4)
    @lista.pop_front
    expect(@lista.head.value).to eq(4)
    expect(@lista.tail.value).to eq(4)

  end

  it 'Se extrae el ́ultimo elemento de la Lista' do
    expect(@lista).to respond_to(:pop_back)
    @lista.insert(3)
    @lista.insert(4)
    @lista.pop_back
    expect(@lista.head.value).to eq(3)
    expect(@lista.tail.value).to eq(3)
  end

  it 'Crear expectativas para estimar las emisiones diarias de gases de efecto invernadero para cada dieta.' do
    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.7*@lista.pop_front.get_gei)
    end
    expect(dieta).to eq(96.73)         #Española chicos

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.3*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(73.97)    #Española chicas

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    dieta=0
    while @lista.size>0 do
      dieta+=(@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(62.78)    #Vasca chicos

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    dieta=0
    while @lista.size>0 do
      dieta+=(@lista.pop_front.get_gei/1.3)
    end
    expect((dieta).round(2)).to eq(48.29)    #Vasca chicas

    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.8*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(12.42)    #Vegetaliana chicos

    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.4*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(9.66)    #Vegetaliana chicas

    @lista.insert(@huevo)
    @lista.insert(@leche)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.6*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(22.88)    #Vegetariana chicos

    @lista.insert(@huevo)
    @lista.insert(@leche)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.4*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(20.02)    #Vegetariana chicas

    @lista.insert(@vaca)
    @lista.insert(@cordero)
    @lista.insert(@cordero)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.7*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(160.82)    #Locura por la carne chicos

    @lista.insert(@vaca)
    @lista.insert(@cordero)
    @lista.insert(@cordero)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.3*@lista.pop_front.get_gei)
    end
    expect((dieta).round(2)).to eq(122.98)    #Locura por la carne chicas

  end

  it 'Crear expectativa para estimar las emisiones anuales de gases de efecto invernadero paracada dieta.' do
    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.7*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(35306.45)         #Española chicos

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.3*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(26999.05)    #Española chicas

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    dieta=0
    while @lista.size>0 do
      dieta+=(@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(22914.7)    #Vasca chicos

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    dieta=0
    while @lista.size>0 do
      dieta+=(@lista.pop_front.get_gei/1.3)
    end
    expect((365*dieta).round(2)).to eq(17626.69)    #Vasca chicas

    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.8*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(4533.3)    #Vegetaliana chicos

    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.4*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(3525.9)    #Vegetaliana chicas

    @lista.insert(@huevo)
    @lista.insert(@leche)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.6*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(8351.2)    #Vegetariana chicos

    @lista.insert(@huevo)
    @lista.insert(@leche)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.4*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(7307.3)    #Vegetariana chicas

    @lista.insert(@vaca)
    @lista.insert(@cordero)
    @lista.insert(@cordero)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.7*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(58699.3)    #Locura por la carne chicos

    @lista.insert(@vaca)
    @lista.insert(@cordero)
    @lista.insert(@cordero)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.3*@lista.pop_front.get_gei)
    end
    expect((365*dieta).round(2)).to eq(44887.7)    #Locura por la carne chicas

  end

  it 'Crear expectitivas para estimar los metros cuadrados de uso de terreno para cada dieta.' do
    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.7*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(307.53)         #Española chicos

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.3*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(235.17)    #Española chicas

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    dieta=0
    while @lista.size>0 do
      dieta+=(@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(188.24)    #Vasca chicos

    @lista.insert(@vaca)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@cerveza)
    @lista.insert(@choco)
    @lista.insert(@lentejas)
    @lista.insert(@choco)
    dieta=0
    while @lista.size>0 do
      dieta+=(@lista.pop_front.get_terreno/1.3)
    end
    expect((dieta).round(2)).to eq(144.8)    #Vasca chicas

    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.8*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(30.42)    #Vegetaliana chicos

    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.4*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(23.66)    #Vegetaliana chicas

    @lista.insert(@huevo)
    @lista.insert(@leche)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.6*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(50.4)    #Vegetariana chicos

    @lista.insert(@huevo)
    @lista.insert(@leche)
    @lista.insert(@choco)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.4*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(44.1)    #Vegetariana chicas

    @lista.insert(@vaca)
    @lista.insert(@cordero)
    @lista.insert(@cordero)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.7*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(930.75)    #Locura por la carne chicos

    @lista.insert(@vaca)
    @lista.insert(@cordero)
    @lista.insert(@cordero)
    @lista.insert(@choco)
    @lista.insert(@nuez)
    @lista.insert(@tofu)
    dieta=0
    while @lista.size>0 do
      dieta+=(1.3*@lista.pop_front.get_terreno)
    end
    expect((dieta).round(2)).to eq(711.75)    #Locura por la carne chicas

  end
end
