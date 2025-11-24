class Carro {
  String id;
  String placa;
  String marca;
  String modelo;
  String ano;
  String combustivel;
  String quilometragem;
  String idCliente;
  String idOficina;
  String carroceria;
  String? banner;

  Carro({
    required this.id,
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.combustivel,
    required this.quilometragem,
    required this.carroceria,
    required this.idCliente,
    required this.idOficina,
    this.banner
  });

  factory Carro.fromMap(Map<String, dynamic> data, String id) {
    return Carro(
      id: id,
      placa: data['Placa'] ?? '',
      marca: data['marca'] ?? '',
      modelo: data['modelo'] ?? '',
      ano: data['ano'] ?? '',
      combustivel: data['combustivel'] ?? '',
      quilometragem: data['quilometragem'] ?? '',
      carroceria: data['carroceria'] ?? '',
      idCliente: data['id_Cliente'] ?? '',
      idOficina: data['id_Oficina'] ?? '',
      banner: data['banner'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'Placa': placa,
    'marca': marca,
    'modelo': modelo,
    'ano': ano,
    'combustivel': combustivel,
    'quilometragem': quilometragem,
    'carroceria': carroceria,
    'id_Cliente': idCliente,
    'id_Oficina': idOficina,
    'banner' : banner,
  };
}