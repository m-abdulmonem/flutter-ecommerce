class ProfileModel {
  String? phoneNumber,photoURL,providerData,refreshToken,tenantId,uid;
  String? email,displayName;
  Metadata? metadata;
  bool? emailVerified,isAnonymous;

  ProfileModel(
      {this.email,
        this.displayName,
        this.emailVerified,
        this.isAnonymous,
        this.metadata,
        this.phoneNumber,
        this.photoURL,
        this.providerData,
        this.refreshToken,
        this.tenantId,
        this.uid});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    displayName = json['displayName'];
    emailVerified = json['emailVerified'];
    isAnonymous = json['isAnonymous'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    phoneNumber = json['phoneNumber'];
    photoURL = json['photoURL'];
    providerData = json['providerData'];
    refreshToken = json['refreshToken'];
    tenantId = json['tenantId'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['emailVerified'] = this.emailVerified;
    data['isAnonymous'] = this.isAnonymous;
    if (this.metadata != null) {
      data['metadata'] = this.metadata?.toJson();
    }
    data['phoneNumber'] = this.phoneNumber;
    data['photoURL'] = this.photoURL;
    data['providerData'] = this.providerData;
    data['refreshToken'] = this.refreshToken;
    data['tenantId'] = this.tenantId;
    data['uid'] = this.uid;
    return data;
  }
}

class Metadata {
  String? creationTime, lastSignInTime;

  Metadata({this.creationTime, this.lastSignInTime});

  Metadata.fromJson(Map<String, dynamic> json) {
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creationTime'] = this.creationTime;
    data['lastSignInTime'] = this.lastSignInTime;
    return data;
  }
}