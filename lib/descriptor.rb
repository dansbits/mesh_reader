module MeshReader
  class Descriptor < MeshReader::Base

    def initialize descriptor_hash
      @raw_descriptor = descriptor_hash
    end

    def active_mesh_years
      years = make_array @raw_descriptor['ActiveMeSHYearList']['Year']

      years.collect { |y| y.to_i }
    end

    def allowable_qualifiers
      qualifiers = make_array @raw_descriptor['AllowableQualifiersList']['AllowableQualifier']

      qualifiers.collect do |qualifier|
        MeshReader::Qualifier.new qualifier
      end
    end

    def authorizer
      @raw_descriptor['RecordOriginatorsList']['RecordAuthorizer']
    end

    def concepts
      concept_list = make_array @raw_descriptor['ConceptList']['Concept']

      concept_list.collect do |c|
        MeshReader::Concept.new c
      end
    end

    def date_created
      date = @raw_descriptor['DateCreated']
      Date.strptime "#{date['Year']}-#{date['Month']}-#{date['Day']}", '%Y-%m-%d'
    end

    def date_revised
      date = @raw_descriptor['DateRevised']
      Date.strptime "#{date['Year']}-#{date['Month']}-#{date['Day']}", '%Y-%m-%d'
    end

    def date_established
      date = @raw_descriptor['DateEstablished']
      Date.strptime "#{date['Year']}-#{date['Month']}-#{date['Day']}", '%Y-%m-%d'
    end

    def history_note
      @raw_descriptor['HistoryNote']
    end

    def maintainer
      @raw_descriptor['RecordOriginatorsList']['RecordMaintainer']
    end

    def name
      @raw_descriptor['DescriptorName']['String']
    end

    def online_note
      @raw_descriptor['OnlineNote']
    end

    def originator
      @raw_descriptor['RecordOriginatorsList']['RecordOriginator']
    end

    def previous_indexings
      [*@raw_descriptor['PreviousIndexingList']['PreviousIndexing']]
    end

    def public_mesh_note
      @raw_descriptor['PublicMeSHNote']
    end

    def tree_numbers
      make_array @raw_descriptor['TreeNumberList']['TreeNumber']
    end

    def unique_identifier
      @raw_descriptor['DescriptorUI']
    end
  end
end
