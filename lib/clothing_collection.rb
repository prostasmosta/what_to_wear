require_relative 'clothing_item'

class ClothingCollection
  attr_reader :collection

  def self.from_dir(dir_path)
    collection =
      Dir[File.join(dir_path, '*.txt')].
        map { |txt_path| ClothingItem.from_txt(txt_path) }

    new(collection)
  end

  def initialize(collection)
    @collection = collection
  end

  def clothes_for_weather(degree)
    collection.
      select { |clothing_item| clothing_item.suitable_for_weather?(degree) }.
      shuffle.
      uniq(&:type)
  end
end
