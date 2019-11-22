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
                                VStack () {
                                    Text(String(photo.title)).bold().underline(true, color: Color.red)
                                    KFImage(URL(string: photo.url)!).resizable().clipShape(Circle())
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
