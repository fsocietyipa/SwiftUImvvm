//
//  ContentView.swift
//  SwiftUImvvm


import SwiftUI
import KingfisherSwiftUI


struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    
    var body: some View {
        LoadingView(isShowing: .constant(vm.isLoading)) {

             NavigationView {
                       VStack {
                        List(self.vm.photosArray) { photo in
                            NavigationLink(destination: NewContentView(photo: photo)) {

                                VStack () {
                                    Text(String(photo.title))
                                        .bold()
                                        .underline()
                                    KFImage(URL(string: photo.thumbnailUrl)!)
                                        .resizable()
                                        .clipShape(Circle())
                                }
                            }
                        }
                }
                .navigationBarTitle("Photos")
                .navigationBarItems(trailing:
                    Button("Add") {
                        self.vm.getData()
                    }
                )
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
