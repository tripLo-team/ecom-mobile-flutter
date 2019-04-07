import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:ecom_mobile_flutter/widgets/common/rounded_image.dart';
import 'package:ecom_mobile_flutter/scoped_models/user_scoped.dart';

class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserDetailScopedModel userDetailModel = UserDetailScopedModel();
    userDetailModel.getUserDetail(id: 1);

    return new ScopedModel<UserDetailScopedModel>(
        model: userDetailModel,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 40.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Account Detail",
            ),
          ),
          body: UserDetailPageBody(),
          bottomNavigationBar: null,
        ));
  }
}

class UserDetailPageBody extends StatelessWidget {
  BuildContext context;
  UserDetailScopedModel model;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserDetailScopedModel>(
        builder: (context, child, model) {
      this.model = model;
      return model.isLoading
          ? _buildCircularProgressIndicator()
          : Column(
              children: <Widget>[_userPic(), _userDetail()],
            );
    });
  }

  _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _userPic() {
    return Container(
        margin: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: RoundedImage(imgPath: model.userDetail.profilePicPath)));
  }

  _userDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: <Widget>[
          Text(model.userDetail.username),
          Text(model.userDetail.name)
        ],
      ),
    );
  }
}
