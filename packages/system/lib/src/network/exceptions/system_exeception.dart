class SystemDioException implements Exception {
  String? title;
  String? subTitle;
  SystemDioException({this.title, this.subTitle});
}

class ConnectionDioExcepition extends SystemDioException {
  ConnectionDioExcepition()
      : super(
          title: "Erro de conexão",
          subTitle:
              "Verifique se você está conectado em alguma rede e tente novamente.",
        );
}

class UnknownDioExcepition extends SystemDioException {
  UnknownDioExcepition()
      : super(
          title: "Erro inesperado!",
          subTitle:
              "Algo inesperado aconteceu, espere alguns minutos e tente novamente.",
        );
}

class InvalidTokenDioExcepition extends SystemDioException {
  InvalidTokenDioExcepition()
      : super(
          title: "Sua sessão expirou",
          subTitle: "Para sua segurança faça login novamente.",
        );
}

class EmptyTokenDioExcepition extends SystemDioException {
  EmptyTokenDioExcepition()
      : super(
          title: "Token vazio",
          subTitle: "O token de acesso do usuário não foi informado.",
        );
}

class InvalidPasswordDioExcepition extends SystemDioException {
  InvalidPasswordDioExcepition()
      : super(
          title: "Matrícula ou senha incorreta.",
          subTitle: "Tente novamente.",
        );
}

class InvalidCepSystemDioException extends SystemDioException {
  InvalidCepSystemDioException()
      : super(
          title: "CEP inválido!",
          subTitle: "Verifique e tente novamente.",
        );
}

class CepNotFoundDioExeption extends SystemDioException {
  CepNotFoundDioExeption()
      : super(
          title: "CEP não encontrado!",
          subTitle: "Verifique e tente novamente.",
        );
}

class UploadDioExcepition extends SystemDioException {
  UploadDioExcepition()
      : super(
          title: "Erro de upload!",
          subTitle:
              "Não foi possível subir o arquivo ou imagem, tente novamente mais tarde.",
        );
}

class DeleteUploadedPhotoDioExcepition extends SystemDioException {
  DeleteUploadedPhotoDioExcepition()
      : super(
          title: "Erro ao deleter imagem!",
          subTitle: "Tivemos um problema interno, tente novamente mais tarde.",
        );
}

class FirstAccessDioExcepition extends SystemDioException {
  final String? moodleToken;

  FirstAccessDioExcepition({
    this.moodleToken,
  }) : super(
          title: "Primeiro acesso ao app",
          subTitle: "Aceite os termos e as permissões para criar sua conta",
        );
}
