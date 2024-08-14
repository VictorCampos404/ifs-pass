enum FileType {
  appsModules(path: 'templates/apps_modules.txt'),
  homeController(path: 'templates/home_controller.txt'),
  homePage(path: 'templates/home_page.txt'),
  module(path: 'templates/module.txt'),
  routes(path: 'templates/routes.txt');

  final String path;

  const FileType({required this.path});
}
