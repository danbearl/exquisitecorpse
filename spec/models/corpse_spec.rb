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

  describe "#check_for_closure" do
    it "closes itself once its body has reached 3,000 characters" do
      corpse = Corpse.create

      snippet_str = ''

      300.times do
        snippet_str << 'a'
      end

      11.times do
        corpse.snippets.build(body: snippet_str)
      end
      
      corpse.save!

      corpse.closed.should eq(true)
    end
  end

  describe "#authors" do
    it 'returns a collection of the authors who contributed to the corpse' do
      corpse = Corpse.create

      snippet_str = ''
      300.times do
        snippet_str << 'a'
      end

      user = Fabricate(:user, name: "Dan", email: "dan@example.com", password: "pass")
      corpse.snippets.build(body:snippet_str, author_id: user.id)

      corpse.save!

      corpse.authors.first.should eq(user)
    end
  end
end
