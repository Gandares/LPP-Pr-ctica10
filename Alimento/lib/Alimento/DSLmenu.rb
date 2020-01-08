class DSLmenu

  attr_accessor :nombre, :menu

  def initialize(descripcion, &block)
    @descripcion=descripcion
    @menu=[]
    @precios=[]
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
    @menu.size
  end

  def componente(plato, options = {})
    componente = plato.nombre
    componente <<  " (#{options[:precio]}€)" if options[:precio]

    @valorenergetico << plato.get_energeticval
    @impactoambiental << plato.impacto_ambiental
    @precios << options[:precio]
    @menu << componente
  end

  def to_s
    output = @descripcion
    output << " -> "
    acc=0
    for i in 0...@menu.size
      output << "#{@menu[i]}, Con un valor energético de #{(@valorenergetico[i]).round(2)} e impacto ambiental de #{(@impactoambiental[i]).round(2)}, "
      acc+=@precios[i]
    end
    output << "Precio total: #{acc}€"
    output
  end

end
