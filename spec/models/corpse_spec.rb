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
end
