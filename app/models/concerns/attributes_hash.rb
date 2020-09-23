module AttributesHash
  extend ActiveSupport::Concern

  class_methods do
    def attributes(*args)
      @attrs = args
    end

    def attrs
      @attrs
    end
  end

  included do
    def attributes
      self.class.attrs.index_with { |key| public_send(key) }
    end
  end
end
