//
//  DataService.swift
//  QuickCalc
//
//  Created by Ansh Shah on 8/22/23.
//

import Foundation


struct DataService {
    func getData() -> [FactItem] {
        return [FactItem(fact: "Bananas contain a small amount of Potassium-40, which is a radioactive isotope, making bananas slightly radioactive. However, you need to eat a very large amount to experience any ill effects.", imageName: "banana"),
                FactItem(fact: "Cows have best friends and have been proven to have negative effects when seperated from them, such as worsened health and productivity.", imageName: "cow"),
                FactItem(fact: "Octopuses have two gills and three hearts. Two of the hearts pump blood to the gills, while the third heart pumps it to the rest of the body.", imageName: "octopuses"),
                FactItem(fact: "The chemical name for the protein known as Titin has 189,819 letters, making it one of the longest words in any language.", imageName: "titin"),
                FactItem(fact: "The Anglo-Zanzibar War of 1896 holds the record for the shortest war in history, lasting only 38 minutes.", imageName: "war"),
                FactItem(fact: "Due to the expansion of iron in the heat, the Eiffel Tower can grow up to 15 centimeters (6 inches) in height during the summer.", imageName: "eiffel"),
                FactItem(fact: "Just like humans, ants stretch when they wake up to get their muscles working after a long rest. Ants can also lift 10-50 times their body weight", imageName: "ant" ),
                FactItem(fact: "A day on Earth is about 23 hours, 56 minutes, and 4 seconds long. It's the reason we have leap years to keep our calendars synchronized with the Earth's orbit around the Sun.", imageName: "day"),
                FactItem(fact: "Estimates suggest there are more stars in the observable universe than there are grains of sand on all the beaches and deserts on Earth.", imageName: "star"),
                FactItem(fact: "A sneeze can travel at speeds of up to 100 miles per hour (160 kilometers per hour) and can spread germs over considerable distances. Cover your sneezes!", imageName: "sneeze"),
                FactItem(fact: "The moon is tidally locked to Earth, meaning it always shows the same face to us. The side we never see from Earth is called the far side of the moon.", imageName: "moon"),
                FactItem(fact: "Some of the oldest living organisms on Earth are bristlecone pine trees found in the White Mountains of California. Some of these trees are over 4,000 years old.", imageName: "tree"),
                FactItem(fact: "A lightning bolt can heat the surrounding air to temperatures hotter than the surface of the sun, reaching around 54,000 degrees Fahrenheit (30,000 degrees Celsius).", imageName: "lightning"),
                FactItem(fact: "70% of Canadians live below this line!", imageName: "canada")]
    }
}
