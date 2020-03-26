module VCAP::CloudController
  class FieldServiceInstanceBrokerDecorator
    def self.allowed
      Set['name', 'guid']
    end

    def self.match?(fields)
      fields.is_a?(Hash) && fields[:'service_plan.service_offering.service_broker']&.to_set&.intersect?(self.allowed)
    end

    def initialize(fields)
      @fields = fields[:'service_plan.service_offering.service_broker'].to_set.intersection(self.class.allowed)
    end

    def decorate(hash, service_instances)
      hash[:included] ||= {}
      plans = service_instances.map(&:service_plan).uniq
      offerings = plans.map(&:service).uniq
      brokers = plans.map(&:service_broker).uniq

      hash[:included][:service_brokers] = brokers.sort_by(&:created_at).map do |broker|
        broker_view = {}
        broker_view[:name] = broker.name if @fields.include?('name')
        broker_view[:guid] = broker.guid if @fields.include?('guid')
        broker_view
      end

      hash
    end
  end
end