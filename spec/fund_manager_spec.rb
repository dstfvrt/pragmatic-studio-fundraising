require './lib/fund_manager'

describe Hedgefund do
  before do
    @favoriteLLC = Hedgefund.new('Favorite LLC');
    @project = Project.new('Alpha', 10000, 100000);
    @favoriteLLC.add_project(@project)
  end

  it 'adds funds if a even number is rolled' do
    allow_any_instance_of(Die).to receive(:number).and_return(2)

    @favoriteLLC.update

    expect(@project.funding).to be > 10000
  end

  it 'deducts funds if an odd number is rolled' do
    allow_any_instance_of(Die).to receive(:number).and_return(3)
    @project2 = Project.new('Beta', 10000, 100000)
    @favoriteLLC.add_project(@project2)
    @favoriteLLC.update

    expect(@project2.funding). to be < 10000
  end
end
