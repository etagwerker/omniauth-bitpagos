require 'spec_helper'

describe OmniAuth::Strategies::Bitpagos do
  subject do
    @subject ||= begin
      args = ['client_id', 'client_secret', @options || {}].compact
      OmniAuth::Strategies::Bitpagos.new(*args)
    end
  end

  context "client options" do
    it 'should have correct name' do
      expect(subject.options.name).to eq("bitpagos")
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://www.bitpagos.net')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth2/authorize')
    end

    it 'should have correct access token url' do
      expect(subject.options.client_options.token_url).to eq('/oauth2/access_token')
    end

    it 'should indicate that the provider ignores the state parameter' do
      expect(subject.options.provider_ignores_state).to be_true
    end
  end

  context "#prune!" do
    it "should remove nil values" do
      expect(
        subject.send(:prune!, { "a" => "b", "c" => nil })
      ).to eq({ "a" => "b" })
    end

    it "should remove empty values" do
      expect(
        subject.send(:prune!, { "a" => "b", "c" => "" })
      ).to eq({ "a" => "b" })
    end

    it "should remove nil values recursively" do
      expect(
        subject.send(:prune!, { "a" => "b", "c" => { "d" => nil} })
      ).to eq({ "a" => "b" })

      expect(
        subject.send(:prune!, { "a" => "b", "c" => { "d" => nil, "e" => "f"} })
      ).to eq({ "a" => "b", "c" => {"e" => "f"} })
    end

    it "should remove empty values recursively" do
      expect(
        subject.send(:prune!, { "a" => "b", "c" => { "d" => ""} })
      ).to eq({ "a" => "b" })

      expect(
        subject.send(:prune!, { "a" => "b", "c" => { "d" => "", "e" => "f"} })
      ).to eq({ "a" => "b", "c" => {"e" => "f"} })
    end
  end
end
