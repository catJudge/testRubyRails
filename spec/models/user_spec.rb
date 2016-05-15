require 'spec_helper'

describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name)}

  it '#email returns a string' do
    expect(@user.email).to match 'user@example.com'
  end

end
