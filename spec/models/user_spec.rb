require 'rails_helper'

RSpec.describe User, type: :model do
  string_columns = [:username]

  string_columns.each do |col|
    it { should have_db_column(col).of_type(:string).with_options(null: false) }
    it { should validate_presence_of(col) }
  end

  it { should have_db_column(:password_digest).of_type(:string) }

end
