RSpec.describe 'bin.rb' do
  it "has a version number" do
    expect(Binrb::VERSION).not_to be nil
  end

  it "is an executable" do
    expect(`./exe/bin.rb`).to eq("!ARGV.first\n")
  end
end
