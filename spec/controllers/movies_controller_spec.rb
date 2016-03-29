require 'spec_helper'

describe MoviesController do
    before :each do
        @fake_movie = double('Movie', :id => 1, :title => "Fake Movie", :director => "Fake Director")
        Movie.stub(:find).with("1").and_return(@fake_movie)
    end
    
#    it 'should go to the bydirectors route' do
#        response.should render_template :bydirectors
#    end
    
    it 'should call movies_with_same_director' do
        @fake_movie.should_receive(:movies_with_same_director)
        get :bydirectors, :id => 1
    end
end