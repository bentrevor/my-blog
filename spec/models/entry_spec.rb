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
end
