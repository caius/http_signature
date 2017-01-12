require "spec_helper"
require "net/http"

describe HTTPSignature do

  let(:request) { Net::HTTP::Get.new }
  let(:key_path) { File.expand_path("data/test_cert.key", __dir__) }

  it "signs a request" do
    HTTPSignature.sign(request, HTTPSignature::Key.load(key_path))

    expect(request["Date"]).not_to be_nil
    expect(request["Authorization"]).not_to be_nil
    expect(request["Authorization"]).to match("Signature")
  end
end
