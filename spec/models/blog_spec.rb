require 'rspec'
require 'spec_helper'

describe Blog, type: :model do
  describe 'with valid blog' do
    before { @blog = build(:blog) }

    subject { @blog }

    it { should respond_to :text }
    it { should respond_to :title }
    it { should respond_to :user_id }
    it { should be_valid }
  end

  describe 'with invalid blog' do
    before { @blog = build(:blog, text: 'lol', title: 'lollol', user_id: nil) }

    subject { @blog }

    it { should_not be_valid }
  end
end