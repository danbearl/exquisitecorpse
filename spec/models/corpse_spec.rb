require 'spec_helper'

describe Corpse do
  describe "#body" do
    it 'returns all of the corpses snippets appended together as a string' do
      corpse = Corpse.create
      snippet_1 = corpse.snippets.build(body: "The first body.")
      snippet_2 = corpse.snippets.build(body: "The second body.")

      corpse.body.should eq(snippet_1.body + ' ' + snippet_2.body + ' ')
    end
  end

  describe "#last_one_hundred" do
    it 'returns the last one hundred characters of the corpses body' do
      corpse = Corpse.create

      snippet_str = ''

      300.times do
        snippet_str << 'a'
      end

      snippet_one = corpse.snippets.build(body: snippet_str)
      snippet_two = corpse.snippets.build(body: snippet_str)

      corpse.last_one_hundred.length.should eq(100)

    end
  end
end
