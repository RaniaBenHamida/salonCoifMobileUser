class DashboardModel {
    Message message;
    Data data;
    String type;

    DashboardModel({
        required this.message,
        required this.data,
        required this.type,
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
    };
}

class Data {
    Instructions instructions;
    UserInfo userInfo;
    int totalTransactions;
    int totalOnlineTransactions;
    int totalCashTransactions;
    int totalTransactionsAmount;
    ProfileImagePaths profileImagePaths;

    Data({
        required this.instructions,
        required this.userInfo,
        required this.totalTransactions,
        required this.totalOnlineTransactions,
        required this.totalCashTransactions,
        required this.totalTransactionsAmount,
        required this.profileImagePaths,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructions: Instructions.fromJson(json["instructions"]),
        userInfo: UserInfo.fromJson(json["user_info"]),
        totalTransactions: json["total_transactions"] ?? 0,
        totalOnlineTransactions: json["total_online_transactions"]??0,
        totalCashTransactions: json["total_cash_transactions"]??0,
        totalTransactionsAmount: json["total_transactions_amount"]??0,
        profileImagePaths: ProfileImagePaths.fromJson(json["profile_image_paths"]),
    );

    Map<String, dynamic> toJson() => {
        "instructions": instructions.toJson(),
        "user_info": userInfo.toJson(),
        "total_transactions": totalTransactions,
        "total_online_transactions": totalOnlineTransactions,
        "total_cash_transactions": totalCashTransactions,
        "total_transactions_amount": totalTransactionsAmount,
        "profile_image_paths": profileImagePaths.toJson(),
    };
}

class Instructions {
    List<String> transactionTypes;
    RecentTransactions recentTransactions;

    Instructions({
        required this.transactionTypes,
        required this.recentTransactions,
    });

    factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
        transactionTypes: List<String>.from(json["transaction_types"].map((x) => x)),
        recentTransactions: RecentTransactions.fromJson(json["recent_transactions"]),
    );

    Map<String, dynamic> toJson() => {
        "transaction_types": List<dynamic>.from(transactionTypes.map((x) => x)),
        "recent_transactions": recentTransactions.toJson(),
    };
}

class RecentTransactions {
    String status;

    RecentTransactions({
        required this.status,
    });

    factory RecentTransactions.fromJson(Map<String, dynamic> json) => RecentTransactions(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}

class ProfileImagePaths {
    String baseUrl;
    String pathLocation;
    String defaultImage;

    ProfileImagePaths({
        required this.baseUrl,
        required this.pathLocation,
        required this.defaultImage,
    });

    factory ProfileImagePaths.fromJson(Map<String, dynamic> json) => ProfileImagePaths(
        baseUrl: json["base_url"],
        pathLocation: json["path_location"],
        defaultImage: json["default_image"],
    );

    Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "path_location": pathLocation,
        "default_image": defaultImage,
    };
}

class UserInfo {
    int id;
    String firstname;
    String lastname;
    String fullname;
    String username;
    String email;
    dynamic image;
    dynamic mobileCode;
    dynamic mobile;
    dynamic fullMobile;
    int emailVerified;
    int twoFactorVerified;
    int twoFactorStatus;
    dynamic twoFactorSecret;

    UserInfo({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.fullname,
        required this.username,
        required this.email,
        required this.image,
        required this.mobileCode,
        required this.mobile,
        required this.fullMobile,
        required this.emailVerified,
        required this.twoFactorVerified,
        required this.twoFactorStatus,
        required this.twoFactorSecret,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        fullname: json["fullname"],
        username: json["username"],
        email: json["email"],
        image: json["image"]??"",
        mobileCode: json["mobile_code"]??"",
        mobile: json["mobile"]??"",
        fullMobile: json["full_mobile"]??"",
        emailVerified: json["email_verified"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"],
        twoFactorSecret: json["two_factor_secret"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "fullname": fullname,
        "username": username,
        "email": email,
        "image": image,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "full_mobile": fullMobile,
        "email_verified": emailVerified,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "two_factor_secret": twoFactorSecret,
    };
}

class Message {
    List<String> success;

    Message({
        required this.success,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
    };
}
