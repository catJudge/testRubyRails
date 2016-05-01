require 'spec_helper'

describe Post do

  before(:each) do
    @post = Post.new
  end

  it "should require title" do
    @post.title = nil
    @post.should_not be_valid
    @post.errors.on(:title).should_not be_nil
  end

  it { should belong_to(:user) }
  it { should belong_to(:blog) }
  it { should validate_presence_of(:title) }
  it { should allow_value('test').for(:title) }
  it { should_not allow_value('t').for(:title) }

end