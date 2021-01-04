require 'rails_helper'

describe Studio, type: :model do
  describe 'relationship' do
    it { should have_many :movies }
  end
end
