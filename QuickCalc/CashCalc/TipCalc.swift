import SwiftUI

struct TipCalc: View {
    @State private var subtotal: String = ""
    @State private var split: String = ""
    @State private var tip: String = ""
    
    private func getIndividualPrice() -> Double {
        let subtotalValue = Double(subtotal) ?? 0
        let splitValue = Double(split) ?? 1
        let tipPercentage = Double(tip) ?? 0
        let totalAmount = subtotalValue * (1 + tipPercentage/100)
        return totalAmount / splitValue
    }
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 50)
            
            HStack {
                Text("Bill subtotal: ")
                    .frame(width: 220)
                TextField("$", text: $subtotal)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 20)
            
            HStack {
                Text("# of people to split: ")
                    .padding(.leading, 33)
                    .frame(width: 220)
                TextField("#", text: $split)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 20)
            
            HStack {
                Text("Tip percentage: ")
                    .padding(.leading, 33)
                    .font(.title2)
                    .frame(width: 220)
                TextField("%", text: $tip)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 100)
            
            HStack {
                Text("You pay: ")
                    .font(.title)
                    .frame(width: 120)
                Text(String(format: "%.2f", getIndividualPrice()))
                    .font(.title)
            }
            .padding(.bottom, 100)
            
            Button("Reset all fields") {
                subtotal = ""
                split = ""
                tip = ""
            }
            .buttonStyle(redSmallButtonStyle())
        }
        .onChange(of: subtotal) { _ in
            // Update the calculated value whenever subtotal changes
            // This will automatically update the "You pay" text
            // because SwiftUI will recompute the body of the view.
        }
        .onChange(of: split) { _ in
            // Update the calculated value whenever split changes
        }
        .onChange(of: tip) { _ in
            // Update the calculated value whenever tip changes
        }
    }
}

struct TipCalc_Previews: PreviewProvider {
    static var previews: some View {
        TipCalc()
    }
}
