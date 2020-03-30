# ios-core-sdk
# Integration

1. Drag and drop GedditCoreSDK framework or add it as a subproject. 
2. Go to Target -> General -> Frameworks and Libraries and choose 'Do Not Embed' option.
3. Initialize CoreSDK:
```
let coreSDK = GedditCore(appID: "GEDDIT_APP_ID", appSecret: "GEDDIT_APP_SECRET", verbose: true)
```
4. Validate SDK by calling validate() 

```
coreSDK.validate { success in 
}
```

5. On success you can login:
```
self.coreSDK.login(userSettings: UserSettings(userId: "12345", name: "TestUser")) { success in
}
```

6. Open socket and listen events:

```
guard let socket = coreSDK.socketManager else {
  return
}

socket.connect { success in 
}

socket.subscribe(once: "connection") { (result: [String: Any]) in
}


socket?.emit("registration", params: [
        "userId": "CLIENT_USER_ID",
        "language": "en",
        "appId": "GEDDIT_APP_ID"
      ])

```