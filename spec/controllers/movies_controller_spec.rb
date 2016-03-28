require 'spec_helper'

describe MoviesController do
    before(:all) do
        #@fake_movie = mock(:id => 1)
    end
    
    it 'should call movies_with_same_director' do
        get :bydirectors
    end
end