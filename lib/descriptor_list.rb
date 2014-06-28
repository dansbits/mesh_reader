require "mesh_reader/version"
require 'saxerator'

module MeshReader
  class DescriptorList
    include Enumerable

    def initialize file_path
      @mesh_data = Saxerator.parser(File.new(file_path))
    end

    def each
      @mesh_data.for_tag('DescriptorRecord').each do |descriptor|
        yield MeshReader::Descriptor.new descriptor
      end
    end
  end
end
