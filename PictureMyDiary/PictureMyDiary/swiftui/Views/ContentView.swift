//
//  ContentView.swift
//  iReceipt
//
//  Created by Federico on 26/01/2022.
//

import SwiftUI
    // 아이콘 누르는거

struct ContentView: View {
    var ContentView: some View {
        
        NavigationView {
            VStack{
                
                HStack {
                    NavigationLink(destination: MainView()) {
                        
                        Image("face1")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Text("")
                            .font(.title)
                    }
                    
                    NavigationLink(destination: MainView()) {
                        
                        Image("face5")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Text("")
                            .font(.title)
                    }
                    NavigationLink(destination: MainView()) {
                        
                        Image("face3")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Text("")
                            .font(.title)
                    }
                    
                    
                }
                VStack {
                    HStack {
                        NavigationLink(destination: MainView()) {
                            
                            Image("face4")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text("")
                                .font(.title)
                        }
                        
                        NavigationLink(destination: MainView()) {
                            
                            Image("face2")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text("")
                                .font(.title)
                        }
                        
                    }
                    //.navigationBarTitle(Text("오늘의 기분을 선택해주세요"))
                    
                }
                // .navigationViewStyle(StackNavigationViewStyle()) // stackNavigation 스타일로 지정
            }
            
        }
        
        
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

