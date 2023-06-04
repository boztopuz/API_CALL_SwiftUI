//
//  ImageView.swift
//  APICall
//
//  Created by Burak Öztopuz on 4.06.2023.
//

import SwiftUI

struct ImageView: View {

    let urlImage: String
    @State var data: Data?
    @StateObject var viewModel : MainViewModel = MainViewModel()
    var body: some View {
        if let data = data, let uimage = UIImage(data: data) {
            Image(uiImage: uimage)
                .resizable()
                .frame(width: 150, height: 150)
                .background(Color.gray)
        }else{
            Image(systemName: "trash.slash")
                .frame(width: 150, height: 150)
                .background(Color.gray)
                .onAppear{
                    pullImage()
                }
        }
    }
    
    private func pullImage(){
        guard let url = URL(string: urlImage) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }.resume()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlImage: "deneme")
    }
}
