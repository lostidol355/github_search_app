class GithubUser {
  String? avatar;
  String? userName;
  String? joinDate;
  String? bio;
  String? location;
  String? blog;
  String? twitter;
  String? company;
  String? name;
  int? followers;
  int? following;
  int? publicRepos;

  GithubUser({
    this.name,
    this.avatar,
    this.userName,
    this.joinDate,
    this.bio,
    this.location,
    this.blog,
    this.twitter,
    this.company,
    this.followers,
    this.following,
    this.publicRepos,
  });

  GithubUser.fromJson(Map<String, dynamic> apidata) {
    name = apidata['name'];
    avatar = apidata['avatar_url'];
    userName = apidata['login'];
    joinDate = apidata['created_at'];
    bio = apidata['bio'];
    location = apidata['location'];
    blog = apidata['blog'];
    twitter = apidata['twitter_username'];
    company = apidata['company'];
    followers = apidata['followers'];
    following = apidata['following'];
    publicRepos = apidata['public_repos'];
  }
}
