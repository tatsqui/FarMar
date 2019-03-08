require_relative 'spec_helper'

describe "rake test" do
  it "should run this test and it should fail" do
    true.must_equal false
  end

  it "should have access to stuff in market" do
    expect(TATIANA_CONSTANT).must_equal 30
  end
end
