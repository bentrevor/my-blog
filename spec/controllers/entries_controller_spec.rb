require 'spec_helper'

describe EntriesController do
  it 'can GET index' do
    get :index

    expect(response.status).to be 200
  end

  it 'can show an entry' do
    entry = Entry.create :title => 'title', :content => 'content'
    get :show, :id => entry.id

    expect(response.status).to be 200
  end
end
