class SellEvent {}

class AmbilDataSellBloc extends SellEvent {
  final String idCabang;
  final String filterIDKategori;

  AmbilDataSellBloc({required this.idCabang, required this.filterIDKategori});
}
