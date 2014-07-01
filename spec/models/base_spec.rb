require 'spec_helper'

describe MeshReader::Base do

  describe '#make_array' do
    let(:base) { MeshReader::Base.new( test: 'data' ) }
    subject { base.send(:make_array, collection) }

    context 'when given an array' do
      let(:collection) { Saxerator::Builder::ArrayElement.new([1,2,3]) }

      it 'returns the same array' do
        expect(subject).to eq collection
      end
    end

    context 'when given a single element' do
      let(:collection) { 'sample' }

      it 'returns an array containing the single element' do
        expect(subject).to eq Saxerator::Builder::ArrayElement.new(['sample'])
      end
    end
  end

end
