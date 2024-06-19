# lib/tasks/fetch_data.rake
namespace :fetch_data do
  desc 'Fetch items and champions from the API and store them in the database'
  task fetch: :environment do
    require 'httparty'
    version = '14.12.1'
    # Fetch items
    items_url = "https://ddragon.leagueoflegends.com/cdn/#{version}/data/en_US/tft-item.json"
    items_response = HTTParty.get(items_url)

    if items_response.code == 200
      items = JSON.parse(items_response.body)['data']
      items.each do |_key, item_data|
        Item.find_or_create_by(name: item_data['name']) do |item|
          item.image_url = "https://ddragon.leagueoflegends.com/cdn/#{version}/img/tft-item/#{item_data['image']['full']}"
        end
      end
      puts 'Items fetched and stored successfully.'
    else
      puts "Failed to fetch items. HTTP Status Code: #{items_response.code}"
    end


    # Fetch Augments and add them to items..
    augments_url = "https://ddragon.leagueoflegends.com/cdn/#{version}/data/en_US/tft-augments.json"
    augments_response = HTTParty.get(augments_url)

    if augments_response.code == 200
      augments = JSON.parse(augments_response.body)['data']
      augments.each do |_key, augment_data|
        Item.find_or_create_by(name: augment_data['name']) do |item|
          item.image_url = "https://ddragon.leagueoflegends.com/cdn/#{version}/img/tft-augment/#{augment_data['image']['full']}"
        end
      end
      puts 'Augments fetched and stored successfully.'
  else
    puts "Failed to fetch augments. HTTP Status Code: #{augments_response.code}"
  end

    # Fetch champions
    champions_url = "https://ddragon.leagueoflegends.com/cdn/#{version}/data/en_US/tft-champion.json"
    champions_response = HTTParty.get(champions_url)

    if champions_response.code == 200
      champions = JSON.parse(champions_response.body)['data']
      champions.each do |_key, champion_data|
        Champion.find_or_create_by(name: champion_data['name']) do |champion|
          champion.image_url = "https://ddragon.leagueoflegends.com/cdn/#{version}/img/tft-champion/#{champion_data['image']['full']}"
        end
      end
      puts 'Champions fetched and stored successfully.'
    else
      puts "Failed to fetch champions. HTTP Status Code: #{champions_response.code}"
    end
  end
end
