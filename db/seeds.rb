# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# WIPE THE DATABASE before seeding

    def database_cleanup
        puts '*' * 40
        puts 'Database wipeout'
        puts '*' * 40 + "\n \n"
    
        models_list = [
        User, Compost, Contribution
        ]
    
        models_list.each do |model|
        cleanup(model)
        end
    
        puts
        puts '*' * 40
        puts "Database wiped, oh yeah."
        puts '*' * 40
    end
  
    def cleanup(model)
        model.destroy_all
        puts '-' * 20
        puts model.to_s + ' : table cleaned up.'
    end
  
  #####################
  #####################
  # PLANT THE SEEDS...

  # ----------
  def main_user_seed
    User.create!(
      email: 'thp-okcompost@yopmail.com',
      username: 'user',
      password: 'motdepasse',
      password_confirmation: 'motdepasse'
    )
  end
  
  def main_admin_seed
    User.create(
      email: 'thp-okcompost-admin@yopmail.com',
      username: 'admin',
      password: 'motdepasse',
      password_confirmation: 'motdepasse'
    )
  end
  
  def random_user_seed
    User.create(
      email: Faker::Internet.unique.email,
      username: 'random_user_' + rand(1..100).to_s,
      password: 'motdepasse',
      password_confirmation: 'motdepasse'
    )
  end
  
  def users_seed
    puts "Seeding users"
    main_user_seed
    puts 'Main user created'
  
    main_admin_seed
    puts 'Main admin created'
  
    5.times do
      random_user_seed
    end
    puts (User.all.size - 2).to_s + ' random users created'
  end
  # ----------

  
  # ----------
  def compost_seed(user)
    zipcode_list = []
    19.times { |district| zipcode_list << (format '%03d', (district + 1)) }
    picture_file_name = 'compost_' + (format '%03d', rand(1..7)) + '.jpg'
    picture_path = "compost_pictures/" + picture_file_name
    user.owned_composts.create!(
      title: Faker::Food.vegetables + Faker::Music.genre,
      address: Faker::Address.street_address,
      zipcode: zipcode_list.sample,
      city: 'Paris',
      country: 'France',
      description: 'no data',
      access_data: 'no data',
      image_url: picture_path,
      is_open: true,
      filling: rand(1..10)*10
    )
#     picture_file_name = 'snowboard_' + (format '%03d', rand(1..16)) + '.jpg'
#     picture_path = Rails.root.join("app", "assets", "images", "compost_pictures", picture_file_name)
#     new_compost.picture.attach(
#       io: File.open(picture_path),
#       filename: picture_file_name,
#       content_type: "image/jpg"
#       )
  end
  
  def composts_seed
    puts "Seeding composts"
    10.times do
      compost_seed(User.all.sample)
    end
    puts Compost.all.size.to_s + ' composts created'
  end
  # ----------
  

  # ----------
  def contribution_seed(user)
    my_composts = user.owned_composts.ids
    all_composts_but_mines = Compost.all.ids - my_composts

    rand(1..5).times do
      user.contributions.create!(
        supplied_compost_id: all_composts_but_mines.sample
      )
    end
  end

  def contributions_seed
    puts "Seeding contributions"
    User.all.each do |user|
      contribution_seed(user)
    end
    puts "#{Contribution.all.size} contributions created"
  end
  # ----------
  
  
  #####################
  #####################
  # AND GET SOME WEEDS :)
  
  def perform_seed
    database_cleanup
    # puts
    puts "Beginning seed \n \n"
    users_seed
    puts
    composts_seed
    puts
    contributions_seed
    puts
    puts
    puts '*' * 40
    puts "Seeding complete"
    puts '*' * 40
    puts
  end
  
  perform_seed