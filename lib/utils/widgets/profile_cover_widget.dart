import 'package:flutter/material.dart';
import 'package:intern2grow_auth/utils/shared/methods.dart';

class ProfileAndCoverWidget extends StatelessWidget {
  const ProfileAndCoverWidget({super.key, required this.isProfileScreen});
  final bool isProfileScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizes.geWidth(context) * .65,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: ScreenSizes.geWidth(context) * .5,
            width: double.infinity,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/7cae/37ff/9b59ad87ea16563c67f2fc021e5fedbb?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QpBkYttbMZ5nCy2NLtlZ9gx4kLeYa5aK5rVMrkshnQMzkH~OyokwvA-OoVs~im6mkZJmlRi~nfUYntI8~fYLZnSmdr4CTHbfifqobpXjAoCS6urjpAFzkU2hohgXJitPCR0vBcD8YSnbtPGy7QfJifQ84Q7Ja6xAjRaMyL4qb4-OKba5W-qv6Ab0w0Wuzk7-At-dODLs7NE05Z3Fv~VjRfYWnP0-Vaw-mp2LOcZvaTVqgboSD3W0RK95xLA65c5uRnUS9YPpbo-Eex7zjjbkvkLuSt4yGHr7NdxhwiiQ4xfCmtmEEWC9sPV~vy4GL2tqTp8amU96fKKbmqbuUxIjYA__')),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenSizes.geWidth(context) * .3,
              width: ScreenSizes.geWidth(context) * .3,
              decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromARGB(255, 123, 123, 123),
                      offset: Offset(0, 1),
                      blurStyle: BlurStyle.normal,
                      blurRadius: BorderSide.strokeAlignCenter,
                    )
                  ],
                  image: DecorationImage(
                      image: NetworkImage(isProfileScreen
                          ? 'https://s3-alpha-sig.figma.com/img/9517/ba9f/1824ae42bf0c2bc933f601819a4f0c91?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MPEQM3qMktBmnpO3LORQLSEz4ukzkK27l-aUmputOFR4up3Znf0DmJo8blyx2aDEWj9MEiqJENri5yrikxWcuH9BKFUbGdt8zMs~k801hi~2b5pmU7uoQvjlxpSLzNKu0uRXibx7AF9yMMfd5yupcHuXwSfQ2BwRBjGBBkqRPLjqedlEXfp9TSkN8Sn33B1zy4Z2MgBDzVNe-Knosi0j95WdHJ5IFUxgoCSyzjUu0GbyK75-cDJHtIMwwxuhmekrp6sYLe1na~RWWAZPC4VUXNUJPK57V4VInS5txf5ASZq4xveN-Yz8qPR8x-N47s91m2LPLzTO3uo-WfoqHeisvA__'
                          : 'https://s3-alpha-sig.figma.com/img/e703/cfc0/451e953204e8b70f44fb0ec4271b0e89?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NFlHCzmHqS1AlEW2fFPJrpg20N-7Bb1nXHr4442Bhyp6-n-3kwFyN3~NH2PtTdiZxNezxmFsf5vgqN3hFtpZk5yTSAfiqjU8I4~Fa3LQpVY8L8p7Q6SFqvaTDOl5pFXeengzFHtcY1ZrU0b3JBfYh2lZmbYQaiE7Tggq8Zbp5TF8PS2eCgJ87J7UdkGIFQFRsyx0fx0oeuK7nee7Ycl1sSMbCR8UulOY0pFfts~R5m~VWWB3DzRvCtyDlYS-9-z0QwnGqk1MKWSBhx5jZZPDLVky06oEozhXtkcDHuDt7KztxarCtn3KEp7L~mc2CnHvOFUpUilelRUtpojC5bGoRA__')),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
