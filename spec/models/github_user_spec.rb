require './app/models/github_user'
require 'spec_helper'

describe GithubUser do
  subject {GithubUser.new({login: 'manoj', html_url: 'www.manojpanta.com'})}
  context 'Initialize' do
    it 'Exists with valid attributes' do
      expect(subject.name).to eq('Manoj')
      expect(subject.url).to eq('www.manojpanta.com')
    end
  end
end
