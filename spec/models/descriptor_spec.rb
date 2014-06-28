require 'spec_helper'

describe MeshReader::Descriptor do

  let(:data_file) { File.open('spec/data/descriptor.xml') }
  let(:xml) { Saxerator.parser(data_file) }
  let(:params) { xml.for_tag('DescriptorRecord').first }
  let(:descriptor) { MeshReader::Descriptor.new params }

  describe '#new' do

  end

  describe '#unique_identifier' do
    it { expect(descriptor.unique_identifier).to eq 'D000001' }
  end

  describe '#name' do
    it { expect(descriptor.name).to eq 'Calcimycin' }
  end

  describe '#date_created' do
    it { expect(descriptor.date_created).to eq Date.strptime '1974-11-19', '%Y-%m-%d' }
  end

  describe '#concepts' do
    it 'returns all concepts for the descriptor' do
      descriptor.concepts.each do |c|
        expect( c ).to be_a MeshReader::Concept
      end

      expect( descriptor.concepts.length ).to eq 2
    end
  end
end
