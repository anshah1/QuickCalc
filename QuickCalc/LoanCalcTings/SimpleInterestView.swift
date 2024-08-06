import SwiftUI
import MapKit

struct SimpleInterestView: View {
    @State var principal: String = ""
    @State var rate: String = ""
    @State var months: String = ""
    @State var selectedRate: Int = 0
    @State var selectedInterval: Int = 0
    @State var r: Double = 0
    @State var m: Double = 0
    @State var x: Double = 0
    @State var y: Double = 0
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    func getMonthlyPrice() -> Double {
        let p = Double(principal) ?? 0
        let rate100 = Double(rate) ?? 0
        if selectedRate == 0 {
            r = rate100 / 100
        }
        if selectedRate == 1 {
            r = rate100 / 1200
        }
        return p * r
    }

    func getTotalPrice() -> Double {
        if selectedInterval == 0 {
            m = Double(months) ?? 0
        }
        if selectedInterval == 1 {
            m = (Double(months) ?? 0) * 12
        }
        return getMonthlyPrice() * m
    }

    var body: some View {
        ScrollView{
            VStack {
                Text("Simple interest return calculator")
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                
                HStack {
                    Text("Principal: ")
                        .frame(width: 150)
                    TextField("$", text: $principal)
                        .keyboardType(.numbersAndPunctuation)
                }
                .font(.title2)
                .padding(.bottom, 20)

                HStack {
                    Text("Return rate: ")
                        .padding(.leading, 33)
                        .frame(width: 150)
                    TextField("%", text: $rate)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 25)
                    Picker(selection: $selectedRate, label: Text("Return rate: ")) {
                        Text("Monthly").tag(0)
                        Text("Annual").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 10)
                }
                .font(.title2)
                .padding(.bottom, 20)

                HStack {
                    Text("Time: ")
                        .padding(.leading, 33)
                        .font(.title2)
                        .frame(width: 150)
                    TextField("#", text: $months)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 25)
                    Picker(selection: $selectedInterval, label: Text("Time interval: ")) {
                        Text("Months").tag(0)
                        Text("Years").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.trailing, 10)
                    .frame(maxWidth: .infinity)
                }
                .font(.title2)
                .padding(.bottom, 30)
                
                Spacer()
                
                Button("Calculate payment") {
                    x = getMonthlyPrice()
                    y = getTotalPrice()
                }
                .buttonStyle(smallButtonStyle())
                .padding(.bottom, 30)
            }

            HStack {
                Text("Monthly return: ")
                    .font(.title)
                    .frame(width: 240)
                Text(String(format: "%.2f", x))
                    .font(.title)
            }
            .padding(.bottom, 20)

            HStack {
                Text("Total return: ")
                    .font(.title)
                    .frame(width: 240)
                Text(String(format: "%.2f", y))
                    .font(.title)
            }
            .padding(.bottom, 30)

            Button("Reset all fields") {
                principal = ""
                rate = ""
                months = ""
                x = 0
                y = 0
            }
            .buttonStyle(redSmallButtonStyle())
            Spacer()
            .onAppear {
                selectedRate = 0 // Set the default rate selection
                selectedInterval = 0 // Set the default interval selection
            }
            .onChange(of: principal) { _ in
                // ... Your existing onChange code ...
            }
            .onChange(of: rate) { _ in
                // ... Your existing onChange code ...
            }
            .onChange(of: months) { _ in
                // ... Your existing onChange code ...
            }
        }
    }
}

struct SimpleInterestView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleInterestView()
    }
}
