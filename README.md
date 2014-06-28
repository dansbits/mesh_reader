# MeshReader

MeshReader is a ruby gem designed to easily import and use the MeSH terminology.

MeSH is a controlled vocabulary maintained by the National Institute of Health which can be used to enable semantically relevant tagging and search of data. More information on MeSH can be found on the NIH website (http://www.nlm.nih.gov/pubs/factsheets/mesh.html).

## Installation

Add this line to your application's Gemfile:

    gem 'mesh_reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mesh_reader

## Usage

MeshReader can be easily used in the following manner:

    descriptors = MeshReader.parse('/path/to/mesh/xml')
    
    descriptors.each do |d|
        puts descriptor.unique_identifier
        puts descriptor.name
    end

## Contributing

1. Fork it ( https://github.com/carp47/mesh_reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
