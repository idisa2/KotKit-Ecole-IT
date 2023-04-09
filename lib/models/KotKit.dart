import 'package:flutter_auth/models/user.dart';

class KotKit {
    AppUser? app_user;
    String? created_at;
    String description;
    int id;
    String image;
    String tags;
    String title;
    String video;

    KotKit({ this.app_user, this.created_at, required this.description,  this.id = 0, required this.image, required this.tags, required this.title, required this.video});

    factory KotKit.fromJson(Map<String, dynamic> json) {
        return KotKit(
            app_user: json['app_user'] != null ? AppUser.fromJson(json['app_user']) : null, 
            created_at: json['created_at'], 
            description: json['description'], 
            id: json['id'], 
            image: json['image'], 
            tags: json['tags'], 
            title: json['title'], 
            video: json['video'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['id'] = this.id;
        data['image'] = this.image;
        data['tags'] = this.tags;
        data['title'] = this.title;
        data['video'] = this.video;
        if (this.app_user != null) {
            data['app_user'] = this.app_user?.toJson();
        }
        return data;
    }



}