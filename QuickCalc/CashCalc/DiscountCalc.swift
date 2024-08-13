import SwiftUI

struct DiscountCalc: View {
    @State var ogPrice: String = ""
    @State var percentOff: String = ""
    @State var dollarsOff: String = ""
    @State var x: Double = 0 // Initialize x with a default value

    var body: some View {
        VStack {
            Text("Discount Calculator")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 50)
            
            HStack {
                Text("Original price: ")
                    .padding(.leading, 33)
                    .frame(width: 185)
                TextField("$", text: $ogPrice)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 20)
            
            HStack {
                Text("What percent off: ")
                    .padding(.leading, 33)
                    .frame(width: 220)
                TextField("%", text: $percentOff)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 20)
            
            HStack {
                Text("How many dollars off: ")
                    .padding(.leading, 45)
                    .frame(width: 255)
                TextField("-$", text: $dollarsOff)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 70)
            
            Button("Calculate discounted price") {
                x = calculateDiscountedPrice()
            }
            .buttonStyle(smallButtonStyle())
            .padding(.bottom, 50)
            Text("Discounted price: $" + String(format: "%.2f", x))
                .frame(width: .infinity)
                .font(.title)
                .padding(.bottom, 50)
            Button("Reset all fields") {
                resetTextFields()
                x = calculateDiscountedPrice()
            }
            .buttonStyle(redSmallButtonStyle())
        }
        .padding()
    }

    func calculateDiscountedPrice() -> Double {
        // Convert the string variables to numeric values (Double) if they are not empty
        let originalPrice = Double(ogPrice) ?? 0
        let percentageDiscount = Double(percentOff) ?? 0
        let dollarsDiscounted = Double(dollarsOff) ?? 0

        // Calculate the discounted price based on the given inputs
        let percentDiscountAmount = originalPrice * percentageDiscount / 100
        let discountedPrice = originalPrice - dollarsDiscounted - percentDiscountAmount

        // Return the discounted price as a Double
        return discountedPrice
    }
    
    func resetTextFields() {
        ogPrice = ""
        percentOff = ""
        dollarsOff = ""
    }

}

struct DiscountCalc_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCalc()
    }
}
