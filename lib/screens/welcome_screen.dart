import 'package:cashier8/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      padding: EdgeInsets.only(top: 100, bottom: 40),
      decoration: BoxDecoration(
          color: Color(0xFF415F9D),
          image: DecorationImage(
            image: AssetImage('images/motor.png'),
            fit: BoxFit.cover,
            opacity: 0.6,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cashier K3 Helmet",
            style: GoogleFonts.markoOne(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Text(
                "Udah SNI murah lagi",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 80),
              Material(

                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                    child: Text(
                      "Get Start",
                      style: GoogleFonts.roboto(
                        color: Color(0xFF415F9D),
                      ),
                    ),
                  )))
            ],
          )
        ],
      ),
    ));
  }
}
