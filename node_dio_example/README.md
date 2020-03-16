There's two existing folders, the "dio_node_example" which contains the flutter application that will consume the REST API, and the "node_rest_api", which is the API.
For a proper test you will need to change two files in the Flutter project, which are "contacts_repository.dart" and the "login_repository.dart", in both you need to change the address that the API is hosted.
In my case it was 'http://192.168.1.4:3000/login', if you're using a MacOS based computer, you can just change the "192.168.1.4:" to "localhost:" ('http://localhost:3000/login') and it will work just fine.
If you're on windows there's two cases:
1. You're using the emulator.
2. You're using a real device.
For the case 1, you can simply change the "192.168.1.4:" address to "10.0.2.2:" ('http://10.0.2.2:3000/login'), AVD uses 10.0.2.2 as an alias to your host loopback interface.
For the case 2, you can try two things:
- Change the "192.168.1.4:" address to "127.0.0.1" ('http://127.0.0.1:3000/login').
- If it doesn't work then you will need to use your IPv4 address, to get this address:
Open the cmd and type ipconfig, it should list show some information about your network, as I said, you need the IPv4 address, copy it and again you should change the "192.168.1.4:" to your IPv4 address, which in my case was "192.168.1.4:"(resulting 'http://192.168.1.4:3000/login').
