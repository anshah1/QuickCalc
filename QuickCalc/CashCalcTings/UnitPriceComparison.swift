import SwiftUI

struct UnitPriceComparison: View {
    @State var i1: String = ""
    @State var i2: String = ""
    @State var i3: String = ""
    @State var i4: String = ""
    @State var p1: String = ""
    @State var p2: String = ""
    @State var p3: String = ""
    @State var p4: String = ""
    @State var up1: String = ""
    @State var up2: String = ""
    @State var up3: String = ""
    @State var up4: String = ""

    var body: some View {
        VStack {
            Text("Unit price calculator")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 50)

            HStack {
                Text("Item")
                    .fontWeight(.bold)
                    .frame(width: 38)
                    .padding(.trailing, 15)
                Text("# of items")
                Text("Total $")
                    .padding(.leading, 25)
                Text("Price per item")
                    .padding(.leading, 25)
            }
            .padding(.bottom, 15)
            .padding(.horizontal)

            itemRow(item: "Item 1", items: $i1, total: $p1, unitPrice: $up1)
            itemRow(item: "Item 2", items: $i2, total: $p2, unitPrice: $up2)
            itemRow(item: "Item 3", items: $i3, total: $p3, unitPrice: $up3)
            itemRow(item: "Item 4", items: $i4, total: $p4, unitPrice: $up4)
                .padding(.bottom, 100)
            Button("Reset all fields") {
                resetAllFields()
            }
            .buttonStyle(redSmallButtonStyle())
        }
    }

    func itemRow(item: String, items: Binding<String>, total: Binding<String>, unitPrice: Binding<String>) -> some View {
        let upValue = unitPriceValue(total: total.wrappedValue, items: items.wrappedValue)
        return HStack {
            Text(item)
                .frame(width: 100)
                .padding(.leading, 15)
                .font(.title2)
            TextField("# of items", text: items)
                .frame(width: 100)
                .keyboardType(.numbersAndPunctuation)
            TextField("Total $", text: total)
                .frame(width: 100)
                .keyboardType(.numbersAndPunctuation)
            Text(upValue)
                .frame(width: 100)
        }
        .padding(.bottom, 15)
        .padding(.horizontal)
        .onChange(of: total.wrappedValue) { newValue in
            updateUnitPrice(item: item, items: items, total: total, unitPrice: unitPrice)
        }
        .onChange(of: items.wrappedValue) { newValue in
            updateUnitPrice(item: item, items: items, total: total, unitPrice: unitPrice)
        }
    }

    func unitPriceValue(total: String, items: String) -> String {
        guard let totalValue = Double(total), let itemCount = Double(items), itemCount > 0 else {
            return ""
        }
        let unitPrice = totalValue / itemCount
        return "$" + String(format: "%.2f", unitPrice)
    }

    func updateUnitPrice(item: String, items: Binding<String>, total: Binding<String>, unitPrice: Binding<String>) {
        let upValue = unitPriceValue(total: total.wrappedValue, items: items.wrappedValue)
        unitPrice.wrappedValue = upValue
    }
    func resetAllFields(){
        i1 = ""
        i2 = ""
        i3 = ""
        i4 = ""
        p1 = ""
        p2 = ""
        p3 = ""
        p4 = ""
        up1 = ""
        up2 = ""
        up3 = ""
        up4 = ""
    }
}

struct UnitPriceComparison_Previews: PreviewProvider {
    static var previews: some View {
        UnitPriceComparison()
    }
}
