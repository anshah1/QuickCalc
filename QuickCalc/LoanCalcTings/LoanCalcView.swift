//
//  LoanCalcView.swift
//  QuickCalc
//
//  Created by Ansh Shah on 7/28/23.
//

import SwiftUI
import MapKit

struct LoanCalcView: View {
    var body: some View {
        VStack {
            Text("Loans!")
                .font(.largeTitle)
                .padding(.bottom, 100)
            NavigationLink(destination: SimpleInterestView()){
                Text("Simple interest")
            }
            .padding(.bottom, 30.0)
            .buttonStyle(normalButtonStyle())
            .frame(maxWidth: .infinity)
            NavigationLink(destination: CompoundInterestView()){
                Text("Compound interest")
            }
            .padding(.bottom, 30.0)
            .buttonStyle(normalButtonStyle())
            .frame(maxWidth: .infinity)
            NavigationLink(destination: FixedRateView()){
                Text("Fixed-Rate Loan")
            }
            .padding(.bottom, 30.0)
            .buttonStyle(normalButtonStyle())
            .frame(maxWidth: .infinity)
        }
    }
}

struct LoanCalcView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalcView()
    }
}
