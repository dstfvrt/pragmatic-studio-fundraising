require './lib/fundraising/project'
require './lib/fundraising/pledge'
require 'pry'

module Fundraising
  describe Project do
    before do
      @project = Project.new("ABC", 100, 1000)
      @amount = 50
      @bronzePledge = Pledge.new(:bronze, 50)
    end

    it 'adds a specified amount to total funding' do
      @project.add_funds(@amount)

      expect(@project.funding).to eq(150)
    end

    it 'subtracts a specified amount to total funding' do
      @project.remove_funds(@amount)

      expect(@project.funding).to eq(50)
    end

    it 'adds pledges and associated amount to total funding' do
      @project.pledges(@bronzePledge)

      expect(@project.funding).to eq(150)
      @project.each_pledge do |pledge|
        expect(pledge).to eq(@bronzePledge)
      end
    end
  end
end
