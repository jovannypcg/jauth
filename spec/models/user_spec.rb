require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: "Jovanny", email: "jovannypcg@yahoo.com") }

  it 'should be valid' do
    is_expected.to be_valid
  end

  context "when name is not present" do
    let(:user) { User.new(email: "blah@blah.com") }

    it 'should be invalid' do
      expect(user).to_not be_valid
    end
  end

  it 'should save email as lowercase' do
    mixed_case_email = "Foo@ExAMPle.CoM"

    user = User.new(name: "Pablo")
    user.email = mixed_case_email
    user.save

    expect(user.reload.email).to eql(mixed_case_email.downcase)
  end
end
