# Calcula distintos campos de un alimento
# @author Óscar González García
class Comida

  include Comparable
  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

  # Initialize de la clase Comida
  #
  # @param nombre Nombre del alimento
  # @param proteinas Proteinas del alimento
  # @param carbohidratos Carbohidratos del alimento
  # @param lipidos Lipidos del alimento
  # @param gei Gases de efecto invernadero del alimento
  # @param terreno Terreno del alimento
  def initialize(nombre,proteinas,carbohidratos,lipidos,gei,terreno)
    @nombre=nombre
    @proteinas=proteinas
    @carbohidratos=carbohidratos
    @lipidos=lipidos
    @gei=gei
    @terreno=terreno
  end

  # Getter de nombre
  #
  # @return [String] Nombre
  def get_name
    @nombre
  end

  # Getter de proteínas
  #
  # @return [Float] Proteínas
  def get_proteina
    @proteinas
  end

  # Getter de carbohidratos
  #
  # @return [Float] Carbohidratos
  def get_carbohidrato
    @carbohidratos
  end

  # Getter de lípidos
  #
  # @return [Float] Lípidos
  def get_lipidos
    @lipidos
  end

  # Getter de gases de efecto invernadero
  #
  # @return [Float] Gases de efecto invernadero
  def get_gei
    @gei
  end

  # Getter de terreno
  #
  # @return [Float] Terreno
  def get_terreno
    @terreno
  end

  # Convierte el objeto en un formato en específico
  #
  # @return [String] El objeto formateado
  def to_s
    "#{@nombre}(#{(get_energeticval).round(2)})"
  end

  # Getter del valor energético
  #
  # @return [Float] Valor energético
  def get_energeticval
    return @proteinas*4+@carbohidratos*4+@lipidos*9
  end

  # Getter de l impacto ambiental
  #
  # @return [Float] Impacto ambiental
  def impacto_ambiental
    return @terreno+@gei
  end

  # Comparador
  #
  # @return [True, False] Valor energético mas grande
  def <=>(other)
    get_energeticval <=> other.get_energeticval
  end

end

#vaca=Comida.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
# cordero=Comida.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
# camarones=Comida.new("Camarones",17.6,1.5,0.6,18.0,2.0)
# choco=Comida.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
# salmon=Comida.new("Salmón",19.9,0.0,13.6,6.0,3.7)
# cerdo=Comida.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
# pollo=Comida.new("Pollo",20.6,0.0,5.6,5.7,7.1)
# queso=Comida.new("Queso",25.0,1.3,33.0,11.0,41.0)
# cerveza=Comida.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
# leche=Comida.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
# huevo=Comida.new("Huevos",13.0,1.1,11.0,4.2,5.7)
# cafe=Comida.new("Café",0.1,0.0,0.0,0.4,3.4)
# tofu=Comida.new("Tofu",8.0,1.9,4.8,2.0,2.2)
# lentejas=Comida.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
# nuez=Comida.new("Nuez",20.0,21.0,54.0,0.3,7.9)
#
# print "Hombre: ", choco.to_s, "*6 + ", camarones.to_s, " + ", leche.to_s, " + ", cerveza.to_s, "*2 + ", cafe.to_s, "*3 = ", choco.get_energeticval*6+camarones.get_energeticval+leche.get_energeticval+cerveza.get_energeticval*2+cafe.get_energeticval*3, "\n"
# print "Mujer: ", choco.to_s, "*4 + ", huevo.to_s, " + ", leche.to_s, "*2 + ",cafe.to_s, "*2 = ",choco.get_energeticval*4+huevo.get_energeticval+leche.get_energeticval*2+cafe.get_energeticval*2
