class tipo_user {
  int id;
  String tipo;
  tipo_user(this.id, this.tipo);
  static List<tipo_user> getUsers() {
    return <tipo_user>[tipo_user(1, 'Alumno'), tipo_user(2, 'Admin')];
  }
}
