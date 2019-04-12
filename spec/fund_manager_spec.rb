require './lib/fund_manager'

describe Hedgefund do
  before do
    @favoriteLLC = Hedgefund.new('Favorite LLC');
    @project = Project.new('Alpha', 100, 1000);
    @favoriteLLC.add_project(@project)
  end

  it 'adds funds if a even number is rolled' do
    allow_any_instance_of(Die).to receive(:number).and_return(2)

    @favoriteLLC.update(4)

    expect(@project.funding).to be > 100
  end

  it 'deducts funds if an odd number is rolled' do
    allow_any_instance_of(Die).to receive(:number).and_return(3)
    @project2 = Project.new('Beta', 60, 100)
    @favoriteLLC.add_project(@project2)
    @favoriteLLC.update(4)

    expect(@project2.funding). to be < 60
  end
end
