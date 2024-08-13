//
//  CompoundInterestView.swift
//  QuickCalc
//
//  Created by Ansh Shah on 7/28/23.
//

import SwiftUI

struct CompoundInterestView: View {
    @State var initial: String = ""
    @State var rate: String = ""
    @State var years: String = ""
    @State var compTimesPerYear: String = ""
    @State var x: Double = 0
    @State var regContrib: String = ""
    @State var selectedRate: Int = 0
    @State var selectedInterval: Int = 0
    
    func getTotalAmt() -> Double {
        var r: Double
        var t: Double
        let p = Double(initial) ?? 0
        let m = Double(regContrib) ?? 0
        let rateAmt = Double(rate) ?? 0
        if selectedRate == 0 {
            r = rateAmt / (100/12)
        }
        else {
            r = rateAmt / 100
        }
        if selectedInterval == 0 {
            t = (Double(years) ?? 0) / 12
        }
        else {
            t = Double(years) ?? 0
        }
        let n = Double(compTimesPerYear) ?? 1

        let compoundFactor = pow(1 + r/n, n*t)
        let compoundInterest = p * compoundFactor
        let contributionInterest = m * ((pow(1 + r/n, n*t) - 1) * (n/r))
        let totalValue = compoundInterest + contributionInterest

        return totalValue
    }

    var body: some View {
        VStack {
            Group {
                Text("Compound Interest return calculator")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Initial amount: ")
                        .frame(width: 240)
                    TextField("$", text: $initial)
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
                    Picker(selection: $selectedRate, label: Text("Return rate: ")) {
                        Text("Monthly").tag(0)
                        Text("Annual").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 165)
                    .padding(.trailing, 10)
                }
                .font(.title2)
                .padding(.bottom, 20)
                
                HStack {
                    Text("Time: ")
                        .padding(.leading, 33)
                        .frame(width: 150)
                    TextField("#", text: $years)
                        .keyboardType(.numbersAndPunctuation)
                    Picker(selection: $selectedInterval, label: Text("Time interval: ")) {
                        Text("Months").tag(0)
                        Text("Years").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 165)
                    .padding(.trailing, 10)
                }
                .font(.title2)
                .padding(.bottom, 20)
                HStack {
                    Text("Contribution amount: ")
                        .frame(width: 240)
                        .multilineTextAlignment(.center)
                    TextField("$ optional", text: $regContrib)
                        .keyboardType(.numbersAndPunctuation)
                    
                }
                .font(.title2)
                .padding(.bottom, 30)
                HStack {
                    Text("Times compounded & contributed per year: ")
                        .padding(.leading, 33)
                        .padding(.trailing, 10)
                        .font(.title2)
                        .frame(width: 240)
                        .multilineTextAlignment(.center)
                    TextField("#", text: $compTimesPerYear)
                        .keyboardType(.numbersAndPunctuation)
                }
                .font(.title2)
                .padding(.bottom, 20)
                Button("Calculate payment") {
                    x = getTotalAmt()
                }
                .buttonStyle(smallButtonStyle())
                .padding(.bottom, 30)
            }

            HStack {
                Text("Final amount: ")
                    .font(.title)
                    .frame(width: 200)
                Text("$" + String(format: "%.2f", x))
                    .font(.title)
            }
            .padding(.bottom, 30)
            
            Button("Reset all fields") {
                initial = ""
                regContrib = ""
                rate = ""
                years = ""
                compTimesPerYear = ""
                x = 0
            }
            .buttonStyle(redSmallButtonStyle())
        }
    }
}

struct CompoundInterestView_Previews: PreviewProvider {
    static var previews: some View {
        CompoundInterestView()
    }
}
