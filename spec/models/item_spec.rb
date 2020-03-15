require 'rails_helper'

RSpec.describe Item, type: :model do

  it { should belong_to(:bookstore) }

  it { should validate_presence_of(:name)}

  # pending "add some examples to (or delete) #{__FILE__}"
end