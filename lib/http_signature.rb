require "http_signature/version"

module HTTPSignature
  class Key
    def self.load(path)
      new(File.read(path))
    end

    def initialize(private_key)
      
    end
  end
end
