//
//  SearchView.swift
//  IMDB (API Key Practice)
//
//  Created by Luke Aronson on 2/2/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchTerm = "Fringe"
    var body: some View {
        NavigationView{
            VStack{
                TextField("Search terms. . .", text: $searchTerm)
                    .border(.gray)
                    .padding()
                    .multilineTextAlignment(.center)
                NavigationLink(destination: ListView(searchTerm: searchTerm), label: {
                    Text("Search")
                })
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
