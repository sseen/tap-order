//
//  TOMenuListView.swift
//  TapOrder
//
//  Created by solo on 2/21/22.
//

import SwiftUI

struct TOMenuListView: View {
    let myList: [String] = ["1", "2"]//, "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3"]
    let headerHeight = CGFloat(150)
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    private var oneColumnGrid = [GridItem(.flexible())]
    private var twoColumnGrid = [GridItem(.flexible(),spacing: .menuListPadding),GridItem(.flexible(),spacing: .menuListPadding)]
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var placeholderFoods =  [TOFoodsItem]()
    private var placeholderCats = [TOFoodsCatItem]()
    
    @ObservedObject var viewModel = TOMenuListViewModel()
    @State var selCatItemId: Int
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        //set large title padding
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        style.firstLineHeadIndent = 20
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 36),.paragraphStyle: style]
        //which cat is selected
        selCatItemId = 0
        
        for one in 0...4 {
            placeholderFoods.append(TOFoodsItem(foodName: "chicken", foodPic: "image", foodId: 10 + one, foodPrice: 100))
            placeholderCats.append(TOFoodsCatItem(catgoryId: 20 + one, catgoryName: "cat", catgoryPic: "image", foods: []))
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: twoColumnGrid,spacing: 40,pinnedViews: [.sectionHeaders]) {
                    Section {
                        // Display the item
//                        ForEach((0...10), id: \.self) {_ in
//                            TOMenuListCell()
//                        }
                        ForEach(self.viewModel.isLoading ? placeholderFoods : self.viewModel.foodList, id:\.foodId) { one in
                            TOMenuListCell(item: one)
                        }
                        .redacted(reason: self.viewModel.isLoading ? .placeholder : [])
                    } header: {
                        VStack(alignment:.leading) {
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: oneColumnGrid) {
                                    // Display the item
                                    ForEach(self.viewModel.isLoading ? placeholderCats : self.viewModel.catList, id: \.catgoryId) {one in
                                        TOMenuCategoryCell(item:one, selItemId:$selCatItemId)
                                    }
                                    .redacted(reason: self.viewModel.isLoading ? .placeholder : [])
                                }
                            }
                            .frame(height: 110)
                            Text("Food List")
                                .font(.system(size: 24))
                                .frame(height: 40)
                        }
                        .frame(height: headerHeight)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        .background(.white)
                        .onChange(of: selCatItemId) { newValue in
                            self.viewModel.switchCat(catId: newValue)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: .menuListPadding, bottom: 0, trailing: .menuListPadding))
            //.navigationTitle("Menu")
            //.toolbar {
            //    Text("no.0001")
            //}
            .onAppear {
                self.viewModel.getFoodsList()
            }
            
            if viewModel.isLoading {
              ProgressView()
            }
        }
    }
    
    struct TOMenuListView_Previews: PreviewProvider {
        static var previews: some View {
            TOMenuListView()
        }
    }
}