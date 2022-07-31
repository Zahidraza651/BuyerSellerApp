import 'package:flutter/material.dart';
import 'package:seller_side/home_screen/confirmation.dart';
import '../widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Agreement extends StatefulWidget {
  const Agreement({Key? key}) : super(key: key);

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                AppLocalizations.of(context)!.agreement, //'Agreement',
                style: const TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                InkWell(
                  child: Image.asset('assets/share.png'),
                  onTap: () {},
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          //child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.grey[500],
                                enabledBorder:
                                    OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
                            isExpanded: true,
                            isDense: true,
                            items: null,
                            onChanged: null,
                            //value: 'English',
                            hint: const Text('English'),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ),
                          //)
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: const [
                        Expanded(
                            child: Text(
                          'Vestibulum blandit viverra convallis. Pellentesque ligula urna, fermentum ut semper in, tincidunt nec dui. Morbi mauris lacus, consequat eget justo in, semper gravida enim. Donec ultrices varius ligula. Ut non pretium augue. Etiam non rutrum metus. In varius sit amet lorem tempus sagittis. Cras sed maximus enim, vel ultricies tortor. Pellentesque consectetur tellus ornare felis porta dapibus. Etiam eget viverra ipsum, ac posuere massa. Nam vitae tempor metus. Donec rhoncus, metus ac convallis ultricies, turpis augue vestibulum elit, ut pharetra orci urna quis lectus. Praesent in libero non enim tincidunt imperdiet nec vitae urna. Morbi elementum non enim eget aliquet. Vivamus fermentum quam magna, ac cursus neque pulvinar feugiat. Nulla facilisi.Donec ultrices varius ligula. Ut non pretium augue. Etiam non rutrum metus. In varius sit amet lorem tempus sagittis. Cras sed maximus enim, vel ultricies tortor. Pellentesque consectetur tellus ornare felis porta dapibus.',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.grey),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: AppButton(
                                text: AppLocalizations.of(context)!.accept, //'Accept',
                                textColor: Colors.white,
                                color: const Color(0xff128383),
                                onpressed: () {
                                  //TODO code for accept agreement
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const Confirmation()));
                                },
                              ),
                            )),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AppButton(
                                  text: AppLocalizations.of(context)!.reject, //'Reject',
                                  textColor: Colors.white,
                                  color: Colors.grey[400],
                                  onpressed: () {
                                    //TODO code for reject agreement
                                  },
                                ))),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
