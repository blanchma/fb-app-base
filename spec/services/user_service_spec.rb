require 'spec_helper'

describe UserService do

  it "returns a user" do
    auth = HashWithIndifferentAccess.new({info: {name: "Test", email: "email@domain.com"}, provider: :faceboook, credentials: {token: "token"}, uid: 1})
    user = UserService.access(auth)
    user.should be_valid
  end
end
