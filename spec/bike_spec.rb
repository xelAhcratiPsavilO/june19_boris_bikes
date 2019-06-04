require 'bike'

describe Bike do

  describe '#working?' do
    it 'defaults to true' do
      expect(subject.working?).to be true
    end
  end

  describe '#report_broken' do
    it 'changes the state of a bike to broken' do
      subject.report_broken
      expect(subject.working?).to be false
    end
  end

end
