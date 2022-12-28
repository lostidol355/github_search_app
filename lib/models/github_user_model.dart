class GithubUser {
  String? avatar;
  String? userName;
  String? joinDate;
  String? bio;
  String? location;
  String? blog;
  String? twitter;
  String? company;
  GithubUser({
    this.avatar,
    this.userName,
    this.joinDate,
    this.bio,
    this.location,
    this.blog,
    this.twitter,
    this.company,
  });

  GithubUser.fromJson(Map<String, dynamic> apidata){

    avatar = apidata['avatar_url'];
    userName = apidata['login'];
    joinDate = apidata['created_at'];
    bio = apidata['bio'];
    location = apidata['location'];
    blog = apidata['blog'];
    twitter = apidata['twitter_username'];
    company = apidata['company'];
  }

}





