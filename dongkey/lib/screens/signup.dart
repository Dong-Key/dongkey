import 'package:flutter/material.dart';
import '../widgets/camera.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreedToTerms = false;

  final TextEditingController _IdnumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _PnumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // bool _passwordsMatch = true;

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void _handleSignUp() {
    String id = _idController.text;
    String Idnum = _IdnumController.text;
    String password = _passwordController.text;
    String Pnum = _PnumController.text;
    String address = _addressController.text;
    String name = _nameController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (!agreedToTerms) {
      _showAlertDialog('동의 필요', '개인정보 수집 및 이용에 동의해야 합니다.');
      return;
    }

    if (id.isEmpty ||
        Idnum.isEmpty ||
        password.isEmpty ||
        Pnum.isEmpty ||
        address.isEmpty ||
        name.isEmpty ||
        confirmPassword.isEmpty) {
      _showAlertDialog('입력 오류', '전체 내용을 입력하세요.');
      return;
    }

    if (password != confirmPassword) {
      _showAlertDialog('오류', '비밀번호가 일치하지 않습니다.');
      return;
    }

    // If everything is valid, you can proceed with the signup logic here.
    // Add the code to send data to the server and complete the signup.

    // Example: Send a signup request to the server
    // signUp(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 177, 0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: '이름'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: '비밀번호 확인'),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _PnumController,
                  decoration: InputDecoration(labelText: '전화번호'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _IdnumController,
                  decoration: InputDecoration(labelText: '학번'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: '주소'),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. 수집하는 개인정보'),
                        Text(
                            '(1) 회사는 최초 회원 가입시 원활한 고객상담, 서비스 제공을 위해 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.'),
                        Text('필수항목 : 이메일 주소, 이름(닉네임), 비밀번호'),
                        Text(
                            '선택항목 : 프로필 사진, 회사/단체 이름, 회사/단체 규모, 산업군, 부서, 유형(개인/기업/단체), 지역, 전화번호 등'),
                        Text(
                            '(2) 소셜 계정을 통해 회원가입 시 아래와 같은 정보들이 추가로 수집될 수 있습니다.'),
                        Text('네이버 : 프로필 사진, 나이'),
                        Text('페이스북 : 프로필 사진'),
                        Text('구글 : 프로필 사진'),
                        Text(
                            '(3) 서비스 이용 과정이나 사업처리 과정에서 아래와 같은 정보들이 추가로 수집될 수 있습니다.'),
                        Text(
                            '거래정보 : 개인의 경우 생년월일(정기결제에 한함), 신용카드정보(신용카드번호, 유효기간, 비밀번호 앞 두 자리), 세금계산서 발행을 위한 회계 담당자 정보(이름, 연락처, 이메일주소) 등'),
                        Text(
                            '서비스 이용 정보 : 서명 요청자 및 참여자 정보 (이름, 이메일 주소, 전화번호), 전화번호, IP 주소, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 브라우저 정보, 운영체제 정보(OS), 사용 기기 정보, MAC 주소, 방문 일시 등'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: agreedToTerms,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            agreedToTerms = value;
                          });
                        }
                      },
                    ),
                    Text('개인정보 수집 및 이용에 동의합니다.'),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CameraVerificationPage()),
                      );
                    },
                    child: Text('가입하기'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 177, 0),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
