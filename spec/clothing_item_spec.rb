require 'clothing_item'

describe ClothingItem do
  let(:clothing_item) do
    described_class.new(name: 'Джинсы', type: 'Штаны', temp_range: -5..15)
  end

  describe '::from_txt' do
    let(:clothing_item_from_txt) do
      described_class.from_txt("#{__dir__}/fixtures/jeans.txt")
    end

    it "returns instance of #{described_class}" do
      expect(clothing_item_from_txt).to be_a ClothingItem
    end

    it 'parses file correctly' do
      expect(clothing_item_from_txt).to have_attributes(name: 'Джинсы', type: 'Штаны', temp_range: -5..15)
    end
  end

  describe '::new' do
    it 'assigns instance varaibles' do
    expect(clothing_item).to have_attributes(name: 'Джинсы', type: 'Штаны', temp_range: -5..15)
    end
  end

  describe '#suitable_for_weather?' do
    context 'when item suits for given temp' do
      it 'return true' do
        expect(clothing_item.suitable_for_weather?(-2)).to be true
      end
    end

    context 'when item doesnt suit for given temp' do
      it 'return false' do
        expect(clothing_item.suitable_for_weather?(-10)).to be false
      end
    end
  end

  describe '#to_s' do
    it 'returns correctly written clothing item' do
      expect(clothing_item.to_s).to eq 'Джинсы (Штаны) -5..15'
    end
  end
end
