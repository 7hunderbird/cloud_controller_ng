require 'spec_helper'
require 'request_spec_shared_examples'
require 'models/services/service_plan'
require 'hashdiff'

ADDITIONAL_ROLES = %w[unauthenticated].freeze
COMPLETE_PERMISSIONS = (ALL_PERMISSIONS + ADDITIONAL_ROLES).freeze

RSpec.describe 'V3 service plans' do
  let(:user) { VCAP::CloudController::User.make }
  let(:org) { VCAP::CloudController::Organization.make }
  let(:space) { VCAP::CloudController::Space.make(organization: org) }

  describe 'GET /v3/service_plans/:guid' do
    let(:api_call) { lambda { |user_headers| get "/v3/service_plans/#{guid}", nil, user_headers } }

    context 'when there is no service plan' do
      let(:guid) { 'no-such-plan' }

      let(:expected_codes_and_responses) do
        Hash.new(code: 404)
      end

      it_behaves_like 'permissions for single object endpoint', COMPLETE_PERMISSIONS
    end

    context 'when there is a public service plan' do
      let!(:service_plan) { VCAP::CloudController::ServicePlan.make(public: true) }
      let(:guid) { service_plan.guid }

      let(:expected_codes_and_responses) do
        Hash.new(
          code: 200,
          response_object: create_plan_json(service_plan)
        )
      end

      it_behaves_like 'permissions for single object endpoint', COMPLETE_PERMISSIONS

      context 'when the hide_marketplace_from_unauthenticated_users feature flag is enabled' do
        before do
          VCAP::CloudController::FeatureFlag.create(name: 'hide_marketplace_from_unauthenticated_users', enabled: true)
        end

        let(:expected_codes_and_responses) do
          h = Hash.new(
            code: 200,
            response_object: create_plan_json(service_plan)
          )
          h['unauthenticated'] = { code: 401 }
          h
        end

        it_behaves_like 'permissions for single object endpoint', COMPLETE_PERMISSIONS
      end
    end

    context 'when there is a non-public service plan' do
      let!(:service_plan) { VCAP::CloudController::ServicePlan.make(public: false) }
      let(:guid) { service_plan.guid }

      let(:expected_codes_and_responses) do
        Hash.new(code: 404)
      end

      it_behaves_like 'permissions for single object endpoint', COMPLETE_PERMISSIONS
    end
  end

  describe 'GET /v3/service_plans' do
    let(:api_call) { lambda { |user_headers| get '/v3/service_plans', nil, user_headers } }

    context 'when there are no service plans' do
      let(:expected_codes_and_responses) do
        Hash.new(
          code: 200,
          response_objects: []
        )
      end

      it_behaves_like 'permissions for list endpoint', COMPLETE_PERMISSIONS
    end

    context 'visibility of service plans' do
      context 'when they are public' do
        let!(:service_plan_1) { VCAP::CloudController::ServicePlan.make(public: true) }
        let!(:service_plan_2) { VCAP::CloudController::ServicePlan.make(public: true) }

        let(:expected_codes_and_responses) do
          Hash.new(
            code: 200,
            response_objects: [
              create_plan_json(service_plan_1),
              create_plan_json(service_plan_2),
            ]
          )
        end

        it_behaves_like 'permissions for list endpoint', COMPLETE_PERMISSIONS

        context 'when the hide_marketplace_from_unauthenticated_users feature flag is enabled' do
          before do
            VCAP::CloudController::FeatureFlag.create(name: 'hide_marketplace_from_unauthenticated_users', enabled: true)
          end

          let(:expected_codes_and_responses) do
            h = Hash.new(
              code: 200,
              response_objects: [
                create_plan_json(service_plan_1),
                create_plan_json(service_plan_2),
              ]
            )
            h['unauthenticated'] = { code: 401 }
            h
          end

          it_behaves_like 'permissions for list endpoint', COMPLETE_PERMISSIONS
        end
      end
    end
  end

  def create_plan_json(service_plan)
    {
      guid: service_plan.guid
    }
  end
end
