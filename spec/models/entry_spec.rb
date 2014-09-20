require 'spec_helper'

describe Entry do
  let(:entry) { Entry.new :title => 'title', :content => 'content' }

  it 'is not valid without a title or content' do
    expect(entry.valid?).to be true

    entry.title = ''
    expect(entry.valid?).to be false

    entry.title = 'title'
    entry.content = ''
    expect(entry.valid?).to be false
  end

  it 'stays in order of id' do
    entry.save
    second_entry = Entry.create :title => 'second title', :content => 'second content'

    expect(entry.next).to eq second_entry
    expect(second_entry.previous).to eq entry
  end
end
