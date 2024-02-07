import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel{
    String answer;
    String image;
    bool forced;

    YesNoModel({required this.answer,required this.image, required this.forced});

    factory YesNoModel.fromJson(Map<String, dynamic> json){
        return YesNoModel(
            answer: json['answer'],
            image: json['image'],
            forced: json['forced']
        );
    }


    Message toMessageEntity()=> Message(text: answer, fromWho: FromWho.other, imageUrl: image);

  }