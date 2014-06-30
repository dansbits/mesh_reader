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

  describe '#date_revised' do
    it { expect(descriptor.date_revised).to eq Date.strptime '2013-07-08', '%Y-%m-%d' }
  end

  describe '#date_established' do
    it { expect(descriptor.date_established).to eq Date.strptime '1984-01-01', '%Y-%m-%d' }
  end

  describe '#active_mesh_years' do
    it 'returns a list of actives years' do
      expect(descriptor.active_mesh_years).to eq [2014]
    end
  end

  describe '#history_note' do
    it { expect(descriptor.history_note).to eq '91(75); was A 23187 1975-90 (see under ANTIBIOTICS 1975-83)'}
  end

  describe '#online_note' do
    it { expect(descriptor.online_note).to eq 'use CALCIMYCIN to search A 23187 1975-90'}
  end

  describe '#public_mesh_note' do
    it { expect(descriptor.public_mesh_note).to eq '91; was A 23187 1975-90 (see under ANTIBIOTICS 1975-83)'}
  end

  describe '#previous_indexings' do
    it { expect(descriptor.previous_indexings).to eq ['Antibiotics (1973-1974)','Carboxylic Acids (1973-1974)'] }
  end

  describe '#tree_numbers' do
    it { expect(descriptor.tree_numbers).to eq ['D03.438.221.173'] }
  end

  describe '#originator' do
    it { expect(descriptor.originator).to eq 'NLM'}
  end

  describe '#maintainer' do
    it { expect(descriptor.maintainer).to eq 'SYSTEM'}
  end

  describe '#authorizer' do
    it { expect(descriptor.authorizer).to eq 'jtk'}
  end

  describe 'allowable_qualifiers' do
    it 'returns all concepts for the descriptor' do
      descriptor.allowable_qualifiers.each do |c|
        expect( c ).to be_a MeshReader::Qualifier
      end

      expect( descriptor.allowable_qualifiers.length ).to eq 28
    end
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
