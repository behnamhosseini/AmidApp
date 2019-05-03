import 'package:amid_app/components/InputFields.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final formKey;
  final emailOnSaved;
  final passwordOnSaved;
  final type;
  final nameOnSaved;
  FormContainer({@required this.formKey, this.emailOnSaved , this.passwordOnSaved,this.type, this.nameOnSaved });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        children: <Widget>[
          new Form(
            key : formKey,
            child: new Column(
              children: <Widget>[
                type == 'signup' 
                ? new InputFieldArea(
                    hint: "نام ",
                    obscure: false,
                    icon : Icons.person_add,
                    validator: (String value) {
                      if(value.length > 30) {
                        return 'نام  نمیتواند بیشتر از30 کاراکتر باشد';
                      }
                    },
                    onSaved : nameOnSaved
                  )
                : Text(''),
                new InputFieldArea(
                  hint: "نام کاربری",
                  obscure: false,
                  icon : Icons.person_outline,
                  validator: (String value) {
                    if(value.length < 5) {
                      return 'نام کاربری نمیتواند کمتر از5 کاراکتر باشد';
                    }
                  },
                  onSaved : emailOnSaved
                ),
                new InputFieldArea(
                  hint: "پسورد",
                  obscure: true,
                  icon: Icons.lock_open,
                  validator: (String value) {
                    if(value.length < 8) {
                      return 'طول پسورد باید حداقل 8 کاراکتر باشد';
                    }
                  },
                  onSaved : passwordOnSaved
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}