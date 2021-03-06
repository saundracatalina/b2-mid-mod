require 'rails_helper'

describe Movie, type: :model do
  describe 'relationship' do
    it { should belong_to :studio }
    it { should have_many(:actors).through(:movie_actors) }
  end
end
