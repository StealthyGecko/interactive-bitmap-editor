require_relative "../lib/bitmap"

describe "Bitmap" do
  let(:cols) { 2 }
  let(:rows) { 2 }
  subject { Bitmap.new(cols, rows) }

  describe ".intialize" do
    it { expect(subject.cols).to eql(2) }
    it { expect(subject.rows).to eql(2) }
  end

  describe "#clear" do
    it "sets colour back to 'O'" do
      (1..subject.cols).map do |col|
        (1..subject.rows).map do |row|
          expect(subject.get_pixel_colour(col, row)).to eql("O")
        end
      end
    end
  end

  describe "#get_pixel_colour" do
    it { expect(subject.get_pixel_colour(1,1)).to eql("O") }
  end

  describe "#set_pixel_colour" do
    before { subject.set_pixel_colour(2, 2, "C") }
    it { expect(subject.get_pixel_colour(2,2)).to eql("C") }
  end

  describe "#draw_vertical_segment" do
    before { subject.draw_vertical_segment(2, 1, 2, "C") }

    it { expect(subject.get_pixel_colour(2, 1)).to eql("C") }
    it { expect(subject.get_pixel_colour(2, 2)).to eql("C") }
    it { expect(subject.get_pixel_colour(1, 1)).to eql("O") }
  end

  describe "#draw_horizontal_segment" do
    before { subject.draw_horizontal_segment(2, 1, 2, "C") }

    it { expect(subject.get_pixel_colour(1, 1)).to eql("O") }
    it { expect(subject.get_pixel_colour(1, 2)).to eql("C") }
    it { expect(subject.get_pixel_colour(2, 2)).to eql("C") }
  end
end
