Future<void> appeler(String name) async {
  var a = await Future.delayed(Duration(seconds: 5), () => "Salut $name !");
  print(a);
}

Future<void> compter(int n) async {
  for (var i = 1; i <= n; i++) {
    await Future.delayed(
      Duration(seconds: 1),
      () => print("$i"),
    );
  }
}

Future<void> reciter(List<String> liste) async {
  for (var letter in liste) {
    await Future.delayed(Duration(seconds: 1), () => print(letter));
  }
}

Future<void> main() async {
  print("----- UN EXEMPLE DE PROGRAMMATION ASYNCHRONE AVEC DART -----");
  print("----- Begin -----");
  // var message;
  appeler("AndySmart");
  reciter(["a", "b", "c", "d", "e", "f", "g"]);
  compter(10).then(
    (value) async => {
      await Future.delayed(Duration(seconds: 1), () => print("--- FIN ---"))
    },
  );
  print("TROIS PROCESS EN COURS ...");
}
