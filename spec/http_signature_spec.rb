require "spec_helper"

describe HttpSignature do
  it "has a version number" do
    expect(HttpSignature::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
