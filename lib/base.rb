module MeshReader
  class Base

    def initialize raw_data
      @raw_data = raw_data
    end

    def make_array collection
      collection.class == Saxerator::Builder::ArrayElement ? collection : Saxerator::Builder::ArrayElement.new([collection])
    end
  end
end
