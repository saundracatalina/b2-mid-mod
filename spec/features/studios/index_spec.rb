require 'rails_helper'

describe "studio index page" do
  it "can see a list of all the studios and each studios movies" do
    studio_1 = Studio.create!(name: "Dreamworks", location: "California")
    studio_2 = Studio.create!(name: "Walt Disney", location: "Florida")
    studio_3 = Studio.create!(name: "Warner Bros", location: "California")

    movie_1 = Movie.create!(title: "Shrek", creation_year: 2001, genre: "Comedy", studio_id: "#{studio_1.id}")
    movie_2 = Movie.create!(title: "Madagascar", creation_year: 2005, genre: "Comedy", studio_id: "#{studio_1.id}")

    movie_3 = Movie.create!(title: "Frozen", creation_year: 2013, genre: "Children", studio_id: "#{studio_2.id}")
    movie_4 = Movie.create!(title: "Mulan", creation_year: 1998, genre: "Children", studio_id: "#{studio_2.id}")

    movie_5 = Movie.create!(title: "Space Jam", creation_year: 1996, genre: "Children", studio_id: "#{studio_3.id}")
    movie_6 = Movie.create!(title: "Inception", creation_year: 2010, genre: "Action", studio_id: "#{studio_3
      .id}")

    visit '/studios'

    within ("#studio-#{studio_1.id}") do
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end

    within ("#studio-#{studio_2.id}") do
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content(movie_3.title)
      expect(page).to have_content(movie_4.title)
    end

    within ("#studio-#{studio_3.id}") do
      expect(page).to have_content(studio_3.name)
      expect(page).to have_content(movie_5.title)
      expect(page).to have_content(movie_6.title)
    end
  end
end
