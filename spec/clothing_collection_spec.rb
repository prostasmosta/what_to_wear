require 'clothing_collection'

describe ClothingCollection do
  let(:collection) do
    [
      ClothingItem.new(name: 'Джинсы', type: 'Штаны', temp_range: -5..15),
      ClothingItem.new(name: 'Пальто', type: 'Верхняя одежда', temp_range: -10..5),
      ClothingItem.new(name: 'Штаны с начесом', type: 'Штаны', temp_range: -25..0),
    ]
  end

  let(:clothing_collection) { described_class.new(collection) }

  describe '::from_dir' do
    let(:clothing_collection_from_dir) do
      described_class.from_dir("#{__dir__}/fixtures/")
    end

    it "returns instance of #{described_class}" do
      expect(clothing_collection_from_dir).to be_a ClothingCollection
    end

    it 'should read all files from dir' do
      expect(clothing_collection_from_dir.collection.size).to eq 2
    end

    it 'should create collection from dir' do
      expect(clothing_collection_from_dir.collection).to all be_a ClothingItem
    end

    it 'should read files correctly' do
      expect(clothing_collection_from_dir.collection).
        to contain_exactly(
             an_object_having_attributes(name: 'Джинсы', type: 'Штаны', temp_range: -5..15),
             an_object_having_attributes(name: 'Штаны с начесом', type: 'Штаны', temp_range: -25..0)
           )
    end
  end

  describe '::new' do
    it 'assigns instance varaible' do
      expect(clothing_collection.collection).to eq collection
    end
  end

  describe '#clothes_for_weather' do
    context 'when clothes for given temp exists' do
      it 'should return suitable clothes' do
        expect(clothing_collection.clothes_for_weather(-5).size).to eq 2
        expect(clothing_collection.clothes_for_weather(-5).map(&:type)).to match_array ['Штаны', 'Верхняя одежда']
      end
    end

    context 'when clothes for given temp do not exist' do
      it 'should return empty array' do
        expect(clothing_collection.clothes_for_weather(-40)).to be_an(Array).and be_empty
      end
    end
  end
end
