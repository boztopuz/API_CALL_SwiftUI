//
//  ContentView.swift
//  APICall
//
//  Created by Burak Öztopuz on 4.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : MainViewModel = MainViewModel()
    @AppStorage("darkMode") private var isDark = false
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.models, id: \.self){ model in
                    HStack {
                        ImageView(urlImage: model.thumbnailURL, data: nil)
                        
                        VStack(alignment: .leading){
                            Text(model.title)
                                .bold()
                            Spacer()
                            Text("ID: \(model.id)")
                                .bold()
                        }
                    }.padding(3)
                }
            }
            .onAppear(perform: {
                viewModel.getData()
            })
            .navigationTitle("APIs CALL")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button("GetData") {
                        showAlert = true
                        viewModel.getData()
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button {
                        isDark.toggle()
                    } label: {
                        isDark ? Label("Dark", systemImage: "sun.max.fill") : Label("Light", systemImage: "moon.fill")
                    }

                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("All data fetched"), message: Text("Number of total Data from API: \(viewModel.models.count)"), dismissButton: .cancel(Text("OK")))
            }
        }.environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
