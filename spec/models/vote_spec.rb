require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        value = Vote.new(value: 1)
        expect(value.valid?).to eq(true)
      end
    end
  end
end 