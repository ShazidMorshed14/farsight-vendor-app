import 'package:farsight_vendor_app/foundation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sp_icon/sp_icon.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      this.assetname,
      required this.title,
      this.subtitle,
      this.isLast});

  final String? assetname;
  final String title;
  final String? subtitle;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 68,
          child: ListTile(
            leading: assetname != null
                ? SPIcon(
                    assetname: assetname!,
                  )
                : null,
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : null,
            trailing: InkWell(
              onTap: () => {},
              child: const Icon(
                CupertinoIcons.chevron_forward,
                size: 18,
              ),
            ),
          ),
        ),
        Visibility(
            visible: isLast == null,
            child: Divider(
              color: AppColor.captionColor,
            ))
      ],
    );
  }
}
