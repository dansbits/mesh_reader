require 'descriptor'
require 'descriptor_list'
require 'concept'
require 'term'

module MeshReader
  extend self

  # Attempts to open the specified XML file and returns a DescriptorList
  # object for retrieval of MeSH data.do
  #
  # @param file_path [String] The path to the MeSH xml file
  # @return [DescriptorList] A DescriptorList containing the MeSH terms in the
  # specified file
  def parse file_path
    xml = File.open(file_path)

    DescriptorList.new(xml)
  end

end
