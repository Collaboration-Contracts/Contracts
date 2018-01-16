require 'rails_helper'

RSpec.describe User, type: :model do
  string_columns = [:username, :password_digest]

  string_columns.each do |col|
    it { should have_db_column(col).of_type(:string).with_options(null: false) }
    it { should validate_presence_of(col) }
  end
end
