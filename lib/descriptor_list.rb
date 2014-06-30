require "mesh_reader/version"
require 'saxerator'

module MeshReader
  class DescriptorList
    include Enumerable

    def initialize file
      @mesh_data = Saxerator.parser(file) do |config|
        config.put_attributes_in_hash!
      end
    end

    def each
      @mesh_data.for_tag('DescriptorRecord').each do |descriptor|
        yield MeshReader::Descriptor.new descriptor
      end
    end
  end
end
