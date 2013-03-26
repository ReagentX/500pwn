500pwn
======

  A super simple client and iOS app that circumvents 500px's user registration and allow those accounts to favorite and vote on a specific photo. This is for demonstration purposes only – I really want 500px to fix this bug.

  Huge thanks to @ChristopoulosZ for helping me out, both with the network sniffing and the HTML-scraping libraries. You're awesome, dude.

  It's a pretty simple app, just get the URL of the photo (ex http://500px.com/photo/29169709) and paste it into the iOS app. Then choose the number of repetitions to do, and tap run. It will create that many accounts and like and favorite each photo automatically.

  Make sure that the extra tags on the URL aren't there, I haven't tested the app with them (ex http://500px.com/photo/29172001?from=popular&from_page=1). Only take the URL going up to the photo ID, or (http://500px.com/photo/29172001).

Thanks, and remember to follow me on Twitter @rxcs and ADN @css!
