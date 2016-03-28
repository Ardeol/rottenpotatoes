require 'spec_helper'

describe Movie do
    before(:all) do
        @starwars = Movie.create!(:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25')
        @bladerunner = Movie.create!(:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25')
        @alien = Movie.create!(:title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
        @thx1138 = Movie.create!(:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11')
    end

    it 'should return movies with same director' do
        movies = @starwars.movies_with_same_director
        expect(movies.length).to eq(2)
        movies.each do |movie|
            expect(movie.director).to eq(@starwars.director)
        end
    end
    
    it 'should return nil if no director' do
        assert @alien.movies_with_same_director.nil?
    end
end