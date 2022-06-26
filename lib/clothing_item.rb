class ClothingItem
  attr_reader :name, :type, :temp_range

  class << self
    def from_txt(file_path)
      lines = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

      new(name: lines[0], type: lines[1], temp_range: parse_range(lines[2]))
    end

    private

    def parse_range(line)
      Range.new(*line.scan(/-?\d+/).map(&:to_i))
    end
  end

  def initialize(args)
    @name = args[:name]
    @type = args[:type]
    @temp_range = args[:temp_range]
  end

  def suitable_for_weather?(degree)
    temp_range.include?(degree)
  end

  def to_s
    "#{name} (#{type}) #{temp_range}"
  end
end
