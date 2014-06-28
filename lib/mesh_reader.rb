module MeshReader
  extend self

  def parse file_path
    xml = File.open(file_path)

    DescriptorList.new(xml)
  end

end
