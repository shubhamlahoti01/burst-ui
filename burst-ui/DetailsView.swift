//
//  DetailsView.swift
//  burst-ui
//
//  Created by Shubham Lahoti on 22/09/23.
//

import SwiftUI
import Foundation

struct DetailsView: View {
    @State private var isFavorite: Bool = true
    var images: [String] = ["uk","us","italy","russia"]
    @State private var selectedImageIndex: Int = 0
    @State private var selectedColor: Int = 0
    
    var body: some View {
        VStack{
            List{
                imageCarousel.listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                productDetail.listRowBackground(Color.theme.background)
                HStack{
                    choicePicker
                    Divider().padding(.trailing, 5)
                    choicePicker
                }
            }
            .listStyle(PlainListStyle())
                
                addBtn
            
                .navigationBarItems(
                    trailing: Image(systemName: isFavorite ? "heart.fill" : "heart").onTapGesture {
                        isFavorite.toggle()
                    }
                    .font(.title2)
                    .foregroundColor(Color.theme.red))
                
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

extension DetailsView {
    private var imageCarousel: some View {
        VStack {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<images.count, id: \.self) {
                    index in
                    ZStack(alignment: .topLeading) {
                        Image("\(images[index])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: .infinity, height: 280)
                            .tag(index)
                    }
                }
            }
            .frame(height: 280)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            
            HStack {
                ForEach(0..<images.count, id: \.self) {
                    index in
                    Capsule().fill(index == selectedImageIndex ? Color.indigo : Color.theme.barColor)
                        .frame(width: 35, height: 8).onTapGesture {
                            selectedImageIndex = index
                        }
                }
                
            }.padding()
            
        }.frame(width: .infinity)
            .background(Color.theme.imageBackground)
    }
    private var productDetail: some View{
        VStack(alignment: .leading, spacing: 10) {
            Text("Product name").bold().font(.title).fontDesign(.rounded)
            Text("Lorem ipsum dolor sit amet ankjfnjvkdv vkdvksnvk knvknvk vfdnvkdjvv vnevn dolor sit amet ankjfnjvkdv vkdvksnvk knvknvk vfdnvkdjvv vnevn dolor sit amet ankjfnjvkdv vkdvksnvk knvknvk vfdnvkdjvv vnevn").font(.body)
            HStack(){
                Text("$7.00")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.indigo)
                HStack(spacing: 0) {
                    Image(systemName: "heart")
                    Text("Refill $4/12 weeks")
                }
            }
            HStack(spacing: 3){
                Text("Color:").fontWeight(.bold).font(.title3)
                Text("CoComelon Seafoam")
            }
        }
    }
    private var choicePicker: some View {
        HStack{
                ForEach(0..<3, id: \.self){ index in
                    Circle()
                        .frame(width: 35, height: 35)
                        .padding(1)
                        .overlay(
                            Circle().stroke(Color.yellow, lineWidth: index == selectedColor ? 2 : 0)
                                    .frame(width:43, height: 43))
                        .onTapGesture {
                            selectedColor = index
                        }
                                
                }
                
        }
        .listRowBackground(Color.theme.background)
    }
    private var addBtn: some View {
        Button(action: {},label: {
            Text("Add").font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.indigo)
                .cornerRadius(10)
        }).padding(20)
    }
}
