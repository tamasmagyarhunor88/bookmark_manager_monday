require 'link'

describe Link do
  context '#all' do
    it 'returns all the links' do
      links = Link.all
      expect(links).to include("http://www.makersacademy.com")
      expect(links).to include("http://www.facebook.com")
      expect(links).to include("http://www.google.com")
    end
  end
  context '.add_new_link' do
    it 'add new link to the end of bookmark list' do
      Link.add_new_link('http://www.testlink.com')
      expect(Link.all).to include 'http://www.testlink.com'
    end
  end

  describe '::validate' do
    context "when link valid" do
      it "returns true" do
        link = 'https://www.goodlink.com'
        expect(described_class.validate(link)).to eq true
      end
    end

    context "when link not valid" do
      it "returns false" do
        link = 'htps://www.badlink.com'
        expect(described_class.validate(link)).to eq false
      end
    end
  end
end
