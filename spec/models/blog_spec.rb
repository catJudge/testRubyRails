require 'spec_helper'

describe Blog do
  before(:each) do
    @blog = Blog.new
  end

  it "should be valid" do
    @blog.should be_valid
  end

  it { should belong_to(:user) }
  it { should have_many(:posts) }
  it { should validate_presence_of(:title) }
  it { should allow_value('test').for(:title) }
  it { should_not allow_value('t').for(:title) }

end
