//
//  ContentView.swift
//  SwiftUImvvm


import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    @State private var favoriteColor = 0
    var body: some View {
        LoadingView(isShowing: .constant(vm.isLoading)) {

             NavigationView {
                       VStack {
                        
                        List {
                            Section(header: Picker(selection: self.$favoriteColor, label: Text("")) {
                                    Text("Mon").tag(0)
                                    Text("Tue").tag(1)
                                    Text("Wed").tag(2)
                                    Text("Thu").tag(3)
                                    Text("Fri").tag(4)

                                }.pickerStyle(SegmentedPickerStyle()).padding().background(Color.white)
                                .listRowInsets(EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))
                                ) {
                            ForEach((self.vm.photosArray)) { photo in
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
