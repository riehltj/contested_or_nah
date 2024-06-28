namespace :db do
  desc 'Create curated comps'

  comps = [
    { name: 'Ethereal Blades Shen', items: ['Ethereal Blades', 'Blue Buff'], champion: 'Shen' },
    { name: 'Dryad Syndra', items: ['Blue Buff'], champion: 'Syndra' },
    { name: '7 Storyweaver', items: ['Storyweaver Emblem'], champion: 'Kayle' },
    { name: 'Storied Champion Garen', items: ['Storied Champion'], champion: 'Garen' },
    { name: 'Sage Lux', items: ['Spear of Shojin'], champion: 'Lux' },
    { name: 'Mythic Lillia', items: ['Mythic Emblem'], champion: 'Lillia' },
    { name: 'Big-Mo Reroll', items: ['Blighting Jewel'], champion: 'Teemo' },
    { name: 'Lucky Paws Kobuko', items: ['Lucky Paws'], champion: 'Kobuko' },
    { name: 'Dragonloard Irelia Fast 9', items: ['Red Buff'], champion: 'Irelia' },
  ]
  task create_curated_comps: :environment do
    CuratedComposition.destroy_all

    comps.each do |comp_data|
      curated_comp = CuratedComposition.create(name: comp_data[:name]) 
        items = []
          comp_data[:items].each do |item_name|
            items << Item.find_by(name: item_name)
          end
        champions = [Champion.find_by(name: comp_data[:champion])]

        curated_comp.items = items
        curated_comp.champions = champions

      if !curated_comp.save
        puts "Failed to save CuratedComposition: #{curated_comp.errors.full_messages.join(', ')}\n\n\n\n\n\n\n\n"
      else
        puts "Successfully saved CuratedComposition: #{curated_comp.name}\n\n\n"
      end
    end
  end
end
