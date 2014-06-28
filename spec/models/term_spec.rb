require 'spec_helper'

describe MeshReader::Term do

  let(:data_file) { File.open('spec/data/descriptor.xml') }
  let(:xml) { Saxerator.parser(data_file) }
  let(:params) { xml.for_tag('Term').first }
  let(:term) { MeshReader::Term.new params }

  describe 'unique_identifier' do
    it { expect(term.unique_identifier).to eq 'T000002' }
  end

  describe 'name' do
    it { expect(term.name).to eq 'Calcimycin' }
  end

end
