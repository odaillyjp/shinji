require 'rspec'
require 'shinji'

describe "String" do
  describe "#shinji" do
    context "文字列に旧字が含まれるとき" do
      it "旧字を新字に変換した文字列を返すこと" do
        str = "稻飮隱營榮衞驛學廣"
        expect(str.shinji).to eq "稲飲隠営栄衛駅学広"
      end
    end
  end
end
