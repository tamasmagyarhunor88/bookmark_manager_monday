require 'link'

describe Link do
  context '#all' do
    # it 'returns list of arrays' do
    #   expect(subject.all).to match_array(["https://www.getfitwithhunor.com", "http://bepositivelikehunor.com", "http://hunor.wikipedia.org"])
    # end

    it 'returns all the links' do
      links = Link.all
      expect(links).to include("https://www.getfitwithhunor.com")
    end
  end
end
