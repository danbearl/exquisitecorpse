require 'spec_helper'

describe Snippet do
  describe "truncate_body" do
    it 'only saves the first 300 characters of a supplied string' do
      str = ''
      400.times do 
        str << "a"
      end

      snippet = Snippet.create(body: str)

      snippet.body.length.should eq(300)
    end
  end
end
