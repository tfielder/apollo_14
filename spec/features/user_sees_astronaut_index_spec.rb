require 'spec_helper'
require 'rails_helper'

describe 'user sees astronaut index' do
  describe 'on index page' do
    it 'displays astronaut info' do
      astronaut_1 = Astronaut.create(name: "Wendy", age: 62, job: "Lead Engineer")
      astronaut_2 = Astronaut.create(name: "Sal", age: 42, job: "Inspector General")

      visit '/astronauts'

      expect(page).to have_content("#{astronaut_1.name}")
      expect(page).to have_content("#{astronaut_1.age}")
      expect(page).to have_content("#{astronaut_1.job}")

      expect(page).to have_content("#{astronaut_2.name}")
      expect(page).to have_content("#{astronaut_2.age}")
      expect(page).to have_content("#{astronaut_2.job}")
    end
    it 'displays average astro age' do
      astronaut_1 = Astronaut.create(name: "Wendy", age: 62, job: "Lead Engineer")
      astronaut_2 = Astronaut.create(name: "Sal", age: 42, job: "Inspector General")

      visit '/astronauts'

      expect(page).to have_content("Average Astronaut Age: #{astronaut.average_age}")
    end
    it 'displays missions in order' do
      astronaut_1 = Astronaut.create(name: "Wendy", age: 62, job: "Lead Engineer")
      astronaut_2 = Astronaut.create(name: "Sal", age: 42, job: "Inspector General")


      mission_1 = astronaut_1.space_missions.create(name: "Wendy", age: 62, job: "Lead Engineer")
      mission_2 = astronaut_1.space_missions.create(name: "Wendy", age: 62, job: "Lead Engineer")

      visit '/astronauts'

      expect(page).to have_content("#{mission_1.title}")
      expect(page).to have_content("#{mission_2.title}")
    end
  end
end