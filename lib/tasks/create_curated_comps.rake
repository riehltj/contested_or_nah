namespace :db do
  desc 'Create curated comps'
  task create_curated_comps: :environment do
    CuratedComposition.destroy_all
    comps = [
      { name: 'Ethereal Blades Shen', items: ['Ethereal Blades'], champions: ['Shen'] },
      { name: 'Dryad Syndra', items: ['Blue Buff'], champions: ['Syndra'] },
      { name: '7 Storyweaver', items: ['Storyweaver Emblem'], champions: ['Kayle'] },
      { name: 'Storied Champion Garen', items: ['Storied Champion'], champions: ['Garen'] },
      { name: 'Sage Lux', items: ['Spear of Shojin'], champions: ['Lux'] }
    ]

    comps.each do |comp_data|
      curated_comp = CuratedComposition.create(name: comp_data[:name])
      puts "Processing curated composition: #{curated_comp.name}"

      if comp_data[:items].present?
        items = comp_data[:items].map do |item_name|
          item = Item.find_by(name: item_name)
          puts "Item found by name #{item_name}: #{item}"
          item
        end.compact

        puts "Items to be associated: #{items.map(&:name).join(', ')}"
        curated_comp.items = items
      end

      if comp_data[:champions].present?
        champions = comp_data[:champions].map do |champion_name|
          champion = Champion.find_by(name: champion_name)
          puts "Champion found by name #{champion_name}: #{champion}"
          champion
        end.compact

        puts "Champions to be associated: #{champions.map(&:name).join(', ')}"
        curated_comp.champions = champions
      end

      puts "CuratedComposition before save: #{curated_comp.items.map(&:name).join(', ')} - #{curated_comp.champions.map(&:name).join(', ')}"

      if !curated_comp.save
        puts "Failed to save CuratedComposition: #{curated_comp.errors.full_messages.join(', ')}\n\n\n\n\n\n\n\n"
      else
        puts "Successfully saved CuratedComposition: #{curated_comp.name}\n\n\n"
      end
    end
  end
end
