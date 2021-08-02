//
//  ContentView.swift
//  ContentView
//
//  Created by Alexander Bonney on 7/23/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var navigationTitle = "Billie EIlish"
    @State private var opacity: Double = 0
    @State private var oppositeOpasity: Double = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                GeometryReader { geo in
                    Image("BillieEilish").resizable().scaledToFill()
                        .padding(.top, 0)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: geo.frame(in: .global).minY > 0
                            ? geo.frame(in: .global).minY + (UIScreen.main.bounds.height / 3)
                            : UIScreen.main.bounds.height / 3
                        )
                        .offset(y: -geo.frame(in: .global).minY)
                        .opacity(oppositeOpasity)
                        .onChange(of: geo.frame(in: .global).minY) { _ in
                            let op = (-geo.frame(in: .global).minY - 70) / 100
                            if -geo.frame(in: .global).minY > 70 {
                                opacity = op
                                oppositeOpasity = 1 - op
                            } else {
                                opacity = 0
                                oppositeOpasity = 1
                            }
                        }
                }
                VStack(spacing: 10) {
                    HStack {
                        Text(navigationTitle).padding(.horizontal).font(.system(size: 40, weight: .bold)).foregroundColor(.white)
                            .opacity(oppositeOpasity)
                    //MARK: NavigationBarLargeTitleOffset
//                            .offset(x: 375)
                        Spacer()
                    }
                    Text("Born and raised in Los Angeles, Billie Eilish was barely a teenager when her song 'Ocean Eyes' became a viral hit. She teamed with her brother, Finneas, to create the tracks for the breakout EP Don't Smile at Me and the smash album When We All Fall Asleep, Where Do We Go?, establishing the artist as a global sensation and multi-time Grammy winner before the age of 20.\n\n**Early Life and Family**\n\nEilish was born on December 18, 2001, in Los Angeles, California. Her parents, Maggie Baird and Patrick O’Connell, were longtime actors before joining their teenage daughter's professional team. Eilish's full name is Billie Eilish Pirate Baird O'Connell. Her first name is in honor of her maternal grandfather, William; the second was inspired by a conjoined twin her parents saw in a documentary; and the third came from the insistence of her older brother, Finneas.\n\nRaised in a two-bedroom house in Highland Park, where she and her brother were homeschooled, Eilish was encouraged to pursue her interests in dance, gymnastics, horseback riding and especially music. She learned to play the Beatles' 'I Will' on the ukulele at age 6; joined Los Angeles Children's Chorus at age 8; and began writing songs in earnest by age 11, her talents nurtured through her mother's songwriting class. Eilish has said her first 'real' song, 'Fingers Crossed,' was penned around that time after watching an episode of The Walking Dead.\n\n**Brother Finneas**\n\nThe elder sibling by four-and-a-half years, Finneas became his sister's indispensable collaborator, co-writer and producer, the pair continuing to compose and record together from a bedroom in their Highland Park home even after Eilish's emergence as a global phenomenon.\n\n'Probably 75-80 percent of the songs are written with us sitting next to each other at a piano or with a guitar, singing a melody together,' he told Variety in 2019. 'It's like a relay race — we really feel like we both have to kill our portion of it to get to the finish line.'\n\nFinneas, who released the solo EP Blood Harmony in October 2019, has also co-written and produced tracks for other popular artists like Justin Bieber, Selena Gomez and Camila Cabello.").padding().background()
                    
                    NavigationLink {
                        Text("buy")
                    } label: {
                        HStack {
                            Image(systemName: "giftcard.fill")
                            Text("Get for someone").bold()
                        }.padding().padding(.horizontal)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .foregroundColor(.white)
                    }


                }.padding(.top, 188)
            }
            .navigationBarTitle(navigationTitle, displayMode: .inline)
            .navigationBarHidden(true)
            .overlay (
                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
                        Color(colorScheme == .dark ? .black : .white).opacity(0.1).background(.ultraThinMaterial)
                            .frame(height: 90)
                        Text(navigationTitle).bold().padding(10)
                    }
                    Divider()
                    Spacer()
                }
                    .opacity(opacity)
                    .ignoresSafeArea()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
