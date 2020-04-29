import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/instruction.dart';
import 'models/item_drawer.dart';

const Color product_background = Color(0xfff0f4f8);
const Color shadow_color = Color(0xffdce8f7);
const Color background = Color(0xfff9f9f9);
const Color btn_color = Color(0xff4D79D7);
const Color text_color = Color(0xff788a9b);
//const Color text_color_country = Color(0xff868787);
const Color text_color_country = Color(0xff707070);
const Color text_color_red = Color(0xffFF0000);
const Color text_color_price = Color(0xff282C40);
const Color wishlist_avatar_background = Color(0xffd5def0);
const Color wishlist_text_light = Color(0xff6f727f);
const Color bag_item_delete_container_color = Color(0xffA6BCD0);
const Color bag_item_minus_container_color = Color(0xffc2cfee);
const Color description_color = Color(0xff515151);
const Color bag_item_minus_pressed_color = Color(0xff557ad0);
const Color background_transparent = Color(0xffF5F5F5);
const Color icon_color = Color(0xff748A9D);
const Color speed_text_color = Color(0xffA6BCD0);
const Color speed_container_color = Color(0xffDBE2ED);
const Color instruction_btn_color = Color(0xff00A3E1);
const Color instruction_back_btn_color = Color(0xffD0F1FF);
const Color instruction_indicator_color = Color(0xff1579B9);
const Color instruction_indicator_unselect_color = Color(0xffEFF1F8);
const Color register_text_color = Color(0xff242126);
const Color code_text_color = Color(0xff0F1950);
const Color drawer_color = Color(0xffE8EBF2);
const Color card_color = Color(0xff00447E);

const String url = 'http://postman.cout.uz/api/v1/CtmTmHOFkP';



List<Instruction> instructions = [
  Instruction(
      imageUrl: 'assets/images/Illustration.png',
      description: 'Lorem esdgrtdfgtrddfmdkergmfdkcmdgkfmdkrgmfkcxmkfmvckdzmsfkcmdskfmkdsf'),
  Instruction(
      imageUrl: 'assets/images/illustration2.png',
      description: 'Lorem esdgrtdfgtrddfmdkergmfdkcmdgkfmdkrgmfkcxmkfmvckdzmsfkcmdskfmkdsf'),
  Instruction(
      imageUrl: 'assets/images/illustration3.png',
      description: 'Lorem esdgrtdfgtrddfmdkergmfdkcmdgkfmdkrgmfkcxmkfmvckdzmsfkcmdskfmkdsf'),
];

List<ItemDrawer> drawerItems = [
  ItemDrawer(
      title: 'Change supplier', imageUrl: 'assets/images/supplier.png'),
  ItemDrawer(
      title: 'All categories', imageUrl: 'assets/images/categories.png'),
  ItemDrawer(
      title: 'My cards & wallets', imageUrl: 'assets/images/cards.png'),
  ItemDrawer(title: 'Address', imageUrl: 'assets/images/address.png'),
  ItemDrawer(title: 'Wishlist', imageUrl: 'assets/images/wishlist.png'),
  ItemDrawer(title: 'My orders', imageUrl: 'assets/images/orders.png'),
  ItemDrawer(title: 'Call-center', imageUrl: 'assets/images/call_center.png'),
  ItemDrawer(title: 'F.A.Q', imageUrl: 'assets/images/questions.png'),
  ItemDrawer(title: 'Public offer', imageUrl: 'assets/images/offers.png'),
  ItemDrawer(title: 'Language', imageUrl: 'assets/images/language.png'),
  ItemDrawer(title: 'My Profile', imageUrl: 'assets/images/profile.png'),
  ItemDrawer(title: 'Log out', imageUrl: 'assets/images/log_out.png'),
];


const List<String> regions = [
  'Region',
  'Andijan',
  'Bukhara',
  'Fergana',
  'Jizzakh',
  'Xorazm',
  'Namangan',
  'Navoiy',
  'Qashqadaryo',
  'Samarqand',
  'Sirdaryo',
  'Surxondaryo',
  'Tashkent region',
  'Karakalpakstan',
  'Tashkent',

];

const shopping_bag_text_style = TextStyle(fontSize: 20, color: text_color);
const futura_style = TextStyle(fontFamily: 'Futura', fontSize: 15, color: text_color_country);
const futura_bold_style = TextStyle(fontFamily: 'Futura', fontSize: 15,fontWeight: FontWeight.bold, color: text_color_country);
const kTabStyle = TextStyle(
    fontFamily: 'Lintel',
    fontSize: 16,
    fontWeight: FontWeight.w600);