require 'spec_helper'

describe MoviesController do
    before(:all) do
        #@fake_movie = mock(:id => 1)
    end
    
    it 'should go to the bydirectors route' do
        
    end
    
    it 'should call movies_with_same_director' do
        Movie.should_receive(:movies_with_same_director)
        get :bydirectors, :id => 1
    end
end