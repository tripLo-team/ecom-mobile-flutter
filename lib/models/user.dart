class User {
  String username;
  String name;
  String profilePicPath;

  User({
    this.username,
    this.name,
    this.profilePicPath,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var userDetail = parsedJson['user'];
    print(userDetail.toString());
    return new User(
        username: userDetail['username'],
        name: userDetail['name'],
        profilePicPath: userDetail['profile_pic_path']);
  }
}
