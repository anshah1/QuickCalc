//
//  FixedRateView.swift
//  QuickCalc
//
//  Created by Ansh Shah on 8/10/23.
//

import SwiftUI

struct FixedRateView: View {
    @State var principal: String = ""
    @State var annualInterest: String = ""
    @State var months: String = ""
    @State var x: Double = 0
    @State var y: Double = 0
    @State var selectedRate: Int = 0
    @State var selectedInterval: Int = 0
    
    func getMonthlyPayment() -> Double {
        let p = Double(principal) ?? 0
        let r = Double(annualInterest) ?? 0
        var n: Double
        if selectedInterval == 0 {
            n = Double(months) ?? 0
        }
        else {
            n = (Double(months) ?? 0) * 12
        }
        var rr: Double
        if selectedRate == 0 {
            rr = r/100
        }
        else {
            rr = r/1200
        }
        let part1: Double = (p * (rr * pow((1 + rr), n)))
        let part2: Double = pow((1+rr), n) - 1
        return part1/part2
    }
    
    func getTotalPayment() -> Double {
        var nAmt: Double
        if selectedInterval == 0 {
            nAmt = Double(months) ?? 0
        }
        else {
            nAmt = (Double(months) ?? 0) * 12
        }
        return getMonthlyPayment() * nAmt
    }
    
    
    var body: some View {
        VStack {
            Text("Fixed Rate Loan")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 5)
                .padding(.top, 20)
            Text("Monthly Payment Calculator")
                .bold()
                .font(.title)
                .padding(.bottom, 40)
            
            HStack {
                Text("Principal: ")
                    .frame(width: 160)
                TextField("$", text: $principal)
                    .keyboardType(.numbersAndPunctuation)
            }
            .font(.title2)
            .padding(.bottom, 20)
            
            HStack {
                Text("Interest rate: ")
                    .padding(.leading, 33)
                    .frame(width: 160)
                TextField("%", text: $annualInterest)
                    .keyboardType(.numbersAndPunctuation)
                Picker(selection: $selectedRate, label: Text("Interest rate: ")) {
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
                    .font(.title2)
                    .frame(width: 160)
                TextField("#", text: $months)
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
            .padding(.bottom, 60)
            
            Button("Calculate payment") {
                x = getMonthlyPayment()
                y = getTotalPayment()
            }
            .buttonStyle(smallButtonStyle())
            .padding(.bottom, 40)
            
            HStack {
                Text("Monthly payment: ")
                    .font(.title)
                    .frame(width: 220)
                Text("$" + String(format: "%.2f", x))
                    .font(.title)
            }
            .padding(.bottom, 30)
            
            HStack {
                Text("Total payment: ")
                    .font(.title)
                    .frame(width: 220)
                Text("$" + String(format: "%.2f", y))
                    .font(.title)
            }
            .padding(.bottom, 50)
            
            Button("Reset all fields") {
                principal = ""
                annualInterest = ""
                months = ""
                x = 0
                y = 0
            }
            .buttonStyle(redSmallButtonStyle())
        }
    }
}

struct FixedRateView_Previews: PreviewProvider {
    static var previews: some View {
        FixedRateView()
    }
}
