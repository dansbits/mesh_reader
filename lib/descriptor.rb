module MeshReader
  class Descriptor

    def initialize descriptor_hash
      @raw_descriptor = descriptor_hash
    end

    def unique_identifier
      @raw_descriptor['DescriptorUI']
    end

    def name
      @raw_descriptor['DescriptorName']['String']
    end

    def date_created
      date = @raw_descriptor['DateCreated']
      Date.strptime "#{date['Year']}-#{date['Month']}-#{date['Day']}", '%Y-%m-%d'
    end

    def concepts
      concepts = []

      if @raw_descriptor['ConceptList']['Concept'].class == Saxerator::Builder::HashElement
        concepts.push MeshReader::Concept.new @raw_descriptor['ConceptList']['Concept']
      else
        @raw_descriptor['ConceptList']['Concept'].each do |concept|
          concepts.push MeshReader::Concept.new concept
        end
      end
      concepts
    end
  end
end
