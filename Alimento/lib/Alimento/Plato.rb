# Platos rellenos de alimentos
# @author Óscar González García
class Plato

  include Comparable
  attr_accessor :nombre, :dieta, :gramos

  # Initialize de la clase Comida
  #
  # @param nombre Nombre del plato
  # @param lista Lista de alimentos del plato
  # @param listag Lista de gramos de los alimentos
  def initialize(nombre, dieta, gramos)
    @nombre=nombre
    @dieta=dieta
    @gramos=gramos
  end

  # Getter del tamaño del plato
  #
  # @return [Integrer] Tamaño del plato
  def elementos
    @dieta.size
  end

  # Getter del porcentaje de proteinas del plato
  #
  # @return [Float] Porcentaje de proteínas del plato
  def proteinas
    aux=@dieta.head
    auxgramos=@gramos.head
    prot=0
    cantotal=0
    for i in 0...@dieta.size
      prot+=aux.value.get_proteina*(auxgramos.value/100)
      cantotal+=(aux.value.get_proteina+aux.value.get_lipidos+aux.value.get_carbohidrato)*(auxgramos.value/100)
      aux=aux.next unless aux.next.nil?
      auxgramos=auxgramos.next unless auxgramos.next.nil?
    end
    return (prot/cantotal)*100
  end

  # Getter del porcentaje de carbohidratos del plato
  #
  # @return [Float] Porcentaje de carbohidratos del plato
  def carbohidratos
    aux=@dieta.head
    auxgramos=@gramos.head
    prot=0
    cantotal=0
    for i in 0...@dieta.size
      prot+=aux.value.get_carbohidrato*(auxgramos.value/100)
      cantotal+=(aux.value.get_proteina+aux.value.get_lipidos+aux.value.get_carbohidrato)*(auxgramos.value/100)
      aux=aux.next unless aux.next.nil?
      auxgramos=auxgramos.next unless auxgramos.next.nil?
    end
    return (prot/cantotal)*100
  end

  # Getter del porcentaje de lípidos del plato
  #
  # @return [Float] Porcentaje de lípidos del plato
  def lipidos
    aux=@dieta.head
    auxgramos=@gramos.head
    prot=0
    cantotal=0
    for i in 0...@dieta.size
      prot+=aux.value.get_lipidos*(auxgramos.value/100)
      cantotal+=(aux.value.get_proteina+aux.value.get_lipidos+aux.value.get_carbohidrato)*(auxgramos.value/100)
      aux=aux.next unless aux.next.nil?
      auxgramos=auxgramos.next unless auxgramos.next.nil?
    end
    return (prot/cantotal)*100
  end

  # Getter del valor calórico del plato
  #
  # @return [Float] Valor calórico
  def valor_calorico
    aux=@dieta.head
    auxgramos=@gramos.head
    contador=0
    for i in 0...@dieta.size
      contador+=aux.value.get_energeticval*(auxgramos.value/100.0)
      aux=aux.next unless aux.next.nil?
      auxgramos=auxgramos.next unless auxgramos.next.nil?
    end
    return contador
  end

  # Getter del índice de la huella nutricional del plato
  #
  # @return [Float] Índice de la huella nutricional
  def huella_nutricional
    aux=@dieta.head
    energia=0
    huellacarbono=0
    contador1=0
    contador2=0
    for i in 0...@dieta.size
      energia+=aux.value.get_energeticval
      huellacarbono+=aux.value.impacto_ambiental
      aux=aux.next unless aux.next.nil?
    end
    if energia<670
      contador1+=1
    elsif energia>830
      contador1+=3
    else
      contador1+=2
    end

    if huellacarbono<800
      contador2+=1
    elsif huellacarbono>1200
      contador2+=3
    else
      contador2+=2
    end
    return (contador1+contador2)/2.0
  end

  # Convierte el objeto en un formato en específico
  #
  # @return [String] El objeto formateado
  def to_s
    "#{@nombre} (#{valor_calorico} kcal) #{proteinas}% proteinas, #{lipidos}% lipidos, #{carbohidratos}% carbohidratos"
  end

  # Comparador
  #
  # @return [True, False] Huella nutricional mas grande
  def <=>(other)
    huella_nutricional <=> other.huella_nutricional
  end

end

# Platos hijo de alimentos
# @author Óscar González García
class Plato_hijo < Plato

  # Initialize de la clase Comida
  #
  # @param nombre Nombre del plato
  # @param lista Lista de alimentos del plato
  # @param listag Lista de gramos de los alimentos
  def initialize(nombre,lista,listag)
    super(nombre,lista,listag)
  end

  # Getter del porcentaje de gases de efecto invernadero del plato
  #
  # @return [Float] Porcentaje de gases de efecto invernadero del plato
  def gei
    aux=@dieta.head
    auxgramos=@gramos.head
    contador=0
    for i in 0...@dieta.size
      contador+=aux.value.get_gei*(auxgramos.value/100.0)
      aux=aux.next unless aux.next.nil?
      auxgramos=auxgramos.next unless auxgramos.next.nil?
    end
    return contador
  end

  # Getter del terreno del plato
  #
  # @return [Float] Porcentaje de terreno del plato
  def terreno
    aux=@dieta.head
    auxgramos=@gramos.head
    contador=0
    for i in 0...@dieta.size
      contador+=aux.value.get_terreno*(auxgramos.value/100.0)
      aux=aux.next unless aux.next.nil?
      auxgramos=auxgramos.next unless auxgramos.next.nil?
    end
    return contador
  end

  # Getter de la eficiencia energética del plato
  #
  # @return [Float] Eficiencia energética del plato
  def eficiencia_energetica
    valor_calorico/(gei+terreno)
  end

  # Convierte el objeto en un formato en específico
  #
  # @return [String] El objeto formateado
  def to_s
    "Eficiencia energética = #{eficiencia_energetica}"
  end

  # Comparador
  #
  # @return [True, False] Valor energético mas grande
  def <=>(other)
    eficiencia_energetica <=> other.eficiencia_energetica
  end

end
