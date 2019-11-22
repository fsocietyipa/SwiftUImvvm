//
//  NewContentView.swift
//  SwiftUImvvm
//
//  Created by Okzhetpes Valikhanov on 11/22/19.
//  Copyright © 2019 Okzhetpes Valikhanov. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct NewContentView: View {
    var photo: Photos!
    
    var body: some View {
        VStack {
            Text(photo.title)
            KFImage(URL(string: photo.thumbnailUrl)!)
                .resizable()
                .clipShape(Circle())
        }
    }
}
