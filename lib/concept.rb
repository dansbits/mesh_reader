module MeshReader
  class Concept

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
      [*@raw_concept['TermList']['Term']].collect do |term|
        Term.new @raw_concept['TermList']['Term']
      end
    end
  end
end
