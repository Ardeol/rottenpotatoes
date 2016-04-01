require 'spec_helper'

describe MoviesController do
    context "directors" do
        before :each do
            @fake_movie = double('Movie', :id => 1, :title => "Fake Movie", :director => "Fake Director")
            Movie.stub(:find).with("1").and_return(@fake_movie)
        end
        
      # Sad Path
        it 'should go to home when no movies with same director' do
            @fake_movie.stub(:movies_with_same_director).and_return(nil)
            get :bydirectors, :id => 1
            response.should redirect_to '/'
        end
        
        it 'should call movies_with_same_director' do
            @fake_movie.should_receive(:movies_with_same_director)
            get :bydirectors, :id => 1
        end
    end
    
    context "create" do
        before { post :create, { :movie => { :title => "Fake 2" } } }
        it 'should create a model' do
            change { Movie.count }.from(0).to(1)
        end
    end
    
    context "destroy" do
        before { Movie.create!({ :id => 1 }) }
        it 'should destroy a model' do
            post :destroy, :id => 1
            change { Movie.count }.from(1).to(0)
        end
    end
    
    context "index" do
        it 'should change session when different sort is given' do
            session[:sort] = "release_date"
            get :index, :sort => 'title'
            expect(session[:sort]).to eq("title") 
        end
        
        it 'should change session when different rating is given' do
            session[:ratings] = { 'PG' => 'PG' }
            get :index, :ratings => { 'R' => 'R' }
            expect(session[:ratings]['R']).to eq("R")
        end
    end
end