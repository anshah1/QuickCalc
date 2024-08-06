//
//  ContentView.swift
//  QuickCalc
//
//  Created by Ansh Shah on 7/26/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                Image("noBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 40.0)
                NavigationLink(destination: CashCalcView()){
                    Text("Daily transactions")
                }
                .buttonStyle(LargeButtonStyle())
                .padding(.bottom, 40.0)
                NavigationLink(destination: LoanCalcView()){
                    Text("Loans + Interest")
                }
                .buttonStyle(LargeButtonStyle())
                .padding(.bottom, 40.0)
                NavigationLink(destination: factOfDayView()){
                    Text("Fact of the day!")
                }
                .buttonStyle(LargeButtonStyle2())
                .padding(.bottom, 40.0)
                Text("By Ansh Shah")
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct LargeButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(maxWidth: 300)
            .frame(height: 80)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct LargeButtonStyle2: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(maxWidth: 300)
            .frame(height: 80)
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct normalButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(maxWidth: 320)
            .frame(height: 80)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct smallButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .frame(maxWidth: 320)
            .frame(height: 80)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct redSmallButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .frame(maxWidth: 320)
            .frame(height: 80)
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
