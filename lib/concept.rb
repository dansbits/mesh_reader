module MeshReader
  class Concept < MeshReader::Base

    def initialize concept_params
      @raw_concept = concept_params
    end

    def unique_identifier
      @raw_concept['ConceptUI']
    end

    def name
      @raw_concept['ConceptName']['String']
    end

    def scope_note
      @raw_concept['ScopeNote']
    end

    def preferred_concept
      @raw_concept['PreferredConceptYN'] == 'Y'
    end

    def terms
      term_list =  make_array @raw_concept['TermList']['Term']

      term_list.collect do |term|
        MeshReader::Term.new term
      end
    end
  end
end
