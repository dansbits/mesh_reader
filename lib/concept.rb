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

    def terms
      terms = []

      if @raw_concept['TermList']['Term'].class == Saxerator::Builder::HashElement
        terms.push Term.new @raw_concept['TermList']
      else
        @raw_concept['TermList']['Term'].each do |term|
          terms.push Term.new term
        end
      end

      terms
    end
  end
end
