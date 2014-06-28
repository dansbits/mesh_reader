require 'spec_helper'

describe MeshReader do

  describe 'parse' do
    subject { MeshReader.parse file_path }

    context 'with a valid file path' do
      let(:file_path) { 'spec/data/descriptor.xml' }

      it 'opens the file' do
        expect(subject).to be_a MeshReader::DescriptorList
      end
    end

    context 'with an invalid file path' do
      let(:file_path) { 'spec/data/fake_path.xml' }

      it 'opens the file' do
        expect { subject }.to raise_error
      end
    end
  end

end
