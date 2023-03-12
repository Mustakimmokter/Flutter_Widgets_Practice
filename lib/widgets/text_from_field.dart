import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/custom_button.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key}) : super(key: key);

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: 'Text Form Field',),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Form(
            key: _globalKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email'
                  ),
                  onChanged: (email){
                  },
                  validator: (emailValid){
                    final bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailValid!);
                    if(emailValid == null || emailValid.isEmpty ){
                      return 'Enter your email';
                    }else if(valid){
                      return null;
                    }else{
                      return 'Enter valid email';
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  obscuringCharacter: '*',
                  onChanged: (password){

                  },
                  validator: (passwordValid){
                    if(passwordValid!.length < 6){
                      return 'Password is too short';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  verticalPadding: 14,
                  onTap: (){
                    if(_globalKey.currentState!.validate()){
                      print("Successful");
                    }else{
                      print('Filed');
                    }
                  },
                  title: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
