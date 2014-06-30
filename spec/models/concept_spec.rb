require 'spec_helper'

describe MeshReader::Concept do

  let(:data_file) { File.open('spec/data/descriptor.xml') }
  let(:concept) { MeshReader::DescriptorList.new(data_file).first.concepts.first }

  describe '#new'

  describe '#unique_identifier' do
    it { expect(concept.unique_identifier).to eq 'M0000001' }
  end

  describe '#name' do
    it { expect(concept.name).to eq 'Calcimycin' }
  end

  describe '#scope_note' do
    it { expect(concept.scope_note).to eq 'An ionophorous, polyether antibiotic from Streptomyces chartreusensis. It binds and transports CALCIUM and other divalent cations across membranes and uncouples oxidative phosphorylation while inhibiting ATPase of rat liver mitochondria. The substance is used mostly as a biochemical tool to study the role of divalent cations in various biological systems.' }
  end

  describe '#preferred_concept' do
    it { expect(concept.preferred_concept).to eq true }
  end

  describe '#terms' do
    it 'returns a list of all terms for the concept' do

      concept.terms.each do |term|
        expect(term).to be_a MeshReader::Term
      end
    end
  end

end
