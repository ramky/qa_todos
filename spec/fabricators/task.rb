Fabricator(:task) do
  title { Faker::Lorem.words(3).join(" ") }
  description { Faker::Lorem.paragraph(1) }
  deadline { Time.zone.now - 1.day }
end
