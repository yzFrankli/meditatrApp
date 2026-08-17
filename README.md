# Meditatr IOS App
This is an IOS application created by me during summer 2025.

## About
This app is for meditating and focusing. It has a Pomodoro timer for focusing and meditating with bells at the end of the session, a guided breathing exercise, and a dedicated section consisting guided tracks and courses for people to listen to. I used Apple account login for authentication and Supabase that stores the UUID of each logged user. The app supports English and Chinese and the translation was implemented via the native Xcode multilingual feature. I also used Github as the backend server to store various meditation tracks and JSON formatted data for simplicity sake. Towards the end of the project, I moved from Swift and Xcode to Flutter and Riverpod which support just-in-time compilation and state management. Since I started from scratch knowing nothing about Swift, I used almost 1 and half month for the whole project. I have spent couple of days drawing inspiration on Figma but the majority of my time was spent watching Youtube tutorials and online documentation learning Swift, Xcode and Flutter. Overall, it was definitely a challenging project but I feel it is worth it in the end when you see the app running on your phone. I was also able to deploy it live in the App Store for others to download which gave me lots of satisfaction whenever I saw someone else using it. This was also my first large project so I learned a lot about planning and maintaining codebase.

## Run
To run the code, clone the repository on your laptop and open it with Xcode. 

## Inspiration
The project was created partly out of boredom but also partly because I thought meditation is a great way to help me stay grounded. I have tried other meditation apps but I feel they are overly complicated so this was my solution. As such, my overarching goal was trying to make this as simple and intuitive as possible with only the most essential functions.

## References
I have watched many Youtube tutorials on creating Xcode apps, especially CodeWithChris for Swift development. The documentation by Swift.org was also very helpful in understanding the fundamentals. Youtube also helped me with connecting Flutter with Supabse and Riverpod, as well as stringify Json using Swift. [Here](https://github.com/yzFrankli/Meditatr_flutter_app/tree/main) is the updated Flutter version of the App.
