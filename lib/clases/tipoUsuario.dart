class Tipo_User {
  int id;
  String tipo;
  Tipo_User(this.id, this.tipo);
  static List<Tipo_User> getUsers() {
    return <Tipo_User>[
      Tipo_User(1, 'Estudiante'),
      Tipo_User(2, 'Administrativo')
    ];
  }
}
