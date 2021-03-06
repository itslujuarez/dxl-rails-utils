# frozen_string_literal: true

module DXL
  module Schemas
    class Builder
      def initialize(serializer, klass, relationships: nil)
        @serializer = serializer
        @klass = klass
        @relationships = relationships || @serializer.relationships_to_serialize&.map { |k, _| k } || []
      end

      def call
        {
          type: :object,
          properties: {
            data: data
          }.tap do |whitelist|
            whitelist[:included] = included if @relationships.present?
          end
        }
      end

      private

      def data
        ::DXL::Schemas::AttributesBuilder.new(@serializer, @klass, relationships: @relationships).call
      end

      def included
        ::DXL::Schemas::IncludedBuilder.new(@serializer, @relationships).call
      end
    end
  end
end
