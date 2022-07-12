import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/dimen_const.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);
Widget horizontalSpaceCustom({required double width}) => SizedBox(width: width);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceGiant = SizedBox(height: 80.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);
Widget verticalSpaceCustom({required double height}) =>
    SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenHeightPercentage(
  BuildContext context, {
  required double percentage,
}) {
  return screenHeight(context) * percentage;
}

double screenWidthPercentage(
  BuildContext context, {
  required double percentage,
}) {
  return screenWidth(context) * percentage;
}

const EdgeInsetsGeometry paddingRegular = EdgeInsets.all(Dimens.defaultPadding);
const EdgeInsetsGeometry paddingSmall = EdgeInsets.all(Dimens.smallPadding);
const EdgeInsetsGeometry paddingSmallCustom = EdgeInsets.only(
    left: Dimens.smallPadding,
    top: Dimens.size4,
    bottom: Dimens.size4,
    right: Dimens.smallPadding);
const EdgeInsetsGeometry paddingRegularHorizontal = EdgeInsets.symmetric(
  horizontal: Dimens.defaultPadding,
);

const EdgeInsetsGeometry paddingTabHorizontal = EdgeInsets.symmetric(
  horizontal: Dimens.smallPadding,
);

const EdgeInsetsGeometry paddingButton = EdgeInsets.only(
    left: Dimens.massivePadding,
    right: Dimens.massivePadding,
    bottom: Dimens.size8,
    top: Dimens.size8);

const EdgeInsetsGeometry paddingZero = EdgeInsets.all(0);
const EdgeInsetsGeometry padding8 = EdgeInsets.all(Dimens.size8);
const EdgeInsetsGeometry padding4 = EdgeInsets.all(Dimens.size4);

final borderSmall = BorderRadius.circular(Dimens.smallPadding);
final borderLarge = BorderRadius.circular(Dimens.size30);
