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

    @lista=Lista.new
    @lista.insert(@leche)
    @lista.insert(@huevo)

    @lista2=Lista.new
    @lista2.insert(@nuez)
    @lista2.insert(@choco)

    @listag=Lista.new
    @listag.insert(100)
    @listag.insert(200)
    @plato_comida=Plato.new("Nombre del plato",@lista,@listag)

    @plato_comida2=Plato.new("Nombre del plato numero 2",@lista2,@listag)

    @plato_hijo=Plato_hijo.new("Nombre del plato",@lista,@listag)

  end

  it 'Obteniendo el nombre de un plato' do
    expect(@plato_comida).to respond_to(:nombre)
  end

  it 'Existe un conjunto de alimentos.' do
    expect(@plato_comida.elementos).to be > 0
  end

  it 'Existe un conjunto de cantidades de alimentos en gramos.' do
    expect(@plato_comida).to respond_to(:gramos)
  end

  it 'Porcentaje de proteınas del conjunto de alimentos.' do
    expect(@plato_comida).to respond_to(:proteinas)
    expect((@plato_comida.proteinas).round).to eq(48)
  end

  it 'Porcentaje de lípidos del conjunto de alimentos.' do
    expect(@plato_comida).to respond_to(:lipidos)
    expect((@plato_comida.lipidos).round).to eq(41)
  end

  it 'Porcentaje de carbohidratos del conjunto de alimentos.' do
    expect(@plato_comida).to respond_to(:carbohidratos)
    expect((@plato_comida.carbohidratos).round).to eq(11)
  end

  it 'Valor Calórico Total (V.C.T) del conjunto de alimentos expresado en kilocalorías.' do
    expect(@plato_comida).to respond_to(:valor_calorico)
    valorcalorico=@leche.get_energeticval+@huevo.get_energeticval*2
    expect(@plato_comida.valor_calorico).to eq(valorcalorico)
  end

  it 'Se obtiene el plato formateado.' do
    expect(@plato_comida).to respond_to(:to_s)
    expect(@plato_comida.to_s).to eq("Nombre del plato (372.0 kcal) 47.642276422764226% proteinas, 40.97560975609756% lipidos, 11.38211382113821% carbohidratos")
  end



  it 'Class Plato_hijo existe y pertenece a una jerarquía' do
    @pruebapadre=Plato.new("Nombre",@lista,@listag)
    @prueba=Plato_hijo.new("Nombre",@lista,@listag)
    expect((@pruebapadre.proteinas).round).to eq(48)
    expect((@prueba.proteinas).round).to eq(48)
  end

  it 'Valor total de la emisiones diarias de de gases de efecto invernadero.' do
    expect(@plato_hijo).to respond_to(:gei)
    expect((@plato_hijo.gei).round).to eq(12)
  end

  it 'Estimación de los metros cuadrados de uso de terreno.' do
    expect(@plato_hijo).to respond_to(:terreno)
    expect((@plato_hijo.terreno).round).to eq(20)
  end

  it 'Se obtiene la eficiencia energética formateada.' do
    expect(@plato_hijo).to respond_to(:to_s)
    expect(@plato_hijo.to_s).to eq("Eficiencia energética = 11.661442006269592")
  end

    it 'Comida<Comida2' do
      expect(@choco<@leche).to eq(false)
    end

    it 'Comida>Comida2' do
      expect(@choco>@leche).to eq(true)
    end

    it 'Comida==Comida2' do
      expect(@choco==@leche).to eq(false)
    end

    it 'Comida<=Comida2' do
      expect(@choco<=@leche).to eq(false)
    end

    it 'Comida>=Comida2' do
      expect(@choco>=@leche).to eq(true)
    end

  it 'Plato1<Plato2' do
    expect(@plato_comida<@plato_comida2).to eq(true)
  end

  it 'Plato1>Plato2' do
    expect(@plato_comida>@plato_comida2).to eq(false)
  end

  it 'Plato1==Plato2' do
    expect(@plato_comida==@plato_comida2).to eq(false)
  end

  it 'Plato1<=Plato2' do
    expect(@plato_comida<=@plato_comida2).to eq(true)
  end

  it 'Plato1=>Plato2' do
    expect(@plato_comida>=@plato_comida2).to eq(false)
  end

  it 'Lista collect' do
    expect(@lista.collect{ |nodo| nodo.get_energeticval }).to eq([61.2, 155.4])
  end

  it 'Lista select' do
    expect(@lista.select{ |nodo| nodo.get_name==="Leche de vaca" })
  end

  it 'Lista max' do
    expect(@lista.max{ |nodo| nodo.get_energeticval }).to eq(@huevo)
  end

  it 'Lista min' do
    expect(@lista.min{ |nodo| nodo.get_energeticval }).to eq(@leche)
  end

  it 'Lista sort' do
    expect(@lista.sort{ |nodo| nodo.get_energeticval }).to eq([@huevo,@leche])
  end

  it 'Comparar valoración nutricional y eficiencia energética entre platos de un menú de una dieta.' do

    @listaesp=Lista.new
    @listaesp.insert(@vaca)
    @listaesp.insert(@choco)
    @listaesp.insert(@nuez)
    @listaesp.insert(@tofu)

    @listagesp=Lista.new
    @listagesp.insert(170)
    @listagesp.insert(340)
    @listagesp.insert(170)
    @listagesp.insert(170)

    @española=Plato.new("Española",@listaesp,@listagesp)
    @españolah=Plato_hijo.new("Española",@listaesp,@listagesp)

    @listavas=Lista.new
    @listavas.insert(@vaca)
    @listavas.insert(@choco)
    @listavas.insert(@lentejas)
    @listavas.insert(@cerveza)

    @listagvas=Lista.new
    @listagvas.insert(100)
    @listagvas.insert(500)
    @listagvas.insert(200)
    @listagvas.insert(200)

    @vasca=Plato.new("Vasca",@listavas,@listagvas)
    @vascah=Plato_hijo.new("Vasca",@listavas,@listagvas)

    @listavet=Lista.new
    @listavet.insert(@choco)
    @listavet.insert(@nuez)
    @listavet.insert(@tofu)

    @listagvet=Lista.new
    @listagvet.insert(280)
    @listagvet.insert(140)
    @listagvet.insert(140)

    @vegetaliana=Plato.new("Vegetaliana",@listavet,@listagvet)
    @vegetalianah=Plato_hijo.new("Vegetaliana",@listavet,@listagvet)

    @listaveg=Lista.new
    @listaveg.insert(@huevo)
    @listaveg.insert(@leche)
    @listaveg.insert(@choco)
    @listaveg.insert(@nuez)
    @listaveg.insert(@tofu)

    @listagveg=Lista.new
    @listagveg.insert(160)
    @listagveg.insert(160)
    @listagveg.insert(320)
    @listagveg.insert(160)
    @listagveg.insert(160)

    @vegetariana=Plato.new("Vegetariana",@listaveg,@listagveg)
    @vegetarianah=Plato_hijo.new("Vegetariana",@listaveg,@listagveg)

    @listalc=Lista.new
    @listalc.insert(@vaca)
    @listalc.insert(@cordero)
    @listalc.insert(@choco)
    @listalc.insert(@nuez)
    @listalc.insert(@tofu)

    @listaglc=Lista.new
    @listaglc.insert(170)
    @listaglc.insert(340)
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(170)

    @locuraporlacarne=Plato.new("Locura por la carne",@listalc,@listaglc)
    @locuraporlacarneh=Plato_hijo.new("Locura por la carne",@listalc,@listaglc)

    vectorpapa=[@española,@vasca,@vegetaliana,@vegetariana,@locuraporlacarne]
    vector=[@españolah,@vascah,@vegetalianah,@vegetarianah,@locuraporlacarneh]

    expect(vectorpapa.collect{ |plato| (plato.valor_calorico).round(2) }).to eq([3065.95, 3170.3, 2367.68, 3052.48, 3016.31])
    expect(vectorpapa.min).to eq(@vegetaliana)
    expect(vectorpapa.max).to eq(@vasca)
    expect(vectorpapa.sort).to eq([@vegetaliana,@locuraporlacarne,@vegetariana,@española,@vasca])

    expect(vector.collect{ |plato| (plato.eficiencia_energetica).round(2) }).to eq([7.58, 12.63, 71.06, 41.66, 2.76])
    expect(vector.min).to eq(@locuraporlacarneh)
    expect(vector.max).to eq(@vegetalianah)
    expect(vector.sort).to eq([@locuraporlacarneh,@españolah,@vascah,@vegetarianah,@vegetalianah])

  end

  it 'Calculo huella nutricional' do
    expect(@plato_comida).to respond_to(:huella_nutricional)
    expect(@plato_comida.huella_nutricional).to eq(1)
  end

  it 'Nuevo calculo del maximo' do

    @listaesp=Lista.new
    @listaesp.insert(@nuez)
    @listaesp.insert(@tofu)

    @listagesp=Lista.new
    @listagesp.insert(170)
    @listagesp.insert(340)

    @tranquila=Plato.new("Tranquila",@listaesp,@listagesp)

    @listavas=Lista.new
    @listavas.insert(@vaca)
    @listavas.insert(@choco)
    @listavas.insert(@lentejas)
    @listavas.insert(@cerveza)

    @listagvas=Lista.new
    @listagvas.insert(100)
    @listagvas.insert(500)
    @listagvas.insert(200)
    @listagvas.insert(200)

    @vasca=Plato.new("Vasca",@listavas,@listagvas)

    @listalc=Lista.new
    @listalc.insert(@vaca)
    @listalc.insert(@vaca)
    @listalc.insert(@cordero)
    @listalc.insert(@cordero)
    @listalc.insert(@cordero)
    @listalc.insert(@choco)
    @listalc.insert(@nuez)
    @listalc.insert(@nuez)
    @listalc.insert(@tofu)

    @listaglc=Lista.new
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(340)
    @listaglc.insert(340)
    @listaglc.insert(340)
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(170)

    @muchacarne=Plato.new("Locura por la carne",@listalc,@listaglc)

    menu=[@tranquila,@vasca,@muchacarne]

    expect(menu.max).to eq(@muchacarne)

  end

  it 'Incrementar precio' do

    @listaesp=Lista.new
    @listaesp.insert(@nuez)
    @listaesp.insert(@tofu)

    @listagesp=Lista.new
    @listagesp.insert(170)
    @listagesp.insert(340)

    @tranquila=Plato.new("Tranquila",@listaesp,@listagesp)

    @listavas=Lista.new
    @listavas.insert(@vaca)
    @listavas.insert(@choco)
    @listavas.insert(@lentejas)
    @listavas.insert(@cerveza)

    @listagvas=Lista.new
    @listagvas.insert(100)
    @listagvas.insert(500)
    @listagvas.insert(200)
    @listagvas.insert(200)

    @vasca=Plato.new("Vasca",@listavas,@listagvas)

    @listalc=Lista.new
    @listalc.insert(@vaca)
    @listalc.insert(@vaca)
    @listalc.insert(@cordero)
    @listalc.insert(@cordero)
    @listalc.insert(@cordero)
    @listalc.insert(@choco)
    @listalc.insert(@nuez)
    @listalc.insert(@nuez)
    @listalc.insert(@tofu)

    @listaglc=Lista.new
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(340)
    @listaglc.insert(340)
    @listaglc.insert(340)
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(170)
    @listaglc.insert(170)

    @muchacarne=Plato.new("Locura por la carne",@listalc,@listaglc)

    menu=[@tranquila,@vasca,@muchacarne]
    expect(menu.collect{ |plato| (plato.huella_nutricional) }).to eq([1.5,2.0,2.5])
    preciotranquila=7*@tranquila.huella_nutricional
    preciovasca=7*@vasca.huella_nutricional
    preciocarne=7*@muchacarne.huella_nutricional
    precios=[preciotranquila,preciovasca,preciocarne]
    expect(precios).to eq([10.5,14.0,17.5])

  end

end
