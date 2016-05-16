require 'rspec'
require 'spec_helper'

describe Post, type: :model do
  describe 'with valid post' do
    before { @post = build(:post) }

    subject { @post }

    it { should respond_to :text }
    it { should respond_to :title }
    it { should respond_to :user_id }
    it { should respond_to :blog_id }
    it { should be_valid }
  end

  describe 'with invalid post' do
    before { @post = build(:post, text: 'lol', title: 'lollol', user_id: nil, blog_id: nil) }

    subject { @post }

    it { should_not be_valid }
  end
end