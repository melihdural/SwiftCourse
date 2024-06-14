//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case date
    case guest
}


struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var search = ""
    @State private var selectedOption: DestinationSearchOptions = .guest
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack {
                Button{
                    withAnimation(.snappy,{
                        show.toggle()
                    })
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                if !search.isEmpty{
                    Button("Clear"){
                        
                        search = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack{
                if selectedOption == .location{
                    VStack(alignment: .leading){
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            
                            TextField("Search destinations", text: $search)
                                .font(.subheadline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color(.systemGray4))
                        )
                    }
                }
                else{
                    CollapsedPickerView(title: "When", description: "Add destinations")
                }
            }
            .modifier(CollapseableDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
            
            
            VStack(alignment: .leading){
                if selectedOption == .date{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                }
                else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapseableDestinationViewModifier())
            .frame(height: selectedOption == .date ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .date
                }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .guest {
                    Text("Who's coming?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapseableDestinationViewModifier())
            .frame(height: selectedOption == .guest ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guest
                }
            }
        }
        
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapseableDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
        
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CollapsedPickerView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
