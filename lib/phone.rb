class Phone

  attr_reader(:type, :number)

  define_method(:initialize) do |attributes|
    @type = attributes[:type]
    @number = attributes[:number]
  end


end
