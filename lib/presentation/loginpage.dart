import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('License - Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: new AssetImage('logo.png'), fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset('logo.png'),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //  mainAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'Usuário',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            //Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'Senha',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: Text('Acessar'),
                                //decoration: InputDecoration(
                                //labelText: 'Senha',
                                //border: OutlineInputBorder()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      //    floatingActionButton: FloatingActionButton(
      //      onPressed: () => setState(() {}),
      //      tooltip: 'Increment Counter',
      //      child: const Icon(Icons.add),
      //    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
