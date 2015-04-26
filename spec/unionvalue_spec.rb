require File.expand_path(File.dirname(__FILE__) + '/../lib/unionvalue')
describe 'unionvalues' do

    Thing = UnionValue.new(:one, :two, :three)
    val = 12345
    one = Thing.one
    two = Thing.two
    three = Thing.three(val)

    it 'defines constructors' do
        one.is_one?.should == true
        two.is_one?.should == false
        three.is_three?.should == true
        three.data.should == val
    end

    it 'allows equality' do
        one.should == Thing.one
        three.should == Thing.three(val)
        one.should_not == two
        three.should_not == Thing.three(23819)
    end
end
