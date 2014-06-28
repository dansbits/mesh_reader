require 'spec_helper'

describe MeshReader::DescriptorList do

  describe '#each' do
    let(:file_path) { 'spec/data/descriptor.xml' }
    let(:reader) { MeshReader::DescriptorList.new file_path }

    it 'iterates over each item in the xml data' do
      count = 0;

      reader.each do |d|
        count += 1
      end

      expect(count).to eq 1
    end

    it 'iterates over a list of Descriptors' do
      reader.each do |d|
        expect(d).to be_a MeshReader::Descriptor
      end
    end
  end
end
