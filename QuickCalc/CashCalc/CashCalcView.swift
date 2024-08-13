//
//  CashCalcView.swift
//  QuickCalc
//
//  Created by Ansh Shah on 7/26/23.
//

import SwiftUI

struct CashCalcView: View {
    var body: some View {
        VStack {
            Text("Daily Cash!")
                .font(.largeTitle)
                .padding(.bottom, 100)
            NavigationLink(destination: DiscountCalc()){
                Text("Discount calculator")
            }
            .padding(.bottom, 30.0)
            .buttonStyle(normalButtonStyle())
            NavigationLink(destination: UnitPriceComparison()){
                Text("Unit Price Comparison")
            }
            .padding(.bottom, 30.0)
            .buttonStyle(normalButtonStyle())
            NavigationLink(destination: TipCalc()){
                Text("Tip calculator")
            }
            .padding(.bottom, 30.0)
            .buttonStyle(normalButtonStyle())
        }
    }
}



struct CashCalcView_Previews: PreviewProvider {
    static var previews: some View {
        CashCalcView()
    }
}
