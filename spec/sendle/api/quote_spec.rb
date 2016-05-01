require "spec_helper"

describe Sendle::Api::Quote do

  describe "#execute" do
    let(:params) {
      {
        pickup_suburb: 'woolloomooloo',
        pickup_postcode: '2011',
        delivery_suburb: 'eastgardens',
        delivery_postcode: '2036',
        kilogram_weight: '1'
      }
    }

    it "makes the correct request" do
      expected_params = {
        method: :get,
        url: Sendle::Api::Quote.url,
        headers: {
          accept: :json, 
          content_type: :json,
          params: params
        }
      }
      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params))

      Sendle::Api::Quote.execute(params)
    end

    it "throws an error if params are missing" do
      expect {
        Sendle::Api::Quote.execute
      }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: pickup_suburb, pickup_postcode, delivery_suburb, delivery_postcode, kilogram_weight. Please check your request and try again.")
    end

    it "returns correct response" do
      Sendle::Api::Quote.execute(params)
    end

    it "handles 422" do

    end

    it "respects the plan_name param" do

    end
  end

end