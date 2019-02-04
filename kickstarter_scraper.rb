# require libraries/modules here
require "nokogiri"
require "pry"
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html).css("li.project.grid_4")
  project = {}
  kickstarter.each do |post|
    project[post.css(".bbcard_name").text] = {
      :image_link => post.css(".projectphoto-little").attribute("src").value,
      :description => post.css(".bbcard_blurb").text,
      :location => post.css(".location-name").text,
      :percent_funded => post.css(".first funded").text.to_i
    }
  end
  project
end

create_project_hash
