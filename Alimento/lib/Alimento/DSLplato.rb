class DSLplato

  attr_accessor :nombre, :plato, :dieta, :gramos

  def initialize(nombre, &block)
    @nombre=nombre
    @plato=[]
    @dieta=[]
    @gramos=[]
    @valorenergetico=[]
    @impactoambiental=[]

    if block_given?
      if block.arity == 1
        yield self
      else
       instance_eval(&block)
      end
    end
  end

  def size
    @plato.size
  end

  def ingrediente(ingrediente, options = {})
    alimento = ingrediente.get_name
    alimento <<  " (#{options[:gramos]})" if options[:gramos]

    @valorenergetico << ingrediente.get_energeticval
    @impactoambiental << ingrediente.impacto_ambiental
    @dieta << ingrediente
    @gramos << options[:gramos]
    @plato << alimento
  end

  def get_energeticval
    acc=0
    for i in 0...@valorenergetico.size
      acc+=@valorenergetico[i]
    end
    (acc).round(2)
  end

  def impacto_ambiental
    acc=0
    for i in 0...@impactoambiental.size
      acc+=@impactoambiental[i]
    end
    (acc).round(2)
  end

  def to_s
    output = @nombre
    output << " -> "
    for i in 0...@plato.size
      output << "#{@plato[i]}, "
    end
    output
  end
end
