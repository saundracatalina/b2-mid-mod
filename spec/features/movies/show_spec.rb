require 'rails_helper'

describe "movies show page" do
  before :each do
    @studio_1 = Studio.create!(name: "Dreamworks", location: "California")
    @studio_2 = Studio.create!(name: "Warner Bros", location: "California")

    @movie_1 = Movie.create!(title: "Shrek", creation_year: 2001, genre: "Comedy", studio_id: "#{@studio_1.id}")
    @movie_2 = Movie.create!(title: "Space Jam", creation_year: 1996, genre: "Children", studio_id: "#{@studio_2.id}")

    @actor_1 = Actor.create!(name: "Shrek", age: 30)
    @actor_2 = Actor.create!(name: "Fiona", age: 35)
    @actor_3 = Actor.create!(name: "Donkey", age: 12)
    @movie_1.actors << @actor_1
    @movie_1.actors << @actor_2
    @movie_1.actors << @actor_3

    @actor_4 = Actor.create!(name: "Michael Jordan", age: 32)
    @actor_5 = Actor.create!(name: "Bugs Bunny", age: 25)
    @actor_6 = Actor.create!(name: "Daffey Duck", age: 22)
    @movie_2.actors << @actor_4
    @movie_2.actors << @actor_5
    @movie_2.actors << @actor_6
  end

  it "can see the movie's title, creation_year, genre, and list of actors youngest to oldest" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(@actor_3.name).to appear_before(@actor_1.name)
    expect(@actor_1.name).to appear_before(@actor_2.name)

    visit "/movies/#{@movie_2.id}"

    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_2.creation_year)
    expect(page).to have_content(@movie_2.genre)
    expect(@actor_6.name).to appear_before(@actor_5.name)
    expect(@actor_5.name).to appear_before(@actor_4.name)
  end

  # it "can see the average age of all the movie's actors" do
  #
  # end
end
