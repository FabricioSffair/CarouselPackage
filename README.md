# Description

A swiftui carousel component that retrieves page information from a Config.plist file inside your project and displays as a pageview

Below is an example of the Config.plist file that should be created.

<array>
    <dict>
        <key>pageStyle</key>
        <integer>0</integer>
        <key>title</key>
        <string>Introducing Audio Rooms</string>
        <key>message</key>
        <string>We all know video calls can get tiring, so we&apos;ve introduced a new form of room, just for audio. Share stories, music, or just listen to ambient sound while working from home</string>
        <key>image</key>
        <string>image1</string>
        <key>backgroundImage</key>
        <string>bg1</string>
        <key>buttonTitle</key>
        <string>Next</string>
    </dict>
    <dict>
        <key>pageStyle</key>
        <integer>0</integer>
        <key>title</key>
        <string>Smart Noise Cancellation</string>
        <key>message</key>
        <string>Whether it&apos;s the builders or a very local puppy, we know you don&apos;t want to share all ambient noise - so we&apos;ve built in smart noise cancellation to keep your stream zen</string>
        <key>image</key>
        <string>image2</string>
        <key>backgroundImage</key>
        <string>bg2</string>
        <key>buttonTitle</key>
        <string>Next</string>
    </dict>
</array>
