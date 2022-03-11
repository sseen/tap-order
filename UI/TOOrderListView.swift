//
//  TOOrderListView.swift
//  TapOrder
//
//  Created by solo on 2/22/22.
//

import SwiftUI

struct TOOrderListView: View {
    let dataList = [1,2,3,1,2,3]
    
    @StateObject var orderVM = TOOrderViewModel(urlstr: "ws://localhost:8080/api/v1/shops/e988662acc1fe9b08a9e764bacfcb304/tables/A2/current-order?language=ja")
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        //NavigationView {
        
        VStack {
            List {
                ForEach(orderVM.newOrderList, id:\.sid) { one in
                    TOOrderListCell(item: one)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .onAppear {
                self.orderVM.doRece()
            }
            
            ZStack(alignment: .bottom) {
                HStack {
                    Text("Total:")
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                    Text("\(self.orderVM.totalStr)")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.normalYellow)
                }
                .background(.white)
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
        }
        .padding(EdgeInsets(top: 0, leading: .menuListPadding, bottom: 0, trailing: .menuListPadding))
        
    }
    
    private func doSomething(content:String) {
        
    }
}

struct TOOrderListView_Previews: PreviewProvider {
    static var previews: some View {
        TOOrderListView()
    }
}
