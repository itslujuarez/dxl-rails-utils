# frozen_string_literal: true

module DXL
  module Schemas
    class RelationshipsBuilder
      def initialize(serializer, relationships: )
        @serializer = serializer
        @relationships = relationships
      end

      def call
        data
      end

      private

      def data
        @relationships.each_with_object({}) do |key, hash|
          relationship_value = @serializer.relationships_to_serialize[key]
          hash[relationship_value.key] = {
            type: :object,
            properties: {
              data: item_data(relationship_value)
            }
          }
        end
      end

      def item_data(relationship_value)
        return single_item_data(relationship_value) if relationship_value.relationship_type == :belongs_to
        array_item_data(relationship_value)

      end

      def single_item_data(relationship_value)
        {
          type: :object,
          nullable: true,
          properties: {
            id: { type: :string, default: '0' },
            type: { type: :string, default: relationship_value.key }
          }
        }
      end

      def array_item_data(relationship_value)
        {
          type: :array,
          items: single_item_data(relationship_value)
        }
      end
    end
  end
end
