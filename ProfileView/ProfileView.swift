//
//  ProfileView.swift
//  Meditatr
//
//  Created by Frank on 3/16/25.
//

import SwiftUI
import UserNotifications

// this function asks permission for notification


struct ProfileView: View {
    @State var language = 0
    @State var reminder = false
    @State var Name: String = "Default User"
    @State var LogoutAlert = false
    
    func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                    if granted {
                        print("Notification access granted")
                    } else {
                        print("Notification access denied. \(String(describing: error?.localizedDescription))")
                    }
                }
                return
            case .denied:
                print("Notification access denied")
                return
            case .authorized:
                print("Notification access granted")
                return
            default:
                return
            }
        }
    }
    
//    func presentAlert() {
//        let alert = UIAlertController(title: "Title", message: "message", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in _in
//            print("OK button tapped")
//        }))
//    }

    func createLocalNotification(title: String, body: String, timeInterval: DateComponents, identifier: String) {
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: timeInterval, repeats: true)
//        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // remove previous pending notification with the same identifier
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [identifier])
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification \(content.title) added")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section{
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    
                                }) {
                                    Image(.profile)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                }
                                Spacer()
                                Text(Name)
                                    .font(.title)
                                    .fontDesign(.rounded)
                                Spacer()
                                Spacer()
                            }
                            
                        }
                    }
                    Section("General") {
                        LabeledContent("Name", value: Name)
                        
                        
                        Picker("Language", selection: $language) {
                            Text("English").tag(0)
                            Text("Chinese").tag(1)
                            Text("Spanish").tag(2)
                        }
                    }
                    Section("Habits") {
                        NavigationLink("Sessions", destination: SessionView())
                        Toggle(isOn: $reminder, label: {
                            Text("Daily Reminder")
                        })
                    }
                    .onChange(of: reminder, initial: false, { oldValue, newValue in
                        if reminder {
                            let _: () = requestNotificationAuthorization()
                            var dateComponent = DateComponents()
                            dateComponent.hour = 11
                            dateComponent.minute = 40
                            let _: () = createLocalNotification(
                                title: "Daily Reminder",
                                body: "Don't forget to meditate today",
                                timeInterval: dateComponent,
                                identifier: "dailyTask1"
                            )
                        }
                    })
                    
                    Section {
                        Button("Log Out") {
                            LogoutAlert = true
                        }
                        .alert(isPresented: $LogoutAlert) {
                            Alert (
                                title: Text("Logout?"),
                                message: Text("You progress might not be saved"),
                                primaryButton: .default(
                                    Text("Cancel")
                                    
                                ),
                                secondaryButton: .destructive(Text("Log Out")) {
                                        
                                    }
                                )
                        }.fullScreenCover(isPresented: $LogoutAlert, content: {
                            WelcomeView()
                                
                        })
//                        .onChange(of: , <#T##action: (Equatable, Equatable) -> Void##(Equatable, Equatable) -> Void##(_ oldValue: Equatable, _ newValue: Equatable) -> Void#>)
                    }
                }
            }.navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
