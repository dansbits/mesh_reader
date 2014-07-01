module MeshReader
  class Term < MeshReader::Base

    def initialize term_params
      @raw_term = term_params
    end

    def unique_identifier
      @raw_term['TermUI']
    end

    def name
      @raw_term['String']
    end
  end

end
