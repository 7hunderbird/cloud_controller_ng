require 'messages/list_message'

module VCAP::CloudController
  class SpaceQuotasListMessage < ListMessage
    validates_with NoAdditionalParamsValidator

    register_allowed_keys [:guids, :names, :organization_guids, :space_guids]

    validates :guids, allow_nil: true, array: true
    validates :names, allow_nil: true, array: true
    validates :organization_guids, allow_nil: true, array: true
    validates :space_guids, allow_nil: true, array: true

    def self.from_params(params)
      super(params, %w(guids names organization_guids space_guids))
    end
  end
end
