import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Elias'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {},
          ),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(child: Text('Dinero en efectivo')),
              const PopupMenuItem(child: Text('Dinero en tarjeta de credito')),
              const PopupMenuItem(child: Text("Dinero en el banco")),
            ];
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              "$clickCounter",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 100,
                fontStyle: FontStyle.italic,
                textBaseline: TextBaseline.ideographic,
                fontWeight: FontWeight.w200,
              ),
            ),

            // Otra alternativa a hacer un if, para decidir si dice Click o Clicks es usar operadores ternarios
            Text("Click${clickCounter == 1 ? '' : 's'}",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ))

            /*
                if(clickCounter == 1)
                  Text("Click", style: const TextStyle( fontSize: 10))
              
                if(clickCounter != 1)
                  Text("Clicks", style: TextStyle(fontSize: 10))
                
                */
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 8.8),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
          const SizedBox(
            height: 8.8,
          ),
          CustomButton(
            icon: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  // Esto es un Widget personalizado, para usarlo varias veces en botones
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
