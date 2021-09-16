class MenuModel {
  String? id;
  String? menu;
  String? text;
  String? icon;
  String? webviewStatus;
  String? link;
  String? content;
  String? status;
  String? position;
  String? parentId;
  String? webLink;
  String? type;


  List<ChildMenu>? childMenu;
  String? hasChild;

  MenuModel({this.id,
    this.menu,
    this.text,
    this.icon,
    this.webviewStatus,
    this.link,
    this.content,
    this.status,
    this.position,
    this.parentId,
    this.webLink,
    this.type,
    this.childMenu,
    this.hasChild});

  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    menu = json['menu']?.toString();
    text = json['text']?.toString();
    icon = json['icon']?.toString();
    webviewStatus = json['webview_status']?.toString();
    link = json['link']?.toString();
    content = json['content']?.toString();
    status = json['status']?.toString();
    position = json['position']?.toString();
    parentId = json['parent_id']?.toString();
    webLink = json['web_link']?.toString();
    type = json['type']?.toString();
    if (json['child_menu'] != null) {
      childMenu = <ChildMenu>[];
      json['child_menu'].forEach((v) {
        childMenu?.add(new ChildMenu.fromJson(v));
      });
    }
    hasChild = json['hasChild']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu'] = this.menu;
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['webview_status'] = this.webviewStatus;
    data['link'] = this.link;
    data['content'] = this.content;
    data['status'] = this.status;
    data['position'] = this.position;
    data['parent_id'] = this.parentId;
    data['web_link'] = this.webLink;
    data['type'] = this.type;
    if (this.childMenu != null) {
      data['child_menu'] = this.childMenu?.map((v) => v.toJson()).toList();
    }
    data['hasChild'] = this.hasChild;
    return data;
  }
}

class ChildMenu {
  String? id;
  String? menu;
  String? text;
  String? icon;
  String? webviewStatus;
  String? link;
  String? content;
  String? status;
  String? position;
  String? parentId;
  String? webLink;
  String? type;
  String? hasChild;

  ChildMenu({this.id,
    this.menu,
    this.text,
    this.icon,
    this.webviewStatus,
    this.link,
    this.content,
    this.status,
    this.position,
    this.parentId,
    this.webLink,
    this.type,
    this.hasChild});

  ChildMenu.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    menu = json['menu']?.toString();
    text = json['text']?.toString();
    icon = json['icon']?.toString();
    webviewStatus = json['webview_status']?.toString();
    link = json['link']?.toString();
    content = json['content']?.toString();
    status = json['status']?.toString();
    position = json['position']?.toString();
    parentId = json['parent_id']?.toString();
    webLink = json['web_link']?.toString();
    type = json['type']?.toString();
    hasChild = json['hasChild']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu'] = this.menu;
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['webview_status'] = this.webviewStatus;
    data['link'] = this.link;
    data['content'] = this.content;
    data['status'] = this.status;
    data['position'] = this.position;
    data['parent_id'] = this.parentId;
    data['web_link'] = this.webLink;
    data['type'] = this.type;
    data['hasChild'] = this.hasChild;
    return data;
  }
}