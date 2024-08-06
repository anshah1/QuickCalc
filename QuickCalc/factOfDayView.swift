import SwiftUI

struct factOfDayView: View {
    @State private var selectedFact: FactItem?
    
    var body: some View {
        VStack {
            Text("Fact of the Day:")
                .font(.largeTitle)
                .padding(.top, 30)
            
            if let fact = selectedFact {
                Image(fact.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(fact.fact)
                    .font(.title)
                    .padding()
                    .multilineTextAlignment(.center)
            
            } else {
                Text("Loading...")
                    .font(.headline)
                    .padding()
            }
            
            Spacer()
        }
        .onAppear {
            // Set the initial fact when the view appears
            selectRandomFact()
            
            // Create a timer to update the fact at midnight
            let calendar = Calendar.current
            let now = Date()
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: now)!
            
            let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: tomorrow)!
            let timeUntilMidnight = midnight.timeIntervalSince(now)
            
            Timer.scheduledTimer(withTimeInterval: timeUntilMidnight, repeats: false) { _ in
                selectRandomFact()
            }
        }
    }
    
    // Function to select a random fact
    private func selectRandomFact() {
        let dataService = DataService()
        let facts = dataService.getData()
        
        // Get the fact displayed yesterday from UserDefaults
        let yesterdayFactID = UserDefaults.standard.string(forKey: "yesterdayFactID")
        
        // Filter out the fact displayed yesterday
        let availableFacts = facts.filter { $0.id.uuidString != yesterdayFactID }
        
        if let randomFact = availableFacts.randomElement() {
            // Save the ID of the selected fact for today in UserDefaults
            UserDefaults.standard.set(randomFact.id.uuidString, forKey: "yesterdayFactID")
            
            selectedFact = randomFact
        }
    }
}

struct factOfDayView_Previews: PreviewProvider {
    static var previews: some View {
        factOfDayView()
    }
}
