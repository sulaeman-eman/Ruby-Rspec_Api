require 'rails_helper'

RSpec.describe Bookstore, type: :model do

  it { should have_many(:items).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:deskripsi) }


  

  # pending "add some examples to (or delete) #{__FILE__}"
end