import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LogIn
  {
    'zpvh82w7': {
      'en': 'MICROAPP',
      'hi': 'माइक्रोएप',
    },
    '294jg7fl': {
      'en': 'Tiny App , Big Impact',
      'hi': 'छोटा ऐप, बड़ा प्रभाव',
    },
    'b8z86j7t': {
      'en': 'MICROAPP',
      'hi': 'माइक्रोऐप',
    },
    'livhh34d': {
      'en': 'Tiny App , Big Impact',
      'hi': 'छोटा ऐप, बड़ा प्रभाव',
    },
    'us0wkkiz': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
    },
    'nbhcunl4': {
      'en': 'Email Address',
      'hi': 'मेल पता',
    },
    'qrca6d0i': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
    },
    'z0djpc74': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    '2kdaw8yx': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
    },
    '2gdz5k9b': {
      'en': 'FORGOT PASSWORD ?',
      'hi': 'पासवर्ड भूल गए ?',
    },
    'e1gi9yvl': {
      'en': 'Log In',
      'hi': 'लॉग इन करें',
    },
    'vl9qfsur': {
      'en': 'Developed By Elde',
      'hi': 'एल्डे द्वारा विकसित',
    },
    'i6ihzo84': {
      'en': 'Version.',
      'hi': 'संस्करण।',
    },
    '5yitx7ta': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ug6ee9yl': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '8pr06m2r': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '4qz7xte2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'orl2lxvc': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ForgotPassword
  {
    'azxllruu': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
    },
    'u5eh1wsq': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
    },
    'tllrdv91': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi':
          'हम आपको आपका पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबंधित ईमेल दर्ज करें।',
    },
    'twvhf1uc': {
      'en': 'Your email',
      'hi': 'आपका ईमेल',
    },
    'a3dn1c2p': {
      'en': 'Enter your email to recieve a linke...',
      'hi': 'लिंक प्राप्त करने के लिए अपना ईमेल दर्ज करें...',
    },
    '71obflln': {
      'en': 'Send Reset Link',
      'hi': 'रीसेट लिंक भेजें',
    },
    'wq8e14sv': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ixi204gq': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'zffb52la': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // CreateContact
  {
    'wuu87cso': {
      'en': 'Create Contact',
      'hi': 'संपर्क बनाएं',
    },
    'dtf4bcxs': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    '6kue8s9b': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'rts2wsc5': {
      'en': '',
      'hi': '',
    },
    '0lgn7zz6': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'ik06k8i3': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'e2l6fpy0': {
      'en': '',
      'hi': '',
    },
    'mllv4hhm': {
      'en': 'Created By',
      'hi': '',
    },
    '731nfu8i': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    '408cqnj4': {
      'en': '',
      'hi': '',
    },
    'qfsp1ufg': {
      'en': 'Created On',
      'hi': '',
    },
    'r55emqcd': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'gpd720us': {
      'en': '',
      'hi': '',
    },
    'whgo9ph1': {
      'en': 'First  Name',
      'hi': '',
    },
    '0oayeix4': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'taoepclq': {
      'en': '',
      'hi': '',
    },
    '9npbdthb': {
      'en': 'Last Name',
      'hi': '',
    },
    'ju2lkbdo': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'w623uak6': {
      'en': '',
      'hi': '',
    },
    '0dj1ydtm': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    '3w6wl746': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'sg413s7o': {
      'en': '',
      'hi': '',
    },
    '0yj3u82r': {
      'en': 'Secondary Mobile No.',
      'hi': 'द्वितीयक मोबाइल नं.',
    },
    's3wdilap': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'p5klvqq6': {
      'en': '',
      'hi': '',
    },
    'ls3ifa4v': {
      'en': 'General Follow Up Frequency :',
      'hi': '',
    },
    'o57zglfa': {
      'en': 'Monthly',
      'hi': '',
    },
    'xcoyz47u': {
      'en': 'Quaterly',
      'hi': '',
    },
    'uhk4x83y': {
      'en': 'Half Yearly',
      'hi': '',
    },
    'um1r42bv': {
      'en': 'Yearly',
      'hi': '',
    },
    'rj86bvr2': {
      'en': 'Half Yearly',
      'hi': '',
    },
    'tj33skxv': {
      'en': 'Profile Category :',
      'hi': '',
    },
    'ybtcmd6j': {
      'en': 'B2B',
      'hi': '',
    },
    't7qive5p': {
      'en': 'B2B',
      'hi': '',
    },
    'zffcvpym': {
      'en': 'B2C',
      'hi': '',
    },
    'p5gs0in8': {
      'en': 'Networking',
      'hi': '',
    },
    'i5kh98lk': {
      'en': 'Supplier',
      'hi': '',
    },
    'y5tsir9k': {
      'en': 'Family & Friends',
      'hi': '',
    },
    '3yztnjzt': {
      'en': 'Select Category...',
      'hi': '',
    },
    'i20v13yj': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'lotce0vh': {
      'en': 'Country :',
      'hi': 'देश/क्षेत्र :',
    },
    '2y2kdsrj': {
      'en': 'India',
      'hi': 'भारत',
    },
    '3haiwbi2': {
      'en': 'India',
      'hi': 'भारत',
    },
    'ev9wdoft': {
      'en': 'Australia',
      'hi': 'ऑस्ट्रेलिया',
    },
    'hgvls5w1': {
      'en': 'USA',
      'hi': 'यूएसए',
    },
    'jjn7raf3': {
      'en': 'Select Country',
      'hi': 'कृपया चयन कीजिए...',
    },
    '4vsql1cv': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'itfj59j2': {
      'en': 'State :',
      'hi': '',
    },
    'r6p12xip': {
      'en': 'Maharashtra',
      'hi': '',
    },
    'v7apatyl': {
      'en': 'Maharashtra',
      'hi': '',
    },
    'lxx81487': {
      'en': 'Rajasthan',
      'hi': '',
    },
    'r4qemtgj': {
      'en': 'Tamil Nadu',
      'hi': '',
    },
    '5km9tc3v': {
      'en': 'Select State',
      'hi': 'कृपया चयन कीजिए...',
    },
    '7utoujng': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'opj1vuw1': {
      'en': 'Town/City :',
      'hi': 'नगर :',
    },
    'kiu21n3y': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'jco8r0ky': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'ro7ruknx': {
      'en': 'Mumbai Suburban',
      'hi': 'मुंबई उपनगर',
    },
    'iah7ebis': {
      'en': 'Select City',
      'hi': 'कृपया चयन कीजिए...',
    },
    'o48hil38': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '65oqjiah': {
      'en': 'Address',
      'hi': 'पता',
    },
    'h4on6yc4': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '9inug8br': {
      'en': '',
      'hi': '',
    },
    '7rvm0hkq': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    '5vb7mku3': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'rupkk07p': {
      'en': '',
      'hi': '',
    },
    'c44so05e': {
      'en': 'Pincode',
      'hi': 'पिन कोड',
    },
    'wv6vcdbd': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'hpqznnzm': {
      'en': '',
      'hi': '',
    },
    'ervijonf': {
      'en': 'Reference \nfrom:',
      'hi': 'संदर्भ:',
    },
    '1lnkdqay': {
      'en': 'Contact',
      'hi': '',
    },
    '8l4cw0v6': {
      'en': 'Tags:',
      'hi': 'टैग:',
    },
    'kute62r5': {
      'en': 'Sales',
      'hi': 'बिक्री',
    },
    '1o2ek6x1': {
      'en': 'Inv',
      'hi': 'चालान',
    },
    'cbky7e39': {
      'en': 'Order',
      'hi': 'आदेश',
    },
    'xydwsvo4': {
      'en': 'Select Tag',
      'hi': 'कृपया चयन कीजिए...',
    },
    's712ypp2': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'rjbpvidk': {
      'en': 'Save & Exit ',
      'hi': 'संपर्क बनाएं',
    },
    'zvhnh62d': {
      'en': 'Save & Create Lead',
      'hi': 'लीड बनाएं',
    },
    'qzk0sis1': {
      'en': 'Create Contact',
      'hi': 'संपर्क बनाएं',
    },
    'vl1qiu76': {
      'en': '__',
      'hi': '__',
    },
  },
  // Home
  {
    'tyqoc0gg': {
      'en': 'Search...',
      'hi': 'खोज...',
    },
    'ohzafz3c': {
      'en': 'Pipeline',
      'hi': 'पाइपलाइन',
    },
    '0c6a1n61': {
      'en': 'INR 100 ',
      'hi': '100 रूपये',
    },
    'csb3cil7': {
      'en': '(In Lakhs)',
      'hi': '(लाख में)',
    },
    '93q6oarc': {
      'en': 'INR 100 Lakhs',
      'hi': '100 लाख रूपये',
    },
    'l0zanvk8': {
      'en': 'Orders On Hand',
      'hi': 'हाथ पर आदेश',
    },
    'k1yeqk7m': {
      'en': 'INR 80 ',
      'hi': '80 रूपये',
    },
    'tfwal6i4': {
      'en': '(In Lakhs)',
      'hi': '(लाख में)',
    },
    'i9j92sku': {
      'en': 'INR 100 Lakhs',
      'hi': '100 लाख रूपये',
    },
    '0fkpmbb7': {
      'en': 'Cash Required',
      'hi': 'नकद आवश्यक',
    },
    '2i3b0hce': {
      'en': 'INR 40 ',
      'hi': '40 रूपये',
    },
    'k14mvddz': {
      'en': '(In Lakhs)',
      'hi': '(लाख में)',
    },
    'dpn02pww': {
      'en': 'INR 100 Lakhs',
      'hi': '100 लाख रूपये',
    },
    'it21f02a': {
      'en': 'Cash Blocked',
      'hi': 'नकद अवरुद्ध',
    },
    'y5q16q93': {
      'en': 'INR 80 ',
      'hi': '80 रूपये',
    },
    'q2g5wg7s': {
      'en': '(In Lakhs)',
      'hi': '(लाख में)',
    },
    'bd88dt9j': {
      'en': 'INR 100 Lakhs',
      'hi': '100 लाख रूपये',
    },
    'p9th1ofl': {
      'en': 'Cash To Be Collected',
      'hi': 'नकद एकत्रित किया जाना है',
    },
    'o3gcf1vx': {
      'en': 'INR 60 ',
      'hi': '60 रूपये',
    },
    '5aer1ek3': {
      'en': '(In Lakhs)',
      'hi': '(लाख में)',
    },
    'p47opb96': {
      'en': 'INR 100 Lakhs',
      'hi': '100 लाख रूपये',
    },
    'dy9t96zl': {
      'en': 'Profitability',
      'hi': 'लाभप्रदता',
    },
    'k9k0gmrc': {
      'en': 'INR 40 ',
      'hi': '40 रूपये',
    },
    'abaaqro6': {
      'en': '(In Lakhs)',
      'hi': '(लाख में)',
    },
    'nzr0ca5p': {
      'en': 'INR 100 Lakhs',
      'hi': '100 लाख रूपये',
    },
    'hgv8f2qh': {
      'en': 'Velocity Graph',
      'hi': 'वेग ग्राफ',
    },
    'rcqz54s9': {
      'en': 'Below is an overview ofBusiness Velocity Graph',
      'hi': 'नीचे बिजनेस वेलोसिटी ग्राफ का अवलोकन दिया गया है',
    },
    'lr26q9gy': {
      'en': 'Home',
      'hi': 'घर',
    },
    '78lfen0h': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // CRMDashboard
  {
    'jxa2do33': {
      'en': 'Contacts',
      'hi': 'संपर्क',
    },
    'oph2kvmg': {
      'en': 'Add Parameter',
      'hi': 'पैरामीटर जोड़ें',
    },
    'viif5tzz': {
      'en': 'New',
      'hi': 'नया',
    },
    'vb0ylibm': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'o7ueud5l': {
      'en': 'List',
      'hi': 'सूची',
    },
    '8v83mp4i': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'q207pb1i': {
      'en': 'Sales',
      'hi': 'बिक्री',
    },
    'va4gvbqk': {
      'en': 'Order',
      'hi': 'आदेश',
    },
    'xcuuf0vj': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
    'xe6u463k': {
      'en': 'Inv',
      'hi': 'चालान',
    },
    'qt8cfdbi': {
      'en': 'Prod',
      'hi': 'ठेस',
    },
    'za1y70ew': {
      'en': 'Search...',
      'hi': 'खोज...',
    },
    '3xf8m8xb': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'b76iunjw': {
      'en': 'West Region',
      'hi': 'पश्चिम क्षेत्र',
    },
    '9qq207ei': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
    'rwn1ukkn': {
      'en': 'Consultant',
      'hi': 'सलाहकार',
    },
    '2n6h74ek': {
      'en': 'East Region',
      'hi': 'पूर्वी क्षेत्र',
    },
    'vox7kenk': {
      'en': 'Contractor',
      'hi': 'ठेकेदार',
    },
    'ofhh6uz9': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'db6d05ii': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'vn2qyc5v': {
      'en': 'Actions',
      'hi': 'कार्रवाई',
    },
    '9669sn1d': {
      'en': 'Active',
      'hi': 'सक्रिय',
    },
    'mnuyy07d': {
      'en': ' Time to close business!',
      'hi': 'व्यवसाय बंद करने का समय!',
    },
    '18zjc81a': {
      'en': 'INR 12,931',
      'hi': 'INR 12,931',
    },
    'cl9ylehk': {
      'en': '55%',
      'hi': '55%',
    },
    'i2vsfybu': {
      'en': 'Mild',
      'hi': 'हल्का',
    },
    'yxlav4k3': {
      'en': 'Warm them up!',
      'hi': 'उन्हें गर्म करो!',
    },
    '3uk97ebw': {
      'en': 'INR 45,200',
      'hi': 'INR 45,200',
    },
    'hjdigi4m': {
      'en': '84%',
      'hi': '84%',
    },
    '0wgnctyp': {
      'en': 'Dormant',
      'hi': 'प्रसुप्त',
    },
    'nzm58v0k': {
      'en': 'Wake them up!',
      'hi': 'उन्हें जगाओ!',
    },
    '55p82i7m': {
      'en': 'INR 4800',
      'hi': 'INR 4800',
    },
    'd99slpig': {
      'en': '20%',
      'hi': '20%',
    },
    'c5geav4l': {
      'en': 'Profile Id',
      'hi': '',
    },
    'j8z5iyo4': {
      'en': 'Full Name',
      'hi': '',
    },
    '3hae04vp': {
      'en': 'Mobile Nos.',
      'hi': '',
    },
    '7srve5ts': {
      'en': 'Company ',
      'hi': '',
    },
    '3tvsidf5': {
      'en': 'Profile Category',
      'hi': '',
    },
    'imo4qwyo': {
      'en': 'Follow-Up Frequency',
      'hi': '',
    },
    'tmk6aa0q': {
      'en': 'Address ',
      'hi': '',
    },
    '6850xp2f': {
      'en': 'City State Country',
      'hi': '',
    },
    'rhukls7g': {
      'en': 'Reference From',
      'hi': '',
    },
    'uotkwm4r': {
      'en': 'Tags',
      'hi': '',
    },
    'o5iu11v1': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    'q414j4im': {
      'en': 'Disha Jain',
      'hi': '',
    },
    'hwy31ly4': {
      'en': '9876543290',
      'hi': '',
    },
    'yzpnb9iv': {
      'en': 'Secondary',
      'hi': '',
    },
    'p9cx67ot': {
      'en': 'Elde Infotech Solution Pvt.Ltd',
      'hi': '',
    },
    'rlk6orqw': {
      'en': 'Family & Friends',
      'hi': '',
    },
    'cbl5bgio': {
      'en': 'Half Yearly',
      'hi': '',
    },
    '3znvwf6f': {
      'en': 'address, landmark, pincode',
      'hi': '',
    },
    'rtpflj0m': {
      'en': 'Jammu',
      'hi': '',
    },
    'bff4su4i': {
      'en': 'Jammu & Kashmir',
      'hi': '',
    },
    'mk3wgtv2': {
      'en': 'India',
      'hi': '',
    },
    'wg4nqygv': {
      'en': 'Nishant Desai',
      'hi': '',
    },
    'uh0d7r14': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'folscfkk': {
      'en': 'List',
      'hi': 'सूची',
    },
    'jrx7h2sv': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'zv91oyns': {
      'en': 'Add Parameter',
      'hi': 'पैरामीटर जोड़ें',
    },
    '1q0r90jy': {
      'en': 'New',
      'hi': 'नया',
    },
    'l774q0ds': {
      'en': 'West Region',
      'hi': 'पश्चिम क्षेत्र',
    },
    '0tmtm4kh': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
    'mv050pwd': {
      'en': 'Consultant',
      'hi': 'सलाहकार',
    },
    '870gy0f2': {
      'en': 'East Region',
      'hi': 'पूर्वी क्षेत्र',
    },
    '2nujinus': {
      'en': 'Contractor',
      'hi': 'ठेकेदार',
    },
    'm2kdw0ch': {
      'en': 'Profile Id',
      'hi': '',
    },
    '5na9honl': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'qs32mq20': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'fjxe45p2': {
      'en': 'Secondary Mobile No.',
      'hi': '',
    },
    'bfwvllph': {
      'en': 'Company Name',
      'hi': '',
    },
    's5su0k2y': {
      'en': 'Follow Up Frequency',
      'hi': '',
    },
    '9wgkewz0': {
      'en': 'Country / Region ',
      'hi': '',
    },
    'dx7ksztd': {
      'en': 'State',
      'hi': '',
    },
    'mrc0jxii': {
      'en': 'City ',
      'hi': '',
    },
    'vympzluc': {
      'en': 'Address',
      'hi': '',
    },
    '3abjab2y': {
      'en': 'Landmark',
      'hi': '',
    },
    'qkwbyn0y': {
      'en': 'Pincode',
      'hi': '',
    },
    'lpaaq66j': {
      'en': 'Select Category',
      'hi': 'खोज...',
    },
    'e359bybz': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'oo9jpa1r': {
      'en': '',
      'hi': '',
    },
    '8b6gx5x1': {
      'en': 'Search',
      'hi': '',
    },
    'o38q5nrp': {
      'en': 'Profile Id',
      'hi': '',
    },
    'p70g3oa7': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'dsv09x94': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'j39fjv0r': {
      'en': 'Secondary Mobile No.',
      'hi': '',
    },
    'j5ubql1a': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'o0knk4kr': {
      'en': 'Follow Up Frequency',
      'hi': '',
    },
    'jug4jz4s': {
      'en': 'Country / Region ',
      'hi': '',
    },
    'e5avmink': {
      'en': 'State',
      'hi': '',
    },
    'cmrk68ir': {
      'en': 'City ',
      'hi': '',
    },
    'e41ih239': {
      'en': 'Address',
      'hi': '',
    },
    'snj34dvu': {
      'en': 'Landmark',
      'hi': '',
    },
    '485gtsnc': {
      'en': 'Pincode',
      'hi': '',
    },
    'ztfp0d8k': {
      'en': '',
      'hi': '',
    },
    'h1lrmb2b': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'bqrao748': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'oez6kic8': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'g7drmxm3': {
      'en': 'Mobile No.',
      'hi': 'मोबाइल नहीं है।',
    },
    '9mvty22n': {
      'en': 'Country',
      'hi': 'देश',
    },
    '1umhd1ti': {
      'en': 'State',
      'hi': 'राज्य',
    },
    '4c6uktnt': {
      'en': 'City',
      'hi': 'शहर',
    },
    'hz8n4ecf': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'ilf2nfa0': {
      'en': 'Profile Category',
      'hi': 'प्रोफ़ाइल श्रेणी',
    },
    'nhrknwm7': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    'e638dhng': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    'eyt57kc5': {
      'en': 'Frequency',
      'hi': 'आवृत्ति',
    },
    '7tpw3u70': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'k7zmaz5v': {
      'en': 'Tree',
      'hi': 'पेड़',
    },
    '2mqbmcc3': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'xjrnqd7f': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '7hsm1m6c': {
      'en': 'City',
      'hi': 'शहर',
    },
    '1wy5n8yt': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'og6pdyae': {
      'en': 'Mobile No.',
      'hi': 'मोबाइल नहीं है।',
    },
    'u2bep1m0': {
      'en': 'Country',
      'hi': 'देश',
    },
    'nijm6xet': {
      'en': 'State',
      'hi': 'राज्य',
    },
    'drxoqh3s': {
      'en': 'City',
      'hi': 'शहर',
    },
    'ig1fssnb': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    '8zs5rf5j': {
      'en': 'Profile Category',
      'hi': 'प्रोफ़ाइल श्रेणी',
    },
    '5hmvzfro': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    '7ebzrsqz': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    'rneqd5s6': {
      'en': 'Frequency',
      'hi': 'आवृत्ति',
    },
    'mlpktmzl': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    '0y2e0qzq': {
      'en': 'Tree',
      'hi': 'पेड़',
    },
    '5ryl5ykr': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'uc97t48o': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '9f5hjna2': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'ga7s0oqg': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'wlwug0oa': {
      'en': 'Mobile No.',
      'hi': 'मोबाइल नहीं है।',
    },
    'q11of2zn': {
      'en': 'Country',
      'hi': 'देश',
    },
    'p0bjzo2t': {
      'en': 'State',
      'hi': 'राज्य',
    },
    'c87l2sn0': {
      'en': 'City',
      'hi': 'शहर',
    },
    'gyd855xb': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    '0fsyv159': {
      'en': 'Profile Category',
      'hi': 'प्रोफ़ाइल श्रेणी',
    },
    't5rpbal4': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    '7378q1cy': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    'l0de5798': {
      'en': 'Frequency',
      'hi': 'आवृत्ति',
    },
    'il6hbc0e': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'uue8o6xg': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'vb2zw68j': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'iuic82kp': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
    '62enml2k': {
      'en': 'Consultant',
      'hi': 'सलाहकार',
    },
    'orjib5iw': {
      'en': 'West Region',
      'hi': 'पश्चिमी क्षेत्र',
    },
    '1pr860zf': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'kvr6oloz': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'dri01wgs': {
      'en': 'Mobile No.',
      'hi': 'मोबाइल नहीं है।',
    },
    '2bzvbxep': {
      'en': 'Country',
      'hi': 'देश',
    },
    'x8j5vrv3': {
      'en': 'State',
      'hi': 'राज्य',
    },
    'k47a8d5t': {
      'en': 'City',
      'hi': 'शहर',
    },
    '39qfd1y4': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'modar0t3': {
      'en': 'Profile Category',
      'hi': 'प्रोफ़ाइल श्रेणी',
    },
    '3ydv8gwk': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    'wrxgppme': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    'c9tklzhm': {
      'en': 'Frequency',
      'hi': 'आवृत्ति',
    },
    'z4m2a7kf': {
      'en': 'Tree',
      'hi': 'पेड़',
    },
    '0tv13iz3': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'wvww3b8x': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    '3e7hebz2': {
      'en': 'Tree',
      'hi': 'पेड़',
    },
    's5m0ohp5': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
    'hqzz289s': {
      'en': 'View',
      'hi': 'देखना',
    },
    'zstk149o': {
      'en': 'Create Lead',
      'hi': 'लीड बनाएं',
    },
    'gwvkm64w': {
      'en': 'Active',
      'hi': 'सक्रिय',
    },
    '04rp4800': {
      'en': '2',
      'hi': '2',
    },
    'ugo9b37n': {
      'en': 'Yogesh Rane',
      'hi': 'योगेश राणे',
    },
    '6z3fk2rb': {
      'en': 'View',
      'hi': 'देखना',
    },
    'uohfzykz': {
      'en': 'yogesh@food.in',
      'hi': 'yogesh@food.in',
    },
    'j5vfto54': {
      'en': '9487987880',
      'hi': '9487987880',
    },
    'uhgylzzc': {
      'en': 'Suresh B V',
      'hi': 'सुरेश बी वी',
    },
    'elyzi3rf': {
      'en': 'View',
      'hi': 'देखना',
    },
    'kzielfu7': {
      'en': 'suresh@shenlac.in',
      'hi': 'suresh@shenlac.in',
    },
    'uo51ywor': {
      'en': '8693788767',
      'hi': '8693788767',
    },
    'pp5n98pi': {
      'en': 'Mild',
      'hi': 'हल्का',
    },
    '0c97hwuf': {
      'en': '3',
      'hi': '3',
    },
    'xc0vj7id': {
      'en': 'Sumeet Pomani',
      'hi': 'सुमीत पोमानी',
    },
    'pkfwff08': {
      'en': 'View',
      'hi': 'देखना',
    },
    'qmds61vx': {
      'en': 'bhavikametal@gmail.com',
      'hi': 'bhavikametal@gmail.com',
    },
    'rbu9zhfa': {
      'en': '8890918870',
      'hi': '8890918870',
    },
    '7f90ps5r': {
      'en': 'Saurabh Jhaveri',
      'hi': '-सौरभ झावेरी',
    },
    '4hkl4i4h': {
      'en': 'View',
      'hi': 'देखना',
    },
    't3d08y42': {
      'en': 'saurabh@unione.in',
      'hi': 'saurbh@unione.in',
    },
    'vq0wzjyz': {
      'en': '9989980087',
      'hi': '9989980087',
    },
    'rlk2ye80': {
      'en': 'Rohit Rawal',
      'hi': 'रोहित रावल',
    },
    'mjarpitq': {
      'en': 'View',
      'hi': 'देखना',
    },
    'pd7gid0c': {
      'en': 'rohit1977@gmail.com',
      'hi': 'rohit1977@gmail.com',
    },
    '7sogv90z': {
      'en': '8898887678',
      'hi': '8898887678',
    },
    'p2n938u7': {
      'en': 'Dormant',
      'hi': 'प्रसुप्त',
    },
    'o75138rt': {
      'en': '2',
      'hi': '2',
    },
    '1l5xnivo': {
      'en': 'Rohit Chaudhury',
      'hi': 'रोहित चौधरी',
    },
    'w9tb7qvc': {
      'en': 'View',
      'hi': 'देखना',
    },
    'bygpznox': {
      'en': 'rohit.c@goodhope.co',
      'hi': 'rohit.c@goodhope.co',
    },
    'r9vclvrt': {
      'en': '8877988677',
      'hi': '8877988677',
    },
    'h2qsagjv': {
      'en': 'Rajiv Shah',
      'hi': 'राजीव शाह',
    },
    'f6m6xub9': {
      'en': 'View',
      'hi': 'देखना',
    },
    'r9yffw76': {
      'en': 'rajiv@everest.com',
      'hi': 'rajiv@everest.com',
    },
    '49abhzd6': {
      'en': '9713265400',
      'hi': '9713265400',
    },
    '1vepyjwo': {
      'en': 'Leads',
      'hi': 'सुराग',
    },
    'ydil53x8': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'ebq9td0t': {
      'en': 'List',
      'hi': 'सूची',
    },
    'h5khqclx': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'jfe4u9fu': {
      'en': 'New',
      'hi': 'नया',
    },
    'foscaka8': {
      'en': 'Sales',
      'hi': 'बिक्री',
    },
    'u9rps2il': {
      'en': 'Order',
      'hi': 'आदेश',
    },
    'aikrrgoy': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
    'zbiqu2tg': {
      'en': 'Inv',
      'hi': 'चालान',
    },
    'zpcf95rb': {
      'en': 'Prod',
      'hi': 'ठेस',
    },
    'xuvh0npy': {
      'en': 'Search...',
      'hi': 'खोज...',
    },
    'i63a38dv': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '3je5ff75': {
      'en': 'West Region',
      'hi': 'पश्चिम क्षेत्र',
    },
    'aer2m4ng': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
    '3nfftzwj': {
      'en': 'Consultant',
      'hi': 'सलाहकार',
    },
    'ujob4jlf': {
      'en': 'East Region',
      'hi': 'पूर्वी क्षेत्र',
    },
    'rq2tn88v': {
      'en': 'Contractor',
      'hi': 'ठेकेदार',
    },
    '6me3opqt': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'ya44ik5i': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'sqd9x2hq': {
      'en': 'Actions',
      'hi': 'कार्रवाई',
    },
    'g8bkbx4z': {
      'en': 'Hot',
      'hi': 'गर्म',
    },
    'lp840w87': {
      'en': 'Time to close business!',
      'hi': 'कारोबार बंद करने का समय!',
    },
    '0isqq168': {
      'en': 'INR 12,931',
      'hi': 'INR 12,931',
    },
    '55cv70ky': {
      'en': '55%',
      'hi': '55%',
    },
    '68aw06gz': {
      'en': 'Warm',
      'hi': 'गरम',
    },
    'is1ql618': {
      'en': 'Warm them up!',
      'hi': 'उन्हें गर्म करो!',
    },
    '8wxey6ex': {
      'en': 'INR 45,200',
      'hi': 'INR 45,200',
    },
    '3bsw446b': {
      'en': '84%',
      'hi': '84%',
    },
    'cfrpsxxi': {
      'en': 'Cold',
      'hi': 'ठंडा',
    },
    'fb5wbyn5': {
      'en': ' Wake them up!',
      'hi': 'उन्हें जगाओ!',
    },
    'erap0cgn': {
      'en': 'INR 4800',
      'hi': 'INR 4800',
    },
    's41q4xdg': {
      'en': '20%',
      'hi': '20%',
    },
    'a6o6dl5r': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    'q3yeesto': {
      'en': 'List',
      'hi': 'सूची',
    },
    '98wcgj1p': {
      'en': 'Kanban',
      'hi': 'Kanban',
    },
    '64ys9t6c': {
      'en': 'New',
      'hi': 'नया',
    },
    'jvw2w71k': {
      'en': 'West Region',
      'hi': 'पश्चिम क्षेत्र',
    },
    'yi4ik74r': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
    '2bj7wf7i': {
      'en': 'Consultant',
      'hi': 'सलाहकार',
    },
    'cxhbcc7r': {
      'en': 'East Region',
      'hi': 'पूर्वी क्षेत्र',
    },
    'ja64gg7x': {
      'en': 'Contractor',
      'hi': 'ठेकेदार',
    },
    'jgr1yert': {
      'en': 'Sales',
      'hi': 'बिक्री',
    },
    'wtyey7fh': {
      'en': 'Order',
      'hi': 'आदेश',
    },
    '8z057p9g': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
    '513b89ii': {
      'en': 'Inv',
      'hi': 'चालान',
    },
    'w49ua80v': {
      'en': 'Prod',
      'hi': 'ठेस',
    },
    'z092gie0': {
      'en': 'Search...',
      'hi': 'खोज...',
    },
    'a936wz5u': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    '9l22tdgq': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'vrob70kj': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    'lkg0xig5': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    'v39rk3qu': {
      'en': 'Location',
      'hi': 'जगह',
    },
    '1omlfuk9': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'tuakq7vd': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'se0jp7ct': {
      'en': 'Next Follow Up Date',
      'hi': 'अगली अनुवर्ती तिथि',
    },
    'pskqchvj': {
      'en': 'Currently assigned to',
      'hi': 'वर्तमान में सौंपा गया है',
    },
    '2hlo2mv3': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    'g1ld44x0': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'amkt0k7p': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '3tn5xr21': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'wsu0ng4o': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'klpb1we9': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    '36yxh9ms': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    '0hmjvfmb': {
      'en': 'Location',
      'hi': 'जगह',
    },
    's29c9og7': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'ww04xn52': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'gbjefjqc': {
      'en': 'Next Follow Up Date',
      'hi': 'अगली अनुवर्ती तिथि',
    },
    '30e86i30': {
      'en': 'Currently assigned to',
      'hi': 'वर्तमान में सौंपा गया है',
    },
    'cfx7jcol': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    '7rtuhl7e': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'zx1nc6ri': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    's4adrx9p': {
      'en': 'Follow Up Date',
      'hi': 'आगे की कार्यवाही की तारीख',
    },
    'clbhti3x': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    '3fk7iegi': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    'xlzf5dh9': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'h4zbqtx0': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'u8esyaap': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'fhfiw4ux': {
      'en': 'Follow Up Date',
      'hi': 'आगे की कार्यवाही की तारीख',
    },
    'w0nhozgw': {
      'en': 'Currently assigned to',
      'hi': 'वर्तमान में असाइन किया गया',
    },
    'qs91sbyv': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    'c12cxjs8': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '2wzr8c9j': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'npk8ysja': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
    '3apklaj4': {
      'en': 'Consultant',
      'hi': 'सलाहकार',
    },
    'vdo69ydn': {
      'en': 'West Region',
      'hi': 'पश्चिम क्षेत्र',
    },
    'zbzby4k4': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'zkjdi7h3': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    'yautfwpu': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    'x5twu1u4': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'xnfhkx2l': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'o4bc25xb': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'k1udaz81': {
      'en': 'Next Follow Up Date',
      'hi': 'अगली अनुवर्ती तिथि',
    },
    'xv72oqsk': {
      'en': 'Currently assigned to',
      'hi': 'वर्तमान में सौंपा गया है',
    },
    'gj5jx7jt': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    'nabtv7rg': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'dlt1vnz0': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'avvx3u0s': {
      'en': 'Edit Lead',
      'hi': 'लीड संपादित करें',
    },
    '5b4f0gab': {
      'en': 'View',
      'hi': 'देखना',
    },
    'noxk7ddc': {
      'en': 'Hot',
      'hi': 'गर्म',
    },
    '68mzv7n4': {
      'en': '2',
      'hi': '2',
    },
    'q4egf7uu': {
      'en': 'Ashish Apte',
      'hi': 'आशीष आप्टे',
    },
    'ffe7iqpc': {
      'en': 'View',
      'hi': 'देखना',
    },
    '6n7addzu': {
      'en': 'ashish@jollyclamp.com',
      'hi': 'ashish@jollyclamp.com',
    },
    'g7pzz7re': {
      'en': '9876543210',
      'hi': '9876543210',
    },
    'vpj427cd': {
      'en': 'Disha Jain',
      'hi': 'दिशा जैन',
    },
    'svupuc48': {
      'en': 'View',
      'hi': 'देखना',
    },
    '432k9wof': {
      'en': 'disha.jain@elde.co.in',
      'hi': 'disha.jain@elde.co.in',
    },
    'e0lsm929': {
      'en': '8976543210',
      'hi': '8976543210',
    },
    '3rfcvf8x': {
      'en': 'Warm',
      'hi': 'गरम',
    },
    '8dgm8szc': {
      'en': '2',
      'hi': '2',
    },
    'b4g2asi8': {
      'en': 'Ravi Sabale',
      'hi': 'रवि साबले',
    },
    'p3ucl02r': {
      'en': 'View',
      'hi': 'देखना',
    },
    'rkrtqts1': {
      'en': 'ravi.sabale@gmail.com',
      'hi': 'ravi.sabale@gmail.com',
    },
    'ulxgnbtw': {
      'en': '9984678688',
      'hi': '9984678688',
    },
    'e604ky87': {
      'en': 'Nishant Desai',
      'hi': 'निशांत देसाई',
    },
    'hwr3snik': {
      'en': 'View',
      'hi': 'देखना',
    },
    '7umprg0s': {
      'en': 'nishant.desai@gmail.com',
      'hi': 'nishant.desai@gmail.com',
    },
    'yyryri9d': {
      'en': '9764678688',
      'hi': '9764678688',
    },
    'rcpeic0n': {
      'en': 'Cold',
      'hi': 'ठंडा',
    },
    'akxp9h8g': {
      'en': '2',
      'hi': '2',
    },
    '69d6sbwt': {
      'en': 'Prajessh',
      'hi': 'प्रजेश',
    },
    'lordsmiz': {
      'en': 'View',
      'hi': 'देखना',
    },
    'anurew6m': {
      'en': 'prajeesh.sht@saintgobain.com',
      'hi': 'prajeesh.sht@saintgobain.com',
    },
    'fiwe3pat': {
      'en': '9713264567',
      'hi': '9713264567',
    },
    '9qjpa4it': {
      'en': 'Amit  Shah',
      'hi': 'अमित शाह',
    },
    'h43t7qq6': {
      'en': 'View',
      'hi': 'देखना',
    },
    'ffop1n08': {
      'en': 'amit.shah@gmail.com',
      'hi': 'amit.shah@gmail.com',
    },
    'c5y5ri34': {
      'en': '9713265400',
      'hi': '9713265400',
    },
    'q39qgekl': {
      'en': 'Opportunity',
      'hi': 'अवसर',
    },
    'h50wg23m': {
      'en': 'Opportunities Coming Soon !!!',
      'hi': 'अवसर जल्द ही आ रहे हैं !!!',
    },
    'lxuuxw9g': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
    'mg30j8sw': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
  },
  // CreateLead
  {
    'jjpndjuc': {
      'en': 'Create Lead',
      'hi': 'लीड बनाएं',
    },
    '7iuckqzc': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    '2mwc4ynt': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'hcntxor0': {
      'en': '',
      'hi': '',
    },
    '3xu24cj2': {
      'en': 'Lead\nSource:',
      'hi': 'लीड स्रोत:',
    },
    'z5c5zwi7': {
      'en': 'Contact',
      'hi': '',
    },
    '3xq3j39t': {
      'en': 'Lead Name',
      'hi': 'जगह',
    },
    '1iwm6xwy': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'mtcrlrzt': {
      'en': '',
      'hi': '',
    },
    'oq279aqy': {
      'en': 'Location',
      'hi': '',
    },
    'i3msacse': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'dyix228v': {
      'en': '',
      'hi': '',
    },
    'v9jsearq': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    '9mc4jfba': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '6nriemh3': {
      'en': '',
      'hi': '',
    },
    'fozaiekn': {
      'en': 'Attachments:',
      'hi': 'अनुलग्नक:',
    },
    'qewxzdm7': {
      'en': 'Table Contact Number for Lead:',
      'hi': 'लीड के लिए टेबल संपर्क नंबर:',
    },
    'g3fkhzqn': {
      'en': 'Add Contact',
      'hi': 'लाइन जोड़ो',
    },
    'qoy4s6mu': {
      'en': 'Contact Person Name',
      'hi': 'संपर्क व्यक्ति का नाम',
    },
    'bp6ido3k': {
      'en': 'Contact Person Mobile No.',
      'hi': 'संपर्क व्यक्ति मोबाइल नंबर',
    },
    'bs1gy6g4': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'c7fs4xsx': {
      'en': 'ooo',
      'hi': 'ओह',
    },
    '1g8i6myn': {
      'en': 'Edit Column 3',
      'hi': 'कॉलम 3 संपादित करें',
    },
    '9h0b3boz': {
      'en': 'Add Contact',
      'hi': 'संपर्क जोड़ें',
    },
    's063jwmy': {
      'en': 'Hello World',
      'hi': '',
    },
    'l3cpf5k0': {
      'en': 'Action',
      'hi': '',
    },
    'zqs30n2g': {
      'en': 'Add to Contact',
      'hi': '',
    },
    '5bompr5t': {
      'en': 'Lead Summary Table',
      'hi': 'मानक तालिका:',
    },
    't6dwl4sk': {
      'en': 'Add Parameter',
      'hi': 'जोड़ना',
    },
    'vd9iworn': {
      'en': 'Sr No',
      'hi': 'क्रमांक',
    },
    'z8ua7flt': {
      'en': 'Lead Description',
      'hi': 'लीड विवरण',
    },
    'h3nyixf1': {
      'en': 'Req Qty',
      'hi': 'अनुरोध मात्रा',
    },
    '4fo8bx5q': {
      'en': 'Edit Column 1',
      'hi': 'कॉलम 1 संपादित करें',
    },
    'pa3vgkgl': {
      'en': 'Edit Column 2',
      'hi': 'कॉलम 2 संपादित करें',
    },
    'diqhojla': {
      'en': 'Edit Column 3',
      'hi': 'कॉलम 3 संपादित करें',
    },
    'f7qoyuow': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'b9pm5y5o': {
      'en': 'Edit Column 4',
      'hi': 'कॉलम 4 संपादित करें',
    },
    '9eei2wl8': {
      'en': 'Rate/UoM',
      'hi': 'दर/यूओएम',
    },
    'p4biymmi': {
      'en': 'Edit Column 5',
      'hi': 'कॉलम 5 संपादित करें',
    },
    '6qh5t5bg': {
      'en': 'Amount',
      'hi': 'मात्रा',
    },
    'xv13vgi3': {
      'en': 'Edit Column 6',
      'hi': 'कॉलम 6 संपादित करें',
    },
    'rv46un0d': {
      'en': 'Lead Status',
      'hi': '',
    },
    '30amuem4': {
      'en': 'Active',
      'hi': 'नया',
    },
    '0rc8ag8v': {
      'en': 'Active',
      'hi': 'नया',
    },
    'tig5g9cp': {
      'en': 'Lead Converted',
      'hi': 'साइट का दौरा किया गया',
    },
    'g457ma2u': {
      'en': 'Lead Lost',
      'hi': 'अनुमान',
    },
    '82bt59tx': {
      'en': 'Select Lead Status...',
      'hi': 'लीड स्थिति चुनें...',
    },
    'pxpem8n8': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'c6xzdm7s': {
      'en': 'Lead Rating:',
      'hi': '',
    },
    'n2b1fryk': {
      'en': 'Cold',
      'hi': '',
    },
    'dv29nso7': {
      'en': 'Hot',
      'hi': '',
    },
    '5dy7u0qp': {
      'en': 'Warm',
      'hi': '',
    },
    'mshkrily': {
      'en': 'Cold',
      'hi': '',
    },
    'zj48dsex': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'dzwd88vj': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'pcueln89': {
      'en': 'Tags:',
      'hi': '',
    },
    '9op3dky0': {
      'en': 'Sales',
      'hi': 'बिक्री',
    },
    '8ov3j0wp': {
      'en': 'Inv',
      'hi': 'चालान',
    },
    'sh5lq7kl': {
      'en': 'Order',
      'hi': 'आदेश',
    },
    'ghryk7jz': {
      'en': 'Select Tag',
      'hi': '',
    },
    '7a9oeapd': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'npg0rr1r': {
      'en': 'Currently Assigned To',
      'hi': '',
    },
    'pgm7x0pj': {
      'en': 'Nishant Desai',
      'hi': 'निशांत देसाई',
    },
    'xscgg83d': {
      'en': 'Disha Jain',
      'hi': 'दिशा जैन',
    },
    '878ay8zm': {
      'en': 'Nishant Desai',
      'hi': 'निशांत देसाई',
    },
    's7x9g9cx': {
      'en': 'Akshay Patil',
      'hi': 'अक्षय पाटिल',
    },
    '4iqdyqhb': {
      'en': 'Select Lead Status...',
      'hi': 'लीड स्थिति चुनें...',
    },
    'i4umisqe': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '6220oywh': {
      'en': 'Remarks from Sales Person',
      'hi': 'विक्रय व्यक्ति की टिप्पणियाँ',
    },
    'rblrf3qq': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'gb1548yd': {
      'en': '',
      'hi': '',
    },
    'wvbp34bm': {
      'en': 'Next Follow-Up Date :',
      'hi': 'अगली अनुवर्ती तिथि:',
    },
    '2rjqgmbv': {
      'en': 'Date',
      'hi': '',
    },
    '4qa44a23': {
      'en': 'Create Lead',
      'hi': '',
    },
    'jooboh23': {
      'en': 'Create Lead',
      'hi': 'लीड बनाएं',
    },
    '7crsvy77': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ChangePasswordPage
  {
    '2wdovvyj': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
    },
    'o8xp7r2b': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
    },
    'bwb8x66t': {
      'en': 'New Password',
      'hi': 'नया पासवर्ड',
    },
    '7bcbymcr': {
      'en': 'Enter your new password....',
      'hi': 'अपना नया पासवर्ड दर्ज करें....',
    },
    '2sedb3ps': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    '0rgw32br': {
      'en': 'Enter to confirm your password',
      'hi': 'अपना पासवर्ड पुष्टि करने के लिए दर्ज करें',
    },
    '5xwktt7p': {
      'en': 'New Password and confirm password should be same',
      'hi': 'नया पासवर्ड और कन्फर्म पासवर्ड एक ही होना चाहिए',
    },
    'ng096rlb': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
    },
    'ahb6g3lr': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'l1jvwb4b': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'ydvdn6rr': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '4zsv63p6': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'xwld9kco': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // EditLead
  {
    'fxdtf3gf': {
      'en': 'Edit Lead',
      'hi': 'लीड संपादित करें',
    },
    'cc02mtj5': {
      'en': 'Workflow History',
      'hi': '',
    },
    'y9ewew7x': {
      'en': 'Lead Number',
      'hi': '',
    },
    '2s1b22t2': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'nb9id4qv': {
      'en': '',
      'hi': '',
    },
    '8a66bpyb': {
      'en': 'Lead\nSource:',
      'hi': '',
    },
    'emvjyaay': {
      'en': 'Contact',
      'hi': '',
    },
    'itwanin1': {
      'en': 'Lead Name',
      'hi': '',
    },
    'w4zsz7sn': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'qjenlie3': {
      'en': '',
      'hi': '',
    },
    'keufk7vu': {
      'en': 'Location',
      'hi': '',
    },
    '6qb0f800': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'l95c9cr9': {
      'en': '',
      'hi': '',
    },
    'icjma7cg': {
      'en': 'Customer Requirement',
      'hi': '',
    },
    'c9sgpkqt': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'o0d439a5': {
      'en': '',
      'hi': '',
    },
    'yvjmvctm': {
      'en': 'Attachments:',
      'hi': '',
    },
    '1ewb1qfr': {
      'en': 'Table Contact Number for Lead:',
      'hi': '',
    },
    'lg0bxhdd': {
      'en': 'Add Contact',
      'hi': '',
    },
    'kkb34ui7': {
      'en': 'Contact Person Name',
      'hi': '',
    },
    'obpgmriu': {
      'en': 'Contact Person Mobile No.',
      'hi': '',
    },
    'kioizmv0': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'kesbczp1': {
      'en': 'ooo',
      'hi': '',
    },
    'ijc987fr': {
      'en': 'Edit Column 3',
      'hi': '',
    },
    '7674hiij': {
      'en': 'Add Contact',
      'hi': '',
    },
    'ew8uzq0m': {
      'en': 'Hello World',
      'hi': '',
    },
    'yy3h2vox': {
      'en': 'Action',
      'hi': '',
    },
    'e89ebtcv': {
      'en': 'Add to Contact',
      'hi': '',
    },
    'r2ir5yqi': {
      'en': 'Lead Summary Table',
      'hi': '',
    },
    '7os72k02': {
      'en': 'Add Parameter',
      'hi': 'पैरामीटर जोड़ें',
    },
    'z7pgsyfm': {
      'en': 'Sr No',
      'hi': '',
    },
    '8qt6k3k2': {
      'en': 'Lead Description',
      'hi': '',
    },
    '362q86ji': {
      'en': 'Req Qty',
      'hi': '',
    },
    'x47hen68': {
      'en': 'Edit Column 1',
      'hi': '',
    },
    'a357tgqi': {
      'en': 'Edit Column 2',
      'hi': '',
    },
    '6bh0yvcs': {
      'en': 'Edit Column 3',
      'hi': '',
    },
    '72knomqh': {
      'en': 'UoM',
      'hi': '',
    },
    'pcoow5pd': {
      'en': 'Edit Column 4',
      'hi': '',
    },
    'bw6bcl72': {
      'en': 'Rate/UoM',
      'hi': '',
    },
    '0xddwdje': {
      'en': 'Edit Column 5',
      'hi': '',
    },
    'ajo4fecb': {
      'en': 'Amount',
      'hi': '',
    },
    'l1l45xnj': {
      'en': 'Edit Column 6',
      'hi': '',
    },
    'mul6o33z': {
      'en': 'Lead Status',
      'hi': '',
    },
    '2gkf32zw': {
      'en': 'Active',
      'hi': '',
    },
    'dj5eg5b3': {
      'en': 'Active',
      'hi': '',
    },
    'l73z8lpl': {
      'en': 'Lead Converted',
      'hi': '',
    },
    '4pd8giax': {
      'en': 'Lead Lost',
      'hi': '',
    },
    'dkkr7ip6': {
      'en': 'Select Lead Status...',
      'hi': '',
    },
    'g4jtfydm': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'fwocgtjx': {
      'en': 'Lead Rating:',
      'hi': '',
    },
    'd0r3iqch': {
      'en': 'Cold',
      'hi': '',
    },
    'z26c5p1g': {
      'en': 'Hot',
      'hi': '',
    },
    'bqyjcsrx': {
      'en': 'Warm',
      'hi': '',
    },
    'l3i7bsve': {
      'en': 'Cold',
      'hi': '',
    },
    'cbafl3es': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '2gcwyjoi': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'jxnnlvdm': {
      'en': 'Tags:',
      'hi': '',
    },
    'nh14jzi3': {
      'en': 'Sales',
      'hi': '',
    },
    '51tny7os': {
      'en': 'Inv',
      'hi': '',
    },
    'v9awbidn': {
      'en': 'Order',
      'hi': '',
    },
    'fqqbbzqi': {
      'en': 'Select Tag',
      'hi': '',
    },
    'ubqwczp6': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'vt5qu2uu': {
      'en': 'Currently Assigned To',
      'hi': '',
    },
    '6jf9wb2x': {
      'en': 'Nishant Desai',
      'hi': '',
    },
    'qsv67ebh': {
      'en': 'Disha Jain',
      'hi': '',
    },
    'acywooo1': {
      'en': 'Nishant Desai',
      'hi': '',
    },
    'kqt1dtiz': {
      'en': 'Akshay Patil',
      'hi': '',
    },
    'ojckeiyr': {
      'en': 'Select Lead Status...',
      'hi': '',
    },
    'dt846h1j': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'atobih8d': {
      'en': 'Remarks from Sales Person',
      'hi': '',
    },
    'z02a7pwo': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fn2stx1a': {
      'en': '',
      'hi': '',
    },
    'y7mgys9c': {
      'en': 'Next Follow-Up Date :',
      'hi': '',
    },
    'tw2c2kgv': {
      'en': 'Date',
      'hi': '',
    },
    '2pvt38n7': {
      'en': 'Add Tag',
      'hi': 'टैग जोड़ो',
    },
    'elpwil72': {
      'en': 'Update Lead',
      'hi': 'लीड अपडेट करें',
    },
    'ne1a9ymx': {
      'en': 'Edit Lead',
      'hi': 'लीड संपादित करें',
    },
    'i0objawh': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ViewLead
  {
    'm6doenjy': {
      'en': 'View Lead',
      'hi': 'लीड देखें',
    },
    '6o02zbl6': {
      'en': 'Workflow History',
      'hi': '',
    },
    'bbvvxos4': {
      'en': 'Lead Number',
      'hi': '',
    },
    'gttnypt5': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'lhipcat2': {
      'en': '',
      'hi': '',
    },
    'jcglr2hd': {
      'en': 'Lead\nSource:',
      'hi': '',
    },
    'dp40xckv': {
      'en': 'Contact',
      'hi': '',
    },
    'dec737a8': {
      'en': 'Lead Name',
      'hi': '',
    },
    'n2j9v1t0': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '2u8ug8ds': {
      'en': '',
      'hi': '',
    },
    'bbkofle9': {
      'en': 'Location',
      'hi': '',
    },
    'ntjb0huu': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'xr73k99z': {
      'en': '',
      'hi': '',
    },
    '19xgn5uz': {
      'en': 'Customer Requirement',
      'hi': '',
    },
    'km6hdgdv': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '1qsnt2ic': {
      'en': '',
      'hi': '',
    },
    '9c7qy26e': {
      'en': 'Attachments:',
      'hi': '',
    },
    'ip3t6sfi': {
      'en': 'Table Contact Number for Lead:',
      'hi': '',
    },
    'sssibxza': {
      'en': 'Add Contact',
      'hi': '',
    },
    '0lglig4b': {
      'en': 'Contact Person Name',
      'hi': '',
    },
    'uo0zrvfd': {
      'en': 'Contact Person Mobile No.',
      'hi': '',
    },
    'r7os958s': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '4m22ro2r': {
      'en': 'ooo',
      'hi': '',
    },
    'ckfh9jz5': {
      'en': 'Edit Column 3',
      'hi': '',
    },
    '8xg28l9s': {
      'en': 'Add Contact',
      'hi': '',
    },
    '33smn6ad': {
      'en': 'Hello World',
      'hi': '',
    },
    'zk3qoh1o': {
      'en': 'Action',
      'hi': '',
    },
    'cn18wrrc': {
      'en': 'Add to Contact',
      'hi': '',
    },
    '1kuvi9qc': {
      'en': 'Lead Summary Table',
      'hi': '',
    },
    'v2l5wzt0': {
      'en': 'Add Parameter',
      'hi': 'पैरामीटर जोड़ें',
    },
    '5g1ncot5': {
      'en': 'Sr No',
      'hi': '',
    },
    'ac8pvx4e': {
      'en': 'Lead Description',
      'hi': '',
    },
    'lgq2i1b7': {
      'en': 'Req Qty',
      'hi': '',
    },
    'pso30uur': {
      'en': 'Edit Column 1',
      'hi': '',
    },
    'h9ryau2k': {
      'en': 'Edit Column 2',
      'hi': '',
    },
    'zv58ijgh': {
      'en': 'Edit Column 3',
      'hi': '',
    },
    'julhi7qp': {
      'en': 'UoM',
      'hi': '',
    },
    'edlyzxto': {
      'en': 'Edit Column 4',
      'hi': '',
    },
    'v4ilup9t': {
      'en': 'Rate/UoM',
      'hi': '',
    },
    '0yiie0d8': {
      'en': 'Edit Column 5',
      'hi': '',
    },
    '027uzwbz': {
      'en': 'Amount',
      'hi': '',
    },
    'qlw70xhz': {
      'en': 'Edit Column 6',
      'hi': '',
    },
    'j7mkp41f': {
      'en': 'Lead Status',
      'hi': '',
    },
    'b8koy4mj': {
      'en': 'Active',
      'hi': '',
    },
    '9cktdcy2': {
      'en': 'Active',
      'hi': '',
    },
    't17u6wpe': {
      'en': 'Lead Converted',
      'hi': '',
    },
    '4jc7ngii': {
      'en': 'Lead Lost',
      'hi': '',
    },
    'vhzzpu87': {
      'en': 'Select Lead Status...',
      'hi': '',
    },
    '0ja2j5d5': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '2swoj5pt': {
      'en': 'Lead Rating:',
      'hi': '',
    },
    '0ojhj0ve': {
      'en': 'Cold',
      'hi': '',
    },
    'd2rcoiih': {
      'en': 'Hot',
      'hi': '',
    },
    'mii0gyc9': {
      'en': 'Warm',
      'hi': '',
    },
    'jnnzkpd7': {
      'en': 'Cold',
      'hi': '',
    },
    's1ej5a7h': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'exei7qbf': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'snwti3f3': {
      'en': 'Tags:',
      'hi': '',
    },
    'ofu3b3g8': {
      'en': 'Sales',
      'hi': '',
    },
    'evv87qr3': {
      'en': 'Inv',
      'hi': '',
    },
    'xv2h0sya': {
      'en': 'Order',
      'hi': '',
    },
    '2kbd9z3e': {
      'en': 'Select Tag',
      'hi': '',
    },
    'bwny06iv': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'wo7i2l9m': {
      'en': 'Currently Assigned To',
      'hi': '',
    },
    '2g4nvgy8': {
      'en': 'Nishant Desai',
      'hi': '',
    },
    '1t4h4vpf': {
      'en': 'Disha Jain',
      'hi': '',
    },
    'tlibmqi9': {
      'en': 'Nishant Desai',
      'hi': '',
    },
    'rumitot6': {
      'en': 'Akshay Patil',
      'hi': '',
    },
    'm9tex57k': {
      'en': 'Select Lead Status...',
      'hi': '',
    },
    'gtbczcma': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'u5nwlx30': {
      'en': 'Remarks from Sales Person',
      'hi': '',
    },
    'f1937xta': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fzrzgj93': {
      'en': '',
      'hi': '',
    },
    '6tw1jru8': {
      'en': 'Next Follow-Up Date :',
      'hi': '',
    },
    'jr96y2sh': {
      'en': 'Date',
      'hi': '',
    },
    '0hlxs1ca': {
      'en': 'View Lead',
      'hi': 'लीड देखें',
    },
    'im993xvy': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // UserPage
  {
    'dape6egp': {
      'en': 'New',
      'hi': 'नया',
    },
    '29oy9gym': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'bjhl9d48': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    'qxxta704': {
      'en': 'Mobile No',
      'hi': 'मोबाइल नहीं है',
    },
    'ak2j9iyc': {
      'en': 'Status',
      'hi': 'स्थिति',
    },
    'gsiu0g14': {
      'en': 'Users',
      'hi': 'उपयोगकर्ताओं',
    },
    'r3xn0oy0': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // CompanyPage
  {
    '5ulw59j5': {
      'en': 'New',
      'hi': 'जोड़ना',
    },
    'klmf1jk5': {
      'en': 'Status',
      'hi': 'स्थिति',
    },
    'd1m3xato': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    '3f16jnpt': {
      'en': 'Default Password',
      'hi': 'डिफ़ॉल्ट पासवर्ड',
    },
    'ua8b5m25': {
      'en': 'Actions',
      'hi': 'कार्रवाई',
    },
    'ovq6cjuw': {
      'en': 'Company',
      'hi': 'कंपनी',
    },
    'zmyodwga': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // InventoryDashBoard
  {
    'pwwbkm69': {
      'en': 'Inward',
      'hi': 'आंतरिक',
    },
    'mdrr4k6l': {
      'en': 'Add Parameter',
      'hi': 'पैरामीटर जोड़ें',
    },
    'v1zhnxw0': {
      'en': 'New',
      'hi': 'नया',
    },
    'kdy7ysuc': {
      'en': 'Assigned To Me',
      'hi': 'मुझे सौंपा गया',
    },
    'urmszwex': {
      'en': 'All',
      'hi': 'सभी',
    },
    't1v7sv4h': {
      'en': 'Assign Approvals To :',
      'hi': 'इन्हें स्वीकृतियाँ सौंपें:',
    },
    'dtg3x783': {
      'en': 'Send User for Approval',
      'hi': 'अनुमोदन के लिए उपयोगकर्ता भेजें',
    },
    'z7zlllr1': {
      'en': 'Inward No.',
      'hi': 'आवक नं.',
    },
    'z8ua4387': {
      'en': 'Inward Details',
      'hi': 'आवक विवरण',
    },
    'wz7vqllm': {
      'en': 'Type',
      'hi': 'प्रकार',
    },
    '6tok8q9r': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'whnlfhkt': {
      'en': 'Material Received from',
      'hi': 'से सामग्री प्राप्त हुई',
    },
    'ir5mf8sx': {
      'en': 'Reference Number',
      'hi': 'संदर्भ संख्या',
    },
    '7e42jxdr': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '11luah2i': {
      'en': 'Report conclusion',
      'hi': 'रिपोर्ट निष्कर्ष',
    },
    'yf3navq5': {
      'en': 'Inward No.',
      'hi': 'आवक नं.',
    },
    'fcwmzxnm': {
      'en': 'Inward Details',
      'hi': 'आवक विवरण',
    },
    'gt69t5a7': {
      'en': 'Type',
      'hi': 'प्रकार',
    },
    'kfo9sfrz': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'cnvxxwsg': {
      'en': 'Material Received from',
      'hi': 'से सामग्री प्राप्त हुई',
    },
    'b4utdqb9': {
      'en': 'Reference Number',
      'hi': 'संदर्भ संख्या',
    },
    'ikqp6ixy': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '7b2n530l': {
      'en': 'Report conclusion',
      'hi': 'रिपोर्ट निष्कर्ष',
    },
    'lt5kyel7': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'kwplqpx1': {
      'en': 'Go to Item Master',
      'hi': 'आइटम मास्टर पर जाएँ',
    },
    'dpffps7m': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    'v34hzmrp': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    '3fiknra9': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    '3hldii6g': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'giv3xdfs': {
      'en': 'Physical Quantity',
      'hi': 'भौतिक मात्रा',
    },
    'iqgusiv1': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'qs85qu1w': {
      'en': 'Rate/UoM-Latest',
      'hi': 'दर/यूओएम-नवीनतम',
    },
    'itty9qd4': {
      'en': 'Rate/UoM-Moving Avg',
      'hi': 'दर/यूओएम-चलती औसत',
    },
    'j69k0buu': {
      'en': 'Total Rate',
      'hi': 'कुल दर',
    },
    'ebkaehi4': {
      'en': 'Allocated Quantity',
      'hi': 'आवंटित मात्रा',
    },
    '64d895oz': {
      'en': 'Qty available for allocation',
      'hi': 'आवंटन हेतु मात्रा उपलब्ध है',
    },
    '6fyok127': {
      'en': ' MoQ',
      'hi': 'एमओक्यू',
    },
    'dy352nbf': {
      'en': 'Remark',
      'hi': 'टिप्पणी',
    },
    'nmqv8aan': {
      'en': 'Remarks',
      'hi': 'गुणवत्ता टिप्पणियाँ',
    },
    'ewkf8hmg': {
      'en': 'Quality Remarks',
      'hi': '',
    },
    'j1n22pb8': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    'w5r1s5uj': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    '71rb00ig': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'ttpomz1m': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'rwp2h0rt': {
      'en': 'Physical Quantity',
      'hi': 'भौतिक मात्रा',
    },
    'z611jp19': {
      'en': 'Rate/UoM-Latest',
      'hi': 'दर/यूओएम-नवीनतम',
    },
    'zk6kg4w5': {
      'en': 'Rate/UoM-Moving Avg',
      'hi': 'दर/यूओएम-चलती औसत',
    },
    'fhaekmvg': {
      'en': 'Total Rate',
      'hi': 'कुल दर',
    },
    '5s1ll2f5': {
      'en': 'Allocated Quantity',
      'hi': 'आवंटित मात्रा',
    },
    'eisuxv1l': {
      'en': 'Qty available for allocation',
      'hi': 'आवंटन हेतु उपलब्ध मात्रा',
    },
    'ib7nz7rs': {
      'en': ' MoQ',
      'hi': 'MoQ',
    },
    'dkna8oa6': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '8iee4pvf': {
      'en': 'Remark',
      'hi': 'गुणवत्ता टिप्पणी',
    },
    'fubr1p4l': {
      'en': 'Quality Remark',
      'hi': '',
    },
    'c0smpq6a': {
      'en': 'Outward',
      'hi': 'बाहर',
    },
    '00esr4li': {
      'en': 'Add Parameter',
      'hi': 'पैरामीटर जोड़ें',
    },
    'fllqvf94': {
      'en': 'New',
      'hi': 'जोड़ना',
    },
    'eal6ri3a': {
      'en': 'Assign Approvals To :',
      'hi': 'अनुमोदन असाइन करें:',
    },
    'jnwhkdzq': {
      'en': 'Assigned To Me',
      'hi': 'मुझे सौंपा गया',
    },
    '3yjexpiv': {
      'en': 'All',
      'hi': 'सभी',
    },
    'el2yj7q9': {
      'en': 'All',
      'hi': 'सभी',
    },
    'pmsep82s': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    '8wubfwzr': {
      'en': 'Item Category',
      'hi': '',
    },
    '717ncvxm': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'vqq5gurx': {
      'en': 'Required Qty\n(Po qty)',
      'hi': 'आवश्यक मात्रा\n(पीओ मात्रा)',
    },
    '5wqbqcw5': {
      'en': 'Purchase Quantity',
      'hi': 'खरीद की मात्रा',
    },
    '453m5iap': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'dzq7n66d': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'to593n41': {
      'en': 'Received Quantity',
      'hi': 'प्राप्त मात्रा',
    },
    'z0dgzkzl': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '2unumqvz': {
      'en': 'rate/unit',
      'hi': 'दर/इकाई',
    },
    '2c7k8hnq': {
      'en': 'QR Verified',
      'hi': 'क्यूआर सत्यापित',
    },
    'vyx1dzvh': {
      'en': '10',
      'hi': '10',
    },
    'nl1s8wyv': {
      'en': '100',
      'hi': '100',
    },
    'frxtl6y8': {
      'en': 'Outward No.',
      'hi': 'जावक सं.',
    },
    '5zrri4yr': {
      'en': 'Outward Details',
      'hi': 'जावक विवरण',
    },
    'wb81py9q': {
      'en': 'Type',
      'hi': 'प्रकार',
    },
    'e4beexfo': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'rt3hb5se': {
      'en': 'Material Received from',
      'hi': 'से सामग्री प्राप्त हुई',
    },
    'jfrcav8x': {
      'en': 'Reference Number',
      'hi': 'संदर्भ संख्या',
    },
    'gkjlhpjf': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'hqrugiym': {
      'en': 'Report conclusion',
      'hi': 'रिपोर्ट निष्कर्ष',
    },
    'q46cz7m4': {
      'en': '1',
      'hi': '1',
    },
    'q4fl83c1': {
      'en': 'Rajesh Nair',
      'hi': 'राजेश नायर',
    },
    'r26hbsrm': {
      'en': '23 Jan 2024',
      'hi': '23 जनवरी 2024',
    },
    'aauu7pjd': {
      'en': 'Purchase Return',
      'hi': 'खरीद वापसी',
    },
    'vpw37h0k': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    '2jyr63dz': {
      'en': 'Mamta',
      'hi': 'ममता',
    },
    'xmol5mx6': {
      'en': '3210795',
      'hi': '3210795',
    },
    '7yu7f429': {
      'en': ' ',
      'hi': '',
    },
    '5he5zkew': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'jcogehrz': {
      'en': '2',
      'hi': '2',
    },
    'seowuscl': {
      'en': 'Anmol Vidwans',
      'hi': 'अनमोल विद्वान',
    },
    'wx2bxp5h': {
      'en': '6 Feb 2024',
      'hi': '6 फरवरी 2024',
    },
    'snc38cjj': {
      'en': 'Production Issue',
      'hi': 'उत्पादन मुद्दा',
    },
    'zhj02zhl': {
      'en': 'Chennai',
      'hi': 'चेन्नई',
    },
    'j9rdwyg0': {
      'en': 'Chambers',
      'hi': 'मंडलों',
    },
    't9y2u6qk': {
      'en': '0954327',
      'hi': '0954327',
    },
    'izqd0b3c': {
      'en': ' ',
      'hi': '',
    },
    'ekkr05tr': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    'l0lhi80f': {
      'en': '3',
      'hi': '3',
    },
    'be1dv7i2': {
      'en': 'Sumeet Pomani',
      'hi': 'सुमीत पोमानी',
    },
    'uag2e43m': {
      'en': '17 Feb 2024',
      'hi': '17 फरवरी 2024',
    },
    '0ztsy4m1': {
      'en': 'Production Issue',
      'hi': 'उत्पादन समस्या',
    },
    'ctyyrvy3': {
      'en': 'Pune',
      'hi': 'पुणे',
    },
    'syab04fg': {
      'en': 'Kalpataru Ispat',
      'hi': 'कल्पतरु इस्पात',
    },
    'kkxo8mha': {
      'en': '36910295',
      'hi': '3691-05-05T18:30:00Z',
    },
    'fof40tvi': {
      'en': ' ',
      'hi': '',
    },
    'hinc1297': {
      'en': 'Reject',
      'hi': 'अस्वीकार करना',
    },
    '0jq1wnfo': {
      'en': '4',
      'hi': '4',
    },
    'mt44gxul': {
      'en': 'Yogesh Rane',
      'hi': 'योगेश राणे',
    },
    'ibw5dir6': {
      'en': '2 Mar 2024',
      'hi': '2 मार्च 2024',
    },
    'octarbed': {
      'en': 'Purchase Return',
      'hi': 'खरीद वापसी',
    },
    '18uae2tl': {
      'en': 'Bangalore',
      'hi': 'बैंगलोर',
    },
    'ke9wl1u5': {
      'en': 'Techno Tube',
      'hi': 'टेक्नो ट्यूब',
    },
    'p8wgyrkn': {
      'en': '53894109',
      'hi': '5392-05-08T18:30:00Z',
    },
    '75esjvqi': {
      'en': ' ',
      'hi': '',
    },
    '35uqm8b9': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    '7xjt3hni': {
      'en': '5',
      'hi': '5',
    },
    'vev34pn0': {
      'en': 'Suresh B V',
      'hi': 'सुरेश बी वी',
    },
    'iky7a2l1': {
      'en': '20 Mar 2024',
      'hi': '20 मार्च 2024',
    },
    'nbck7d6g': {
      'en': 'Sales',
      'hi': 'बिक्री',
    },
    'yc90i1i1': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'bxxfpegh': {
      'en': 'Agrasen Ispat',
      'hi': 'अग्रसेन इस्पात',
    },
    'v74y1vf3': {
      'en': '9365410',
      'hi': '9365410',
    },
    'hnl89yxx': {
      'en': ' ',
      'hi': '',
    },
    'm0yq32j6': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    '6dpslnoi': {
      'en': 'Outward No.',
      'hi': 'जावक संख्या',
    },
    'amq6zg2r': {
      'en': 'Outward Details',
      'hi': 'जावक विवरण',
    },
    'ohcfgr5t': {
      'en': 'Type',
      'hi': 'प्रकार',
    },
    'xs7fquvi': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'fmgz6vng': {
      'en': 'Material Received from',
      'hi': 'से सामग्री प्राप्त हुई',
    },
    'co2b6pmc': {
      'en': 'Reference Number',
      'hi': 'संदर्भ संख्या',
    },
    '34l73uqc': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '3gkjs3qm': {
      'en': 'Report conclusion',
      'hi': 'रिपोर्ट निष्कर्ष',
    },
    '0x9kyxpr': {
      'en': '6',
      'hi': '6',
    },
    'xcyboe4k': {
      'en': 'Rajesh Nair',
      'hi': 'राजेश नायर',
    },
    'x2bilcok': {
      'en': '23 Jan 2024',
      'hi': '23 जनवरी 2024',
    },
    'co9rk75w': {
      'en': 'Purchase Return',
      'hi': 'खरीद वापसी',
    },
    'zw4s4bqj': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'mvsb03gz': {
      'en': 'Mamta',
      'hi': 'ममता',
    },
    'lihypwsn': {
      'en': '3210795',
      'hi': '3210795',
    },
    'gkhgc4z9': {
      'en': ' ',
      'hi': '',
    },
    'nk9lomdq': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'p64r5h49': {
      'en': '4',
      'hi': '4',
    },
    'ujx5jzti': {
      'en': 'Yogesh Rane',
      'hi': 'योगेश राणे',
    },
    'u6qoceyf': {
      'en': '2 Mar 2024',
      'hi': '2 मार्च 2024',
    },
    '8imgibkq': {
      'en': 'Purchase Return',
      'hi': 'खरीद वापसी',
    },
    '33nrm34v': {
      'en': 'Bangalore',
      'hi': 'बैंगलोर',
    },
    '11th45lv': {
      'en': 'Techno Tube',
      'hi': 'टेक्नो ट्यूब',
    },
    'u39mp0je': {
      'en': '53894109',
      'hi': '5392-05-08T18:30:00Z',
    },
    'wnjas2ob': {
      'en': ' ',
      'hi': '',
    },
    's82tz4rw': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    '5s4jv80h': {
      'en': 'Material Management',
      'hi': 'सामग्री प्रबंधन',
    },
    'dtvgzcdz': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
  },
  // CreateInwardMaterial
  {
    'qnz2z8rc': {
      'en': 'Create Inward Material',
      'hi': 'आवक सामग्री बनाएँ',
    },
    '59gz41ct': {
      'en': 'Purchase Order Number :',
      'hi': 'खरीद क्रम संख्या :',
    },
    'fq5x5mnn': {
      'en': 'Select ...',
      'hi': 'चुनना ...',
    },
    'ixjqhrqi': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'i1qfaoud': {
      'en': 'Inward Number',
      'hi': 'आवक संख्या',
    },
    'nipf4avi': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'iaxhrth8': {
      'en': 'Inwarded On',
      'hi': 'आवक चालू',
    },
    'y4r7xamm': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'pnsovdlk': {
      'en': 'Inwarded by',
      'hi': 'द्वारा आवक',
    },
    'hf8ejdt9': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'p3utquhy': {
      'en': 'Send Apprroval To',
      'hi': 'को अनुमोदन भेजें',
    },
    'uj2up662': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'hqbb9ljs': {
      'en': 'Inward Type :',
      'hi': 'आवक प्रकार:',
    },
    'pvffm8nx': {
      'en': 'Purchase',
      'hi': 'खरीदना',
    },
    '6t1qm3kt': {
      'en': 'Production Receipt',
      'hi': 'उत्पादन रसीद',
    },
    'saimkwzm': {
      'en': 'Sales Return',
      'hi': 'बिक्री वापसी',
    },
    'lqef501l': {
      'en': 'Select Inward Type',
      'hi': 'आवक प्रकार का चयन करें',
    },
    'mhwjqaix': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'authipbh': {
      'en': 'Inward location :',
      'hi': 'आन्तरिक स्थान :',
    },
    'auiw2mt5': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    '863iruua': {
      'en': 'Pune',
      'hi': 'पुणे',
    },
    'gqx4hf5x': {
      'en': 'Banglore',
      'hi': 'बंगलोर',
    },
    'js988zf4': {
      'en': 'Select Inward Location',
      'hi': 'आवक स्थान का चयन करें',
    },
    '5lm0vonz': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'kdsh7fhb': {
      'en': 'Is this received from \'Issued for Subcontract WIP ?',
      'hi': 'क्या यह \'उपअनुबंध के लिए जारी WIP\' से प्राप्त हुआ है?',
    },
    'e49hf3p2': {
      'en': 'Select Material Outward Number',
      'hi': 'सामग्री जावक संख्या का चयन करें',
    },
    '9qd0o2v3': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'dvr4qrrs': {
      'en': 'Material Received From',
      'hi': 'प्राप्त सामग्री',
    },
    'po5o495n': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'euqxrozp': {
      'en': '',
      'hi': '',
    },
    'ncj8xc9o': {
      'en': 'Reference Number',
      'hi': 'संदर्भ संख्या',
    },
    '43xnubtr': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'bz8y4w0e': {
      'en': '',
      'hi': '',
    },
    '1ttzggn7': {
      'en': 'User Remarks ',
      'hi': 'उपयोगकर्ता टिप्पणियाँ',
    },
    's59k6uit': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'hap8ah1s': {
      'en': '',
      'hi': '',
    },
    '535nzf5v': {
      'en': 'QR scanner :',
      'hi': 'क्यूआर स्कैनर:',
    },
    'qjleqns0': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'wfj932ms': {
      'en': 'Inward Table :',
      'hi': 'आवक तालिका:',
    },
    'gwiwtdlq': {
      'en': 'Add Item',
      'hi': 'मद जोड़ें',
    },
    'u1guegpu': {
      'en': 'Card Header',
      'hi': 'कार्ड हेडर',
    },
    't3i8zuv5': {
      'en': 'Filter',
      'hi': 'फ़िल्टर',
    },
    'fj4lqu2n': {
      'en': 'Search users...',
      'hi': 'उपयोगकर्ता खोजें...',
    },
    'h7hwjrvp': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    '44cy1n8t': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'p2d9ggs6': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '4mqp2s67': {
      'en': 'Required Qty\n(Po qty)',
      'hi': 'आवश्यक मात्रा\n(पीओ मात्रा)',
    },
    'n8stqh89': {
      'en': 'Purchase Quantity',
      'hi': 'खरीद की मात्रा',
    },
    'd3818c53': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'oie97q8u': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'glikikjy': {
      'en': 'Received Quantity',
      'hi': 'प्राप्त मात्रा',
    },
    'goxt6jop': {
      'en': 'rate/unit',
      'hi': 'दर/इकाई',
    },
    'ehu6r7jk': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'vxli7knr': {
      'en': 'QR Verified',
      'hi': 'क्यूआर सत्यापित',
    },
    'dpbdt4ye': {
      'en': '10',
      'hi': '10',
    },
    '58qye46y': {
      'en': 'Sent for approval',
      'hi': 'अनुमोदन हेतु भेजा गया',
    },
    '9668ul8a': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '3tjixdfo': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'n7c9r5ol': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'gwov2ech': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'ap9xyll0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'udvmporl': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'b8wk1ras': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'l6h1pnt5': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'no5crd7t': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'pgbx5vxa': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'lrj92pae': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '12htqu70': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'rlmmd9dd': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'd3sojs0a': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'xqzyilz9': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'vf0zyzk2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'wtp7gvhb': {
      'en': 'Inward Material',
      'hi': 'आवक सामग्री',
    },
    'ibua40bo': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Inve
  {
    '9mu6qqbq': {
      'en': 'Page Title',
      'hi': 'पृष्ठ का शीर्षक',
    },
    '24jgjehb': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    'zjgelrm9': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'cse3yg90': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'sro0i89i': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '51s4s24w': {
      'en': 'Available Qty',
      'hi': 'उपलब्ध मात्रा',
    },
    'nx9jnepl': {
      'en': 'Qty to be issued (SO qty)',
      'hi': 'जारी की जाने वाली मात्रा (SO मात्रा)',
    },
    '89jiryl4': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'y34l08eu': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'ju3uftg9': {
      'en': 'Finish',
      'hi': 'खत्म करना',
    },
    'ord67zo1': {
      'en': 'Edge',
      'hi': 'किनारा',
    },
    'en1njybe': {
      'en': 'No Of Pcs',
      'hi': 'पीसी की संख्या',
    },
    '27i1munw': {
      'en': 'HR Coil No',
      'hi': 'एचआर कॉइल नं',
    },
    'uszfz18h': {
      'en': 'Grade',
      'hi': 'श्रेणी',
    },
    'bh1kfn29': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    'fktz1db7': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    '1a0035cd': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'vuyc49d3': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    'cx183vyg': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'ol92gd5s': {
      'en': '100',
      'hi': '100',
    },
    'urxr9xkd': {
      'en': '100',
      'hi': '100',
    },
    'hn10zyib': {
      'en': '100',
      'hi': '100',
    },
    'oukd2daq': {
      'en': ' ',
      'hi': '',
    },
    'ii4dce8a': {
      'en': '2B',
      'hi': '2 बी',
    },
    'mjct6cb5': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'bxfnc0up': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'pdsk1axd': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    '3a1n3o1f': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'yf264x1x': {
      'en': 'SS003',
      'hi': 'एसएस003',
    },
    'y4alyf9z': {
      'en': '3.00X1500.0',
      'hi': '3.00X1500.0',
    },
    's7hkkmb4': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'ngwnb2k8': {
      'en': 'MHR3210OPR',
      'hi': 'एमएचआर3210ओपीआर',
    },
    'f431i802': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'ktlyx9hw': {
      'en': '212',
      'hi': '212',
    },
    '3ej6np6k': {
      'en': '75',
      'hi': '75',
    },
    '769idhli': {
      'en': '45',
      'hi': '45',
    },
    'lg761xtn': {
      'en': ' ',
      'hi': '',
    },
    'sh2siadx': {
      'en': ' ',
      'hi': '',
    },
    'zcuy3re6': {
      'en': ' ',
      'hi': '',
    },
    'yjz2fd70': {
      'en': '216 ua',
      'hi': '216 यूए',
    },
    'l9tfy7rv': {
      'en': '0000543798',
      'hi': '0000543798',
    },
    '1erx6sqx': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'bhmvxqxn': {
      'en': 'SS004',
      'hi': 'एसएस004',
    },
    'itucx58j': {
      'en': '4.00X1500.0',
      'hi': '4.00X1500.0',
    },
    '9p55j9xw': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'sbn69ldf': {
      'en': 'TDE6979JGN',
      'hi': 'TDE6979JGN',
    },
    '06ov6icd': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'jmhk5fmg': {
      'en': '478',
      'hi': '478',
    },
    'nojwanc0': {
      'en': '319',
      'hi': '319',
    },
    'q0fagcnt': {
      'en': '63',
      'hi': '63',
    },
    'xbp0csj9': {
      'en': ' ',
      'hi': '',
    },
    '5p6fgdkr': {
      'en': ' ',
      'hi': '',
    },
    'kdjyusfn': {
      'en': ' ',
      'hi': '',
    },
    'h5ys41xm': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'nd316mgq': {
      'en': '0000943564',
      'hi': '0000943564',
    },
    'qvqn6kyu': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '3tewlb8o': {
      'en': 'SS001',
      'hi': 'एसएस001',
    },
    '9m2dn3vd': {
      'en': '0.8X1350.0X2500.0',
      'hi': '0.8X1350.0X2500.0',
    },
    'qtjfc4af': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'e18y7g4p': {
      'en': 'tre394865iuy',
      'hi': 'tre394865iuy',
    },
    'baqbqga5': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    '5ztprteq': {
      'en': '100',
      'hi': '100',
    },
    'x82bi4l0': {
      'en': '100',
      'hi': '100',
    },
    'ivet0za1': {
      'en': '90',
      'hi': '90',
    },
    's5o0q8nk': {
      'en': ' ',
      'hi': '',
    },
    't5zipl5t': {
      'en': ' ',
      'hi': '',
    },
    'jy4e6xnk': {
      'en': 'Mill Edge',
      'hi': 'मिल एज',
    },
    '80p27nli': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'ea1he4kl': {
      'en': '0000932664',
      'hi': '0000932664',
    },
    '69bh2psv': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'uy9fdexw': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    'qlq2g07a': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    'p7o2e6pc': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'ool88prs': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    'ykpvzcoq': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'bv9ngjw4': {
      'en': '100',
      'hi': '100',
    },
    'kgjswrbl': {
      'en': '100',
      'hi': '100',
    },
    'd9ucnrlk': {
      'en': '53',
      'hi': '53',
    },
    'oqspp28a': {
      'en': '  ',
      'hi': '',
    },
    '3yhegcht': {
      'en': '2B ',
      'hi': '2 बी',
    },
    '2vyyug3w': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'ug5qqtbq': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'rxtrbei3': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'kaw8tuh0': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '08wjacr9': {
      'en': 'SS005',
      'hi': 'एसएस005',
    },
    'l3nllmfc': {
      'en': '0.8210X1250.0X2500.0',
      'hi': '0.8210X1250.0X2500.0',
    },
    'm24q929m': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'v449jarf': {
      'en': '6543REXDU',
      'hi': '6543रेक्सडु',
    },
    'qfai19jr': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'phi4exj3': {
      'en': '150',
      'hi': '150',
    },
    'd11qwqme': {
      'en': '145',
      'hi': '145',
    },
    '3ipqivm4': {
      'en': '100',
      'hi': '100',
    },
    'ql19tc5r': {
      'en': ' ',
      'hi': '',
    },
    'm06n9zvs': {
      'en': '2B',
      'hi': '2 बी',
    },
    'yx97310y': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'j62ge70h': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'kf29wixa': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'i2a9vhjy': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'bqwnr2vy': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ApprovalInward
  {
    '26al32f8': {
      'en': 'Approval Inward Material',
      'hi': 'अनुमोदन आवक सामग्री',
    },
    'r3gadcsg': {
      'en': 'Workflow History',
      'hi': 'कार्यप्रवाह इतिहास',
    },
    'y9pggx6b': {
      'en': 'Purchase Order Number :',
      'hi': 'खरीद क्रम संख्या :',
    },
    '82dyia2y': {
      'en': 'Inward Number :',
      'hi': 'आवक संख्या :',
    },
    'erqzise3': {
      'en': 'Inwarded On : ',
      'hi': 'आवक चालू:',
    },
    '0lxbmyn6': {
      'en': 'Inwarded By : ',
      'hi': 'द्वारा आवक:',
    },
    '3f1ba4yb': {
      'en': 'Inward Type :',
      'hi': 'आवक प्रकार :',
    },
    'g1xm24d2': {
      'en': 'Inward location :',
      'hi': 'आन्तरिक स्थान :',
    },
    '00h4ikrf': {
      'en': 'Issued for Subcontract WIP :',
      'hi': 'उपठेका WIP के लिए जारी:',
    },
    '25tebwzs': {
      'en': 'Material Outward Number :',
      'hi': 'सामग्री जावक संख्या :',
    },
    'jqqmop9v': {
      'en': 'Material Received From :',
      'hi': 'यहां से प्राप्त सामग्री :',
    },
    '3iaa0ngu': {
      'en': 'Reference Number :',
      'hi': 'संदर्भ संख्या :',
    },
    'avv5i949': {
      'en': 'User Remark :',
      'hi': 'उपयोगकर्ता टिप्पणी :',
    },
    'zyegpp7p': {
      'en': 'Workflow Status :',
      'hi': 'वर्तमान में नियुक्त:',
    },
    '3gv24uet': {
      'en': 'In Progress',
      'hi': 'प्रगति पर है',
    },
    'pkhhonyg': {
      'en': 'Currently Assigned To :',
      'hi': 'वर्तमान में नियुक्त:',
    },
    '0lzcjly6': {
      'en': 'Inward Table :',
      'hi': 'आवक तालिका:',
    },
    '112utx8n': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    'qd8qzazz': {
      'en': 'Items Category',
      'hi': 'आइटम श्रेणी',
    },
    '4mqybqg1': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'f28876gn': {
      'en': 'Required Qty\n(Po qty)',
      'hi': 'आवश्यक मात्रा\n(पीओ मात्रा)',
    },
    'bf34wb9a': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'rc20kp5j': {
      'en': 'Received Quantity',
      'hi': 'प्राप्त मात्रा',
    },
    '8bomfb7m': {
      'en': 'Rate',
      'hi': 'दर',
    },
    '4em5rzkd': {
      'en': 'Remark',
      'hi': 'टिप्पणी',
    },
    '2v0gltyt': {
      'en': 'QR Verified',
      'hi': 'क्यूआर सत्यापित',
    },
    'beo82v90': {
      'en': 'Incoming Quality Report :',
      'hi': 'आने वाली गुणवत्ता रिपोर्ट :',
    },
    'itoba689': {
      'en': 'Report Conclusion:',
      'hi': 'रिपोर्ट निष्कर्ष:',
    },
    'gu0uur5j': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'joal05ug': {
      'en': 'Rejected',
      'hi': 'अस्वीकार कर दिया',
    },
    'y7hcs85b': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    'xlv0nvho': {
      'en': 'Select Report conclusion...',
      'hi': 'रिपोर्ट निष्कर्ष चुनें...',
    },
    'rlsetfux': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    '0tps2clz': {
      'en': 'Approver Remarks ',
      'hi': 'अनुमोदक टिप्पणियाँ',
    },
    'hrysg0m2': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'lp3wsqzm': {
      'en': 'Submit',
      'hi': 'जमा करना',
    },
    '9f291pba': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'perf4sso': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'g3w0pl2r': {
      'en': 'Approval Inward Material',
      'hi': 'अनुमोदन आवक सामग्री',
    },
    '8iecuzal': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // DropdownPage
  {
    'gsavxbdd': {
      'en': 'Search ....',
      'hi': 'खोज ....',
    },
    'rbdhma4i': {
      'en': 'Inward Material - Inward Type',
      'hi': 'आवक सामग्री - आवक प्रकार',
    },
    '361xelhf': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'psgqj4te': {
      'en': 'Inward Material - Inward Location',
      'hi': 'आवक सामग्री - आवक स्थान',
    },
    '6qo0brzr': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'kw771xwx': {
      'en': 'Outward Material - Outward Type',
      'hi': 'जावक सामग्री - जावक प्रकार',
    },
    't60hpp5f': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'lxhuybwy': {
      'en': 'Outward Material - Outward Warehouse',
      'hi': 'जावक सामग्री - जावक गोदाम',
    },
    'b45iansz': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'gkkpnu45': {
      'en': 'Outward Material - Issue To',
      'hi': 'जावक सामग्री - जारी करने के लिए',
    },
    '00uaikh3': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'ix2wrf6w': {
      'en': 'Dropdown Management',
      'hi': 'ड्रॉपडाउन प्रबंधन',
    },
    '030wu2l3': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ApprovalOutward
  {
    '7y1vk5tt': {
      'en': 'Approval Outward Material',
      'hi': 'अनुमोदन जावक सामग्री',
    },
    '3igayvvt': {
      'en': 'Workflow History',
      'hi': 'कार्यप्रवाह इतिहास',
    },
    'qffn0zq1': {
      'en': 'Sales Order No :',
      'hi': 'विक्रय आदेश संख्या :',
    },
    'frg3w2ob': {
      'en': '3299',
      'hi': '3299',
    },
    'eah0ssbk': {
      'en': 'Outward Number :',
      'hi': 'जावक संख्या :',
    },
    'ax1kamn1': {
      'en': '6',
      'hi': '6',
    },
    'jw7kqw55': {
      'en': 'Outwarded On : ',
      'hi': 'बाहर की ओर:',
    },
    'meisb2s5': {
      'en': '23 Jan 2024',
      'hi': '23 जनवरी 2024',
    },
    'exnlsexk': {
      'en': 'Outwarded by:',
      'hi': 'द्वारा बाहर किया गया:',
    },
    '2w6jdhcg': {
      'en': 'Rajesh Nair',
      'hi': 'राजेश नायर',
    },
    'eqkefdzk': {
      'en': 'Send Approval to :',
      'hi': 'स्वीकृति भेजें:',
    },
    'hhkyrvnv': {
      'en': 'Elde',
      'hi': 'एल्डे',
    },
    'p8pevnej': {
      'en': 'Outward Type:',
      'hi': 'जावक प्रकार:',
    },
    'vssmuu7h': {
      'en': 'Purchase Return',
      'hi': 'खरीद वापसी',
    },
    'dhzlj3g0': {
      'en': 'Outward Warehouse : ',
      'hi': 'जावक गोदाम:',
    },
    'o0zf0sq9': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    '0a0x7b0z': {
      'en': 'Supplier Name :',
      'hi': 'आपूर्तिकर्ता का नाम :',
    },
    '1ghedwnt': {
      'en': 'Vinod',
      'hi': 'विनोद',
    },
    'cajtq3bz': {
      'en': 'Issued for Subcontract WIP:',
      'hi': 'उप-अनुबंध WIP के लिए जारी:',
    },
    'unx3l7zq': {
      'en': ' Yes',
      'hi': 'हाँ',
    },
    '0uonr3a9': {
      'en': 'Material Handed Over to: ',
      'hi': 'सामग्री इन्हें सौंपी गई:',
    },
    'g8bb3p2r': {
      'en': 'Elde',
      'hi': 'एल्डे',
    },
    'j0aiypbc': {
      'en': 'Delivered To :',
      'hi': 'बितरण किया :',
    },
    '6kcknhbe': {
      'en': 'Nishant',
      'hi': 'निशांत',
    },
    'hqfk348j': {
      'en': 'Issued To :',
      'hi': 'के लिए जारी किए :',
    },
    '2iw0ysn4': {
      'en': ' Mamta',
      'hi': 'ममता',
    },
    'ykxjzywp': {
      'en': 'QR scanner :',
      'hi': 'क्यूआर स्कैनर:',
    },
    '5utmc4jw': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'kd4rsged': {
      'en': 'Outward Table :',
      'hi': 'जावक तालिका :',
    },
    'jfb0b9o9': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    '68jvt69f': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'ooofn8pp': {
      'en': 'Lot No',
      'hi': '',
    },
    'rktl36uf': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'bqza93et': {
      'en': 'Available Qty',
      'hi': 'उपलब्ध मात्रा',
    },
    'ihzutcz3': {
      'en': 'Qty to be issued (SO qty)',
      'hi': 'जारी की जाने वाली मात्रा (SO मात्रा)',
    },
    'yvjdv2ah': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'wgc01qym': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'liqh02eh': {
      'en': 'Finish',
      'hi': 'खत्म करना',
    },
    'u7nam88t': {
      'en': 'Edge',
      'hi': 'किनारा',
    },
    'ebw2yh8v': {
      'en': 'No Of Pcs',
      'hi': 'पीसी की संख्या',
    },
    'mahwzm6o': {
      'en': 'HR Coil No',
      'hi': 'एचआर कॉइल नं',
    },
    '3x4sxurs': {
      'en': 'Grade',
      'hi': 'श्रेणी',
    },
    'h335qwzq': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    '4aewe6ms': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    'toeaj9be': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'c9fa35v5': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    's9e0kr57': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    '8srub9xf': {
      'en': '100',
      'hi': '100',
    },
    'uk4zk414': {
      'en': '100',
      'hi': '100',
    },
    '1x6xe5xf': {
      'en': '100',
      'hi': '100',
    },
    '1drtyquf': {
      'en': ' ',
      'hi': '',
    },
    'ks3g4i2h': {
      'en': '2B',
      'hi': '2 बी',
    },
    'q1bfhvg7': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'rzzntme5': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'umrjf2j6': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'w17k29o2': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'kxfkmhif': {
      'en': 'SS003',
      'hi': 'एसएस003',
    },
    'zn49czsz': {
      'en': '3.00X1500.0',
      'hi': '3.00X1500.0',
    },
    '9asw4u31': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    '9ijnoh4k': {
      'en': 'MHR3210OPR',
      'hi': 'एमएचआर3210ओपीआर',
    },
    'fdtarytp': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'k1s1gc1s': {
      'en': '212',
      'hi': '212',
    },
    'lecp166k': {
      'en': '75',
      'hi': '75',
    },
    'w8ctgqz3': {
      'en': '45',
      'hi': '45',
    },
    'lxe1w4ao': {
      'en': ' ',
      'hi': '',
    },
    'xjq1lspt': {
      'en': ' ',
      'hi': '',
    },
    've6imckq': {
      'en': ' ',
      'hi': '',
    },
    'jzmqnuvr': {
      'en': '216 ua',
      'hi': '216 यूए',
    },
    'ya2e4lhk': {
      'en': '0000543798',
      'hi': '0000543798',
    },
    'o17t62dk': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '8wq019jp': {
      'en': 'SS004',
      'hi': 'एसएस004',
    },
    'mhshyxet': {
      'en': '4.00X1500.0',
      'hi': '4.00X1500.0',
    },
    'ecwe8ato': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'tucf7mvc': {
      'en': 'TDE6979JGN',
      'hi': 'TDE6979JGN',
    },
    'l0ndoq4t': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    '0qktzxbg': {
      'en': '478',
      'hi': '478',
    },
    'fs8euf4q': {
      'en': '319',
      'hi': '319',
    },
    '5y53mrcd': {
      'en': '63',
      'hi': '63',
    },
    'cajb1vqi': {
      'en': ' ',
      'hi': '',
    },
    'fcokbjxg': {
      'en': ' ',
      'hi': '',
    },
    '0o6xa9gf': {
      'en': ' ',
      'hi': '',
    },
    '4r70jha5': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'iuizburt': {
      'en': '0000943564',
      'hi': '0000943564',
    },
    '20clckrb': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '6sfjui59': {
      'en': 'SS001',
      'hi': 'एसएस001',
    },
    '51x2w1o6': {
      'en': '0.8X1350.0X2500.0',
      'hi': '0.8X1350.0X2500.0',
    },
    '0j0du1zy': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'k7atvzki': {
      'en': 'tre394865iuy',
      'hi': 'tre394865iuy',
    },
    'sxqpmf90': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'u7zzsym2': {
      'en': '100',
      'hi': '100',
    },
    'ou8ta84x': {
      'en': '100',
      'hi': '100',
    },
    'brc2xmex': {
      'en': '90',
      'hi': '90',
    },
    'mkm3qcuw': {
      'en': ' ',
      'hi': '',
    },
    'un6prjca': {
      'en': ' ',
      'hi': '',
    },
    '0sgb3y29': {
      'en': 'Mill Edge',
      'hi': 'मिल एज',
    },
    '6g93cjxy': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'ln25jpgl': {
      'en': '0000932664',
      'hi': '0000932664',
    },
    'zdxrsjyw': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'urdc3yiq': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    '4f4qpum2': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    'j86eznt6': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'p16y1en9': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    'h5mn55wx': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'eym652jg': {
      'en': '100',
      'hi': '100',
    },
    'fymazfr2': {
      'en': '100',
      'hi': '100',
    },
    'azz6psxx': {
      'en': '53',
      'hi': '53',
    },
    'yd28ebrz': {
      'en': '  ',
      'hi': '',
    },
    'j4bww5y8': {
      'en': '2B ',
      'hi': '2 बी',
    },
    '1g5g3k7f': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'xzhvtebp': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'yf171ha6': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'ajt5dion': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '0nb4badd': {
      'en': 'SS005',
      'hi': 'एसएस005',
    },
    'vllx0tyi': {
      'en': '0.8210X1250.0X2500.0',
      'hi': '0.8210X1250.0X2500.0',
    },
    'buoagux4': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    '75rs94ns': {
      'en': '6543REXDU',
      'hi': '6543रेक्सडु',
    },
    'yh87rbvy': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'u9lw87vz': {
      'en': '150',
      'hi': '150',
    },
    '5mykps9a': {
      'en': '145',
      'hi': '145',
    },
    'bfxxxmv2': {
      'en': '100',
      'hi': '100',
    },
    'nik9nzhr': {
      'en': ' ',
      'hi': '',
    },
    'bdsawhso': {
      'en': '2B',
      'hi': '2 बी',
    },
    '77ry0vp7': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'cw36llag': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'l1wvkjqd': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'liecl0t4': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'md40z7qn': {
      'en': 'Remarks ',
      'hi': 'टिप्पणी',
    },
    'h88mij5d': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'tsabj2kn': {
      'en': '',
      'hi': '',
    },
    'dixpiwn0': {
      'en': 'Quality Report :',
      'hi': 'गुणवत्ता रिपोर्ट:',
    },
    'g8ag2ubz': {
      'en': 'Report Conclusion:',
      'hi': 'रिपोर्ट निष्कर्ष:',
    },
    'cqewd3vv': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'w2qxodea': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'a4uzup86': {
      'en': 'Rejected',
      'hi': 'अस्वीकार कर दिया',
    },
    'g9fiw49x': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    'sokt2g64': {
      'en': 'Select Report conclusion...',
      'hi': 'रिपोर्ट निष्कर्ष चुनें...',
    },
    'n88uccsf': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'a9qo67lc': {
      'en': 'Approver Remarks ',
      'hi': 'अनुमोदक टिप्पणियाँ',
    },
    'ob3igz8s': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'zlb5p0jx': {
      'en': '',
      'hi': '',
    },
    'b2p925m9': {
      'en': 'Submit',
      'hi': 'जमा करना',
    },
    'ar11vy1g': {
      'en': 'Approval Outward Material',
      'hi': 'अनुमोदन जावक सामग्री',
    },
    'vqu5uhp0': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ItemMaster
  {
    'tnw7kpqn': {
      'en': 'Define Paramaeter',
      'hi': 'पैरामीटर को परिभाषित करें',
    },
    'p7g38k5u': {
      'en': 'New',
      'hi': 'नया',
    },
    'lzh5aw6k': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    'aqkuqtvt': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    'hh9tq0lp': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'mpjxgr4r': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '5pdtmll5': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'gfck3x3b': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    'sdppdvoi': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    '8igl59s4': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
    },
    'zxdhc27a': {
      'en': 'Edit Column 3',
      'hi': 'कॉलम 3 संपादित करें',
    },
    '7arqg5tu': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'ep1awqkb': {
      'en': 'Edit Column 4',
      'hi': 'कॉलम 4 संपादित करें',
    },
    '0ev0spll': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '1fog0brv': {
      'en': 'Edit Column 5',
      'hi': 'कॉलम 5 संपादित करें',
    },
    'ckv2ju57': {
      'en': 'Edit Header 6',
      'hi': 'शीर्षलेख 6 संपादित करें',
    },
    '2pvb28hl': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    '3485ie6i': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    'yy7ybvgu': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'cotedf44': {
      'en': 'UoM',
      'hi': '',
    },
    'affkdw6y': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'pd6od0g3': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    'poofbqlu': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    '2trgwnt1': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'kpympqdl': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '2i9lod7l': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    's0cs75p5': {
      'en': 'Item Master',
      'hi': 'आइटम मास्टर',
    },
    'ac5z9y8g': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
  },
  // ResetPasswordPage
  {
    '573gvs09': {
      'en': 'Reset Password',
      'hi': 'पासवर्ड रीसेट',
    },
    'c5b35izs': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
    },
    '4pwpub7m': {
      'en': 'New Password',
      'hi': 'नया पासवर्ड',
    },
    'n4b6joqr': {
      'en': 'Enter your new password....',
      'hi': 'अपना नया पासवर्ड दर्ज करें....',
    },
    'm8s58kgi': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    'y11cilet': {
      'en': 'Enter to confirm your password',
      'hi': 'अपना पासवर्ड पुष्टि करने के लिए दर्ज करें',
    },
    'p7ops2yr': {
      'en': 'New Password and confirm password should be same',
      'hi': 'नया पासवर्ड और कन्फर्म पासवर्ड एक ही होना चाहिए',
    },
    '3ybuajoo': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
    },
    '8zm1etdx': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '9nfzhdri': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'q4g4wnlc': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'zpayne2c': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'l3ze0tol': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // HistoryCardsInward
  {
    'muru7iz3': {
      'en': 'Search any contact...',
      'hi': 'कोई भी संपर्क खोजें...',
    },
    'ebedexf2': {
      'en': 'History Card',
      'hi': 'इतिहास कार्ड',
    },
    'w7p82lu6': {
      'en': 'Step Name',
      'hi': 'चरण का नाम',
    },
    'tuq4sm32': {
      'en': 'Submitted By',
      'hi': 'द्वारा प्रस्तुत',
    },
    'dob37nz7': {
      'en': 'Submitted On',
      'hi': 'पर प्रस्तुत की',
    },
    'di8w22nh': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'o2kb5mi8': {
      'en': 'Step Name',
      'hi': 'चरण का नाम',
    },
    '9aibutwz': {
      'en': 'Submitted By',
      'hi': 'द्वारा प्रस्तुत',
    },
    'chfjmf24': {
      'en': 'Submitted On',
      'hi': 'पर प्रस्तुत की',
    },
    'di0jlhzh': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'q6jxb69f': {
      'en': 'History Card',
      'hi': 'इतिहास कार्ड',
    },
  },
  // ViewInward
  {
    'em8dlj6v': {
      'en': 'View Inward Material',
      'hi': 'अनुमोदन आवक सामग्री',
    },
    'ex2medvo': {
      'en': 'Workflow History',
      'hi': 'वर्कफ़्लो इतिहास',
    },
    'kwx9y44r': {
      'en': 'Purchase Order Number :',
      'hi': 'खरीद क्रम संख्या :',
    },
    'd9sfusvp': {
      'en': 'Inward Number :',
      'hi': 'आवक संख्या :',
    },
    'kwjezrs2': {
      'en': 'Inwarded On : ',
      'hi': 'आवक चालू:',
    },
    'vo146wrh': {
      'en': 'Inwarded By : ',
      'hi': 'द्वारा अंदर की ओर :',
    },
    'k8zr8of2': {
      'en': 'Inward Type :',
      'hi': 'आवक प्रकार:',
    },
    '4kabikr6': {
      'en': 'Inward location :',
      'hi': 'आवक स्थान :',
    },
    'pgdosjps': {
      'en': 'Issued for Subcontract WIP :',
      'hi': 'उपठेका WIP के लिए जारी:',
    },
    's63pnouo': {
      'en': 'Material Outward Number :',
      'hi': 'सामग्री जावक संख्या:',
    },
    'f7zc7jfn': {
      'en': 'Material Received From :',
      'hi': 'यहां से प्राप्त सामग्री :',
    },
    '7k9wy6zu': {
      'en': 'Reference Number :',
      'hi': 'संदर्भ संख्या :',
    },
    '4jkm4a7s': {
      'en': 'User Remark :',
      'hi': 'उपयोगकर्ता टिप्पणी :',
    },
    'avl2stq7': {
      'en': 'Currently Assigned To :',
      'hi': 'वर्तमान में नियुक्त:',
    },
    '0so7u8w0': {
      'en': 'Completed By :',
      'hi': 'द्वारा पूर्ण की गयी :',
    },
    'siuy78c4': {
      'en': 'Workflow Status :',
      'hi': 'वर्कफ़्लो स्थिति:',
    },
    'cxxk9vmx': {
      'en': 'Inward Table :',
      'hi': 'आवक तालिका:',
    },
    'llyk84pr': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    '8g9pxpud': {
      'en': 'Category',
      'hi': 'वर्ग',
    },
    'lqaf1hvp': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'ye0m9gq9': {
      'en': 'Required Qty\n(Po qty)',
      'hi': 'आवश्यक मात्रा\n(पीओ मात्रा)',
    },
    'mx75k3mk': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'g360ianz': {
      'en': 'Received Quantity',
      'hi': 'प्राप्त मात्रा',
    },
    'j2ozsgq0': {
      'en': 'Rate',
      'hi': 'दर',
    },
    'g8ceojme': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '6b1xpv4t': {
      'en': 'QR Verified',
      'hi': '',
    },
    'ofzj06i0': {
      'en': 'Incoming Quality Report :',
      'hi': 'आने वाली गुणवत्ता रिपोर्ट :',
    },
    '06d0ijdj': {
      'en': 'Report Conclusion:',
      'hi': 'रिपोर्ट निष्कर्ष:',
    },
    'rexba8pn': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'pq3xe3ze': {
      'en': 'Rejected',
      'hi': 'अस्वीकार कर दिया',
    },
    'hm9j55s3': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    '9u8sw6v9': {
      'en': 'Select Report conclusion...',
      'hi': 'रिपोर्ट निष्कर्ष चुनें...',
    },
    '6hu1bq8f': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'ofellasa': {
      'en': 'Approver Remarks ',
      'hi': 'अनुमोदक टिप्पणियाँ',
    },
    'j56twdrq': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'vjbq3f67': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ffs24dto': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'stib9xg9': {
      'en': 'View Inward Material',
      'hi': 'आवक सामग्री देखें',
    },
    '2nl8m2sw': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // InwardBack
  {
    '91isknrp': {
      'en': 'Approval Inward Material',
      'hi': 'अनुमोदन आवक सामग्री',
    },
    '9zekkzmw': {
      'en': 'Workflow History',
      'hi': 'कार्यप्रवाह इतिहास',
    },
    'ajtc2t9n': {
      'en': 'Purchase Order Number :',
      'hi': 'खरीद क्रम संख्या :',
    },
    '0t7wexhg': {
      'en': 'Select ...',
      'hi': 'चुनना ...',
    },
    '7usq5nt2': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'ozid3hs4': {
      'en': 'Inward Number',
      'hi': 'आवक संख्या',
    },
    'ylba1l7p': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    '6uwddh7e': {
      'en': 'Inwarded On',
      'hi': 'आवक चालू',
    },
    'b4hkfe2e': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'bcszzdhb': {
      'en': 'Inwarded by',
      'hi': 'द्वारा अंदर की ओर',
    },
    'd8n6xs7p': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'gk6fmit0': {
      'en': 'Send Apprroval To',
      'hi': 'को अनुमोदन भेजें',
    },
    'cyxm0mbb': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'arnrimy7': {
      'en': 'Workflow Status',
      'hi': 'कार्यप्रवाह स्थिति',
    },
    'wo5mtu5z': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    's1643jbj': {
      'en': 'In Progress',
      'hi': 'प्रगति पर है',
    },
    'o7sqe93d': {
      'en': 'Inward Type :',
      'hi': 'आवक प्रकार:',
    },
    'jfgdfiwd': {
      'en': 'Purchase',
      'hi': 'खरीदना',
    },
    's7nukv5j': {
      'en': 'Production Receipt',
      'hi': 'उत्पादन रसीद',
    },
    'p2x2ochy': {
      'en': 'Sales Return',
      'hi': 'बिक्री वापसी',
    },
    'hnyp1ulq': {
      'en': 'Select Inward Type',
      'hi': 'आवक प्रकार का चयन करें',
    },
    'tdh723yv': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    '5saqr1o0': {
      'en': 'Inward location :',
      'hi': 'आवक स्थान :',
    },
    'g7if3w5z': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'qnjcjsz4': {
      'en': 'Pune',
      'hi': 'पुणे',
    },
    '7pe08a3h': {
      'en': 'Banglore',
      'hi': 'बंगलोर',
    },
    'tkagqrng': {
      'en': 'Select Inward Location',
      'hi': 'आवक स्थान का चयन करें',
    },
    '6x4vf88a': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    '8lhgji91': {
      'en': 'Is this received from \'Issued for Subcontract WIP ?',
      'hi': 'क्या यह \'उपअनुबंध के लिए जारी WIP\' से प्राप्त हुआ है?',
    },
    'kha9nute': {
      'en': 'Select Material Outward Number',
      'hi': 'सामग्री जावक संख्या का चयन करें',
    },
    'gcv5z4yd': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '1dq9lc2h': {
      'en': 'Material Received From',
      'hi': 'से सामग्री प्राप्त हुई',
    },
    'dcy8atsw': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fxdexgb7': {
      'en': 'Reference Number',
      'hi': 'संदर्भ संख्या',
    },
    'lhwzg82e': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'a6twr8al': {
      'en': 'User Remarks ',
      'hi': 'उपयोगकर्ता टिप्पणियाँ',
    },
    '13spvmru': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'dlhps1ua': {
      'en': 'QR scanner :',
      'hi': 'क्यूआर स्कैनर:',
    },
    '8sze4fn9': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'nek9xnxi': {
      'en': 'Inward Table :',
      'hi': 'आवक तालिका:',
    },
    'y5jmtyw7': {
      'en': 'Add Item',
      'hi': 'मद जोड़ें',
    },
    'oyd7q9k8': {
      'en': 'Card Header',
      'hi': 'कार्ड हेडर',
    },
    '1kq8vpl8': {
      'en': 'Filter',
      'hi': 'फ़िल्टर',
    },
    'j94w73n5': {
      'en': 'Search users...',
      'hi': 'उपयोगकर्ता खोजें...',
    },
    '6v2xq04c': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    'c0gyc5kh': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'l9a1agyx': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '6i6wcdnk': {
      'en': 'Required Qty\n(Po qty)',
      'hi': 'आवश्यक मात्रा\n(पीओ मात्रा)',
    },
    '77dgj3en': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'gvdl1px3': {
      'en': 'Received Quantity',
      'hi': 'प्राप्त मात्रा',
    },
    'u3rhp1n0': {
      'en': 'rate/unit',
      'hi': 'दर/इकाई',
    },
    'oq768nzx': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'qlpigmzg': {
      'en': 'QR Verified',
      'hi': 'क्यूआर सत्यापित',
    },
    'tkni6dzn': {
      'en': 'Incoming Quality Report :',
      'hi': 'आने वाली गुणवत्ता रिपोर्ट :',
    },
    '50m9sfpw': {
      'en': 'Report Conclusion:',
      'hi': 'रिपोर्ट निष्कर्ष:',
    },
    'wcpq04nz': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    'gf2h1lfz': {
      'en': 'Rejected',
      'hi': 'अस्वीकार कर दिया',
    },
    '6j83h9ne': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    '58qy09df': {
      'en': 'Select Report conclusion...',
      'hi': 'रिपोर्ट निष्कर्ष चुनें...',
    },
    'uqbq56ss': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'y0xxksfz': {
      'en': 'Approver Remarks ',
      'hi': 'अनुमोदक टिप्पणी',
    },
    '80pdlbsc': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'uwgq4tjd': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '9xuz5ow4': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'hgwfknlp': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '3eb8uivf': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'tjvzv74z': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'cf10ufbh': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'zxhote4g': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'x9v8wmf3': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'duzelrkk': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ott6gq2g': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'b5rf55zv': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '5h2fmwb4': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'z4jlqyb8': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '7bpf4q91': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'ao298e6n': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '5yd2lp5f': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'jsz16bx4': {
      'en': 'Sent for approval',
      'hi': 'अनुमोदन हेतु भेजा गया',
    },
    'x3dgpy93': {
      'en': 'Approval Inward Material',
      'hi': 'अनुमोदन आवक सामग्री',
    },
    'er0ia219': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // CreateOutwardMaterial
  {
    'b89fxm6y': {
      'en': 'Create Outward Material',
      'hi': '',
    },
    'h4wap4i2': {
      'en': 'Sales Order Number :',
      'hi': '',
    },
    'so19jxyv': {
      'en': 'Select ...',
      'hi': '',
    },
    'hlfifsoz': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'exgs1pb6': {
      'en': 'Outward Number',
      'hi': '',
    },
    'lptwp6w8': {
      'en': 'Enter Here..',
      'hi': '',
    },
    'ql40egpb': {
      'en': '',
      'hi': '',
    },
    'wlfrayi1': {
      'en': 'Outwarded On',
      'hi': '',
    },
    'eftjjg13': {
      'en': 'Enter Here..',
      'hi': '',
    },
    '4wc40y2e': {
      'en': '',
      'hi': '',
    },
    'rep0vsy8': {
      'en': 'Outwarded by',
      'hi': '',
    },
    'r2fzypt6': {
      'en': 'Enter Here..',
      'hi': '',
    },
    'xow0imv5': {
      'en': '',
      'hi': '',
    },
    'jxd6xwrb': {
      'en': 'Send Apprroval To',
      'hi': '',
    },
    'ty00fqu6': {
      'en': 'Enter Here..',
      'hi': '',
    },
    'vbale4tk': {
      'en': '',
      'hi': '',
    },
    'tqhrczbs': {
      'en': 'Outward Type :',
      'hi': '',
    },
    '8cpy8zel': {
      'en': 'Purchase',
      'hi': '',
    },
    'rd0rt7x7': {
      'en': 'Production Receipt',
      'hi': '',
    },
    '1hacv5aw': {
      'en': 'Sales Return',
      'hi': '',
    },
    'jmlkapuv': {
      'en': 'Select Outward Type',
      'hi': '',
    },
    'kwmghn9b': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'fg41gg4a': {
      'en': 'Outward Warehouse :',
      'hi': '',
    },
    'ryk6xk9o': {
      'en': 'Mumbai',
      'hi': '',
    },
    'afdfcod0': {
      'en': 'Pune',
      'hi': '',
    },
    'z63zzxfw': {
      'en': 'Banglore',
      'hi': '',
    },
    'yl8eytvn': {
      'en': 'Select Outward Location',
      'hi': '',
    },
    '9v8mk6oe': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'z1aoo5w8': {
      'en': 'Is this received from \'Issued for Subcontract WIP ?',
      'hi': '',
    },
    '92avv1sy': {
      'en': 'Material Handed Over To',
      'hi': '',
    },
    'ra3x3pa8': {
      'en': 'Company Name',
      'hi': '',
    },
    '6pl8ydqq': {
      'en': '',
      'hi': '',
    },
    'jnpw2itb': {
      'en': 'Reference Number',
      'hi': '',
    },
    'xx4f2mez': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'ocgtimse': {
      'en': '',
      'hi': '',
    },
    'hfinxylh': {
      'en': 'Remarks ',
      'hi': '',
    },
    'fe78d2v8': {
      'en': 'Enter Here....',
      'hi': '',
    },
    's3wv6j4w': {
      'en': '',
      'hi': '',
    },
    'z5ov461i': {
      'en': 'Production supplier',
      'hi': '',
    },
    'nl2enimd': {
      'en': 'Customer',
      'hi': '',
    },
    'hwc22jox': {
      'en': 'Issue To',
      'hi': '',
    },
    '3cn5eq4l': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'iqgnojur': {
      'en': 'Customer Name :',
      'hi': '',
    },
    'v55yjwt3': {
      'en': 'Mamta Private Limited',
      'hi': '',
    },
    'f4l9l0ln': {
      'en': 'Elde Infotech Solutions',
      'hi': '',
    },
    'r6097ll6': {
      'en': 'Zeus Learning',
      'hi': '',
    },
    'asrag8i4': {
      'en': 'TCS',
      'hi': '',
    },
    '930kgk1r': {
      'en': 'Infosys',
      'hi': '',
    },
    '4ueo8khq': {
      'en': 'Accenture',
      'hi': '',
    },
    'l7lb3syu': {
      'en': 'Select Customer Name',
      'hi': '',
    },
    '0ro2gf3f': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '18p0bh13': {
      'en': 'Supplier Name :',
      'hi': '',
    },
    'ymh48my4': {
      'en': 'Mamta Private Limited',
      'hi': '',
    },
    'nnszxjqf': {
      'en': 'Elde Infotech Solutions',
      'hi': '',
    },
    'clgsnvtl': {
      'en': 'Zeus Learning',
      'hi': '',
    },
    '2vfyxr8z': {
      'en': 'TCS',
      'hi': '',
    },
    'ia7k6heo': {
      'en': 'Infosys',
      'hi': '',
    },
    'm5d4h6s8': {
      'en': 'Accenture',
      'hi': '',
    },
    'rmcgp2fk': {
      'en': 'Select Supplier Name',
      'hi': '',
    },
    'r7q8kmk7': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'sfkj8mbw': {
      'en': 'Delivered To',
      'hi': '',
    },
    'puohj3ci': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '8yytnop7': {
      'en': '',
      'hi': '',
    },
    'e891q9dw': {
      'en': 'Outward Table :',
      'hi': '',
    },
    '6ssbz7h0': {
      'en': 'Add Item',
      'hi': '',
    },
    '8h3stt3x': {
      'en': 'Card Header',
      'hi': '',
    },
    '1fd72odx': {
      'en': 'Filter',
      'hi': '',
    },
    'a65zgmx7': {
      'en': 'Search users...',
      'hi': '',
    },
    'pht1nn04': {
      'en': 'Item Details',
      'hi': '',
    },
    'uo4xkr1v': {
      'en': 'Item Category',
      'hi': '',
    },
    'dnqlg15p': {
      'en': 'Lot No',
      'hi': '',
    },
    'wqfna9d1': {
      'en': 'UoM',
      'hi': '',
    },
    '7er3pmcs': {
      'en': 'Available Qty',
      'hi': '',
    },
    '5tt5tm1f': {
      'en': 'Qty to be issued (SO qty)',
      'hi': '',
    },
    'vslsvx54': {
      'en': 'Issued Quantity',
      'hi': '',
    },
    'rnnn1i67': {
      'en': 'Remarks',
      'hi': '',
    },
    'f1yh9p2d': {
      'en': 'Lot No',
      'hi': '',
    },
    'wukepl76': {
      'en': '10',
      'hi': '',
    },
    'lqx3y78k': {
      'en': '100',
      'hi': '',
    },
    'uqi4aeas': {
      'en': 'Item Details',
      'hi': '',
    },
    '4hxdgt0y': {
      'en': 'Item Category',
      'hi': '',
    },
    '6tf3f1rt': {
      'en': 'Lot No',
      'hi': '',
    },
    'a63sdu8t': {
      'en': 'UoM',
      'hi': '',
    },
    'jw8z2crq': {
      'en': 'Available Qty',
      'hi': '',
    },
    '8qx7a5vj': {
      'en': 'Qty to be issued (SO qty)',
      'hi': '',
    },
    '8inktkhk': {
      'en': 'Issued Quantity',
      'hi': '',
    },
    'i8axjrr6': {
      'en': 'Remarks',
      'hi': '',
    },
    '76fjpsq5': {
      'en': 'Finish',
      'hi': '',
    },
    'sng0xu14': {
      'en': 'Edge',
      'hi': '',
    },
    's4qj2hmi': {
      'en': 'No Of Pcs',
      'hi': '',
    },
    'ztlr4cay': {
      'en': 'HR Coil No',
      'hi': '',
    },
    'bqcm6t82': {
      'en': 'Grade',
      'hi': '',
    },
    's5y9qtlf': {
      'en': 'SS002',
      'hi': '',
    },
    'murhmuna': {
      'en': '0.8X1250.0X2500.0',
      'hi': '',
    },
    'b45g8i9g': {
      'en': 'Coil',
      'hi': '',
    },
    'd2sn0zhf': {
      'en': 'KSE230190',
      'hi': '',
    },
    'r0896jk1': {
      'en': 'mt',
      'hi': '',
    },
    'bqurfcm1': {
      'en': '100',
      'hi': '',
    },
    'e88z3r37': {
      'en': '100',
      'hi': '',
    },
    'bcepy70q': {
      'en': '100',
      'hi': '',
    },
    'pmc0xpbf': {
      'en': ' ',
      'hi': '',
    },
    'mkbzyo4o': {
      'en': '2B',
      'hi': '',
    },
    'zixba2g8': {
      'en': 'Mill Edge',
      'hi': '',
    },
    '3v2p654j': {
      'en': '146 EA',
      'hi': '',
    },
    'zz1g6ecc': {
      'en': '0000989928',
      'hi': '',
    },
    '48ng4tmk': {
      'en': 'JT',
      'hi': '',
    },
    'rh0jglur': {
      'en': 'Send For Approval',
      'hi': '',
    },
    'm8wm96vo': {
      'en': 'Field is required',
      'hi': '',
    },
    'm79oamff': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '9enet4t7': {
      'en': 'Field is required',
      'hi': '',
    },
    'mnocvoy2': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'eypmef7h': {
      'en': 'Field is required',
      'hi': '',
    },
    'avsalrkw': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'flcb7p3l': {
      'en': 'Field is required',
      'hi': '',
    },
    'iv3og1na': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'y0cvw0ak': {
      'en': 'Field is required',
      'hi': '',
    },
    'jdwdqk2n': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'wqsel9nn': {
      'en': 'Field is required',
      'hi': '',
    },
    '94z6xcnz': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'wj1abdlx': {
      'en': 'Field is required',
      'hi': '',
    },
    'xhkudn32': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '34s1i4r4': {
      'en': 'Field is required',
      'hi': '',
    },
    'u7qcupf0': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'hlo5av08': {
      'en': 'Outward Material',
      'hi': 'जावक सामग्री',
    },
    'aejfej5z': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // HistoryCardOutward
  {
    '20fnr74w': {
      'en': 'Search any contact...',
      'hi': 'कोई भी संपर्क खोजें...',
    },
    '7nbsuvmq': {
      'en': 'History Card',
      'hi': 'इतिहास कार्ड',
    },
    '27a8kth4': {
      'en': 'Step Name',
      'hi': 'चरण का नाम',
    },
    'b5kivea9': {
      'en': 'Submitted By',
      'hi': 'द्वारा प्रस्तुत',
    },
    'vxii4a8b': {
      'en': 'Submitted On',
      'hi': 'पर प्रस्तुत की',
    },
    'rjc6kf3i': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'c69iuas7': {
      'en': 'Start',
      'hi': 'शुरू',
    },
    'ru32727y': {
      'en': 'Rajesh  Nair',
      'hi': 'राजेश नायर',
    },
    'i4351xcm': {
      'en': '27 Jan 2024',
      'hi': '27 जनवरी 2024',
    },
    'mxd0ndj3': {
      'en': 'Please Enter Correct Quantity',
      'hi': 'कृपया सही मात्रा दर्ज करें',
    },
    'c78ukmnk': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    'eqj79a7i': {
      'en': 'Yogesh Rane',
      'hi': 'योगेश राणे',
    },
    'slgfja08': {
      'en': '29 Jan 2024',
      'hi': '29 जनवरी 2024',
    },
    'up38tmao': {
      'en': ' Enter Correct Details',
      'hi': 'सही विवरण दर्ज करें',
    },
    'hb9kpz43': {
      'en': 'Start',
      'hi': 'शुरू',
    },
    'jwipvnzv': {
      'en': 'Rajesh  Nair',
      'hi': 'राजेश नायर',
    },
    'qxt8z11t': {
      'en': '30 Jan 2024',
      'hi': '30 जनवरी 2024',
    },
    '697t9292': {
      'en': 'Enter Correct Quantity',
      'hi': 'सही मात्रा दर्ज करें',
    },
    '4gl06xyg': {
      'en': 'History Card',
      'hi': 'इतिहास कार्ड',
    },
  },
  // ViewOutward
  {
    'tul7x2wn': {
      'en': 'View Outward Material',
      'hi': 'बाहरी सामग्री देखें',
    },
    'hl2k61b7': {
      'en': 'Workflow History',
      'hi': 'कार्यप्रवाह इतिहास',
    },
    'wipk9nmq': {
      'en': 'Sales Order No :',
      'hi': 'बिक्री आदेश संख्या :',
    },
    '9gde1rho': {
      'en': '3299',
      'hi': '3299',
    },
    '9j2pgod7': {
      'en': 'Outward Number :',
      'hi': 'जावक संख्या :',
    },
    '8kffl7om': {
      'en': '1',
      'hi': '1',
    },
    'ikowswdr': {
      'en': 'Outwarded On : ',
      'hi': 'बाहर की ओर:',
    },
    '8ob3rwi5': {
      'en': '23 Jan',
      'hi': '23 जनवरी',
    },
    'mfsod3t1': {
      'en': 'Outwarded by:',
      'hi': 'द्वारा बाहर किया गया:',
    },
    'cf8y4leu': {
      'en': 'Rajesh Nair',
      'hi': 'राजेश नायर',
    },
    'uoivtl5a': {
      'en': 'Send Approval to :',
      'hi': 'अनुमोदन भेजें:',
    },
    'u5mzn6j4': {
      'en': 'Elde',
      'hi': 'एल्डे',
    },
    '69o08fji': {
      'en': 'Outward Type:',
      'hi': 'जावक प्रकार:',
    },
    'su0egx74': {
      'en': 'Purchase Return',
      'hi': 'खरीद वापसी',
    },
    'j1vsl4p9': {
      'en': 'Outward Warehouse : ',
      'hi': 'जावक गोदाम:',
    },
    'uccdlm5e': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'rwvn6nqy': {
      'en': 'Customer Name :',
      'hi': 'ग्राहक का नाम :',
    },
    'f0dp2zdw': {
      'en': 'Mamta',
      'hi': 'ममता',
    },
    'i0hstop0': {
      'en': 'Supplier Name :',
      'hi': 'आपूर्तिकर्ता का नाम :',
    },
    'mh7ixgdu': {
      'en': 'Vinod',
      'hi': 'विनोद',
    },
    'r7u3kk2g': {
      'en': 'Issued for Subcontract WIP:',
      'hi': 'उपठेके के लिए जारी WIP:',
    },
    'nzm4hr76': {
      'en': ' Yes',
      'hi': 'तु',
    },
    'vsuxyhoo': {
      'en': 'Material Handed Over to: ',
      'hi': 'सामग्री इन्हें सौंपी गई:',
    },
    '0496lscw': {
      'en': 'Elde',
      'hi': 'एल्डे',
    },
    '8qk9a9lu': {
      'en': 'Delivered To :',
      'hi': 'बितरण किया :',
    },
    '8xfpwyam': {
      'en': 'Nishant',
      'hi': 'निशांत',
    },
    '6pio78nv': {
      'en': 'Issued To :',
      'hi': 'के लिए जारी किए :',
    },
    '4eknpzw6': {
      'en': ' Mamta',
      'hi': 'ममता',
    },
    'gblctbpb': {
      'en': 'Outward Table :',
      'hi': 'जावक तालिका:',
    },
    '8g653wk5': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    'y2duocud': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'yogyc0vz': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'gbbpx423': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'uj5djliz': {
      'en': 'Available Qty',
      'hi': 'उपलब्ध मात्रा',
    },
    'jn0yr75m': {
      'en': 'Qty to be issued (SO qty)',
      'hi': 'जारी की जाने वाली मात्रा (SO मात्रा)',
    },
    'qr2au621': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    '6wtux2qq': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    '12ukg2yn': {
      'en': 'Finish',
      'hi': 'खत्म करना',
    },
    '5i2x2pon': {
      'en': 'Edge',
      'hi': 'किनारा',
    },
    'o26agj0s': {
      'en': 'No Of Pcs',
      'hi': 'पीसी की संख्या',
    },
    'a62rhgj6': {
      'en': 'HR Coil No',
      'hi': 'एचआर कॉइल नं',
    },
    '7ttsb630': {
      'en': 'Grade',
      'hi': 'श्रेणी',
    },
    'zfmfhs3a': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    'p8a9fvs8': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    'd8zf218b': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    '9z8050sb': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    'gtwok3sv': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'x09mflqt': {
      'en': '100',
      'hi': '100',
    },
    '92zg9tj6': {
      'en': '100',
      'hi': '100',
    },
    '1uhmcfsf': {
      'en': '100',
      'hi': '100',
    },
    'h6i9zbjl': {
      'en': ' ',
      'hi': '',
    },
    'phqxbw8t': {
      'en': '2B',
      'hi': '2 बी',
    },
    'oob3eudo': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'gobxobn2': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    '7pr11o9t': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'bv6xbh2b': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'c2kxsrwe': {
      'en': 'SS003',
      'hi': 'एसएस003',
    },
    'z637zjgg': {
      'en': '3.00X1500.0',
      'hi': '3.00X1500.0',
    },
    'zpwr0y32': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'zfcfgy3j': {
      'en': 'MHR3210OPR',
      'hi': 'एमएचआर3210ओपीआर',
    },
    'i210l5oh': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'nstynoko': {
      'en': '212',
      'hi': '212',
    },
    '53q4e3w9': {
      'en': '75',
      'hi': '75',
    },
    'cvpgpk3e': {
      'en': '45',
      'hi': '45',
    },
    'fqm12rue': {
      'en': ' ',
      'hi': '',
    },
    'bsrxat6t': {
      'en': ' ',
      'hi': '',
    },
    'v0pctk4g': {
      'en': ' ',
      'hi': '',
    },
    '30vtftya': {
      'en': '216 ua',
      'hi': '216 यूए',
    },
    '6obdqrdu': {
      'en': '0000543798',
      'hi': '0000543798',
    },
    'd94276gt': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'pm3to5zm': {
      'en': 'SS004',
      'hi': 'एसएस004',
    },
    '4b03578a': {
      'en': '4.00X1500.0',
      'hi': '4.00X1500.0',
    },
    'zcma6in5': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'muwkm78z': {
      'en': 'TDE6979JGN',
      'hi': 'टीडीई6979जेजीएन',
    },
    'lebpiiz4': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'osfr92sq': {
      'en': '478',
      'hi': '478',
    },
    'j6fkiw0u': {
      'en': '319',
      'hi': '319',
    },
    'b9crcs82': {
      'en': '63',
      'hi': '63',
    },
    'crdfurjz': {
      'en': ' ',
      'hi': '',
    },
    'xj5tv4il': {
      'en': ' ',
      'hi': '',
    },
    'zabp1z6a': {
      'en': ' ',
      'hi': '',
    },
    '2kpszx79': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'ab5nrr00': {
      'en': '0000943564',
      'hi': '0000943564',
    },
    'g74sjfct': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '6m6kh4ox': {
      'en': 'SS001',
      'hi': 'एसएस001',
    },
    'tvv0ewq3': {
      'en': '0.8X1350.0X2500.0',
      'hi': '0.8X1350.0X2500.0',
    },
    '69u8e2q0': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    '21jucaey': {
      'en': 'tre394865iuy',
      'hi': 'tre394865iuy',
    },
    '51d54l04': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'awxdbu94': {
      'en': '100',
      'hi': '100',
    },
    'crh6grsg': {
      'en': '100',
      'hi': '100',
    },
    'lulm7rcr': {
      'en': '90',
      'hi': '90',
    },
    '29sazxz9': {
      'en': ' ',
      'hi': '',
    },
    'drbqnle5': {
      'en': ' ',
      'hi': '',
    },
    'pkohf6kv': {
      'en': 'Mill Edge',
      'hi': 'मिल एज',
    },
    '4nxuog9j': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'wkki3yn7': {
      'en': '0000932664',
      'hi': '0000932664',
    },
    'vmgdvkms': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'yz3mhfwi': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    'hlzynnov': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    'y4mbvrcc': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    '0toqdctj': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    'zo11wwlh': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'ajdpwuuy': {
      'en': '100',
      'hi': '100',
    },
    '3ik7lc68': {
      'en': '100',
      'hi': '100',
    },
    'w54xkxfk': {
      'en': '53',
      'hi': '53',
    },
    'm59lw5v2': {
      'en': '  ',
      'hi': '',
    },
    '7dear9ug': {
      'en': '2B ',
      'hi': '2 बी',
    },
    'env0k08c': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'ky8fu53j': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'y7by7pxf': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'gcqw9bs3': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'nz61d4s6': {
      'en': 'SS005',
      'hi': 'एसएस005',
    },
    'xi3gjca5': {
      'en': '0.8210X1250.0X2500.0',
      'hi': '0.8210X1250.0X2500.0',
    },
    '4bnfkhs0': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'b1j8q1pd': {
      'en': '6543REXDU',
      'hi': '6543रेक्सडु',
    },
    'rvcsyp1e': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'lnxk0h7k': {
      'en': '150',
      'hi': '150',
    },
    'w7sk7ve3': {
      'en': '145',
      'hi': '145',
    },
    'ycjtktj7': {
      'en': '100',
      'hi': '100',
    },
    'ni6bzsgm': {
      'en': ' ',
      'hi': '',
    },
    'r6wf9klz': {
      'en': '2B',
      'hi': '2 बी',
    },
    'idpr7nk9': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'ty7kh4l2': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'otygk558': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'gxem5kep': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'ei0c13hx': {
      'en': 'Quality Report :',
      'hi': 'गुणवत्ता रिपोर्ट:',
    },
    '1bgq75pl': {
      'en': 'Report Conclusion:',
      'hi': 'रिपोर्ट निष्कर्ष:',
    },
    'obtvnoym': {
      'en': 'Approved',
      'hi': '',
    },
    '0rsaplz3': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    '4tug62g2': {
      'en': 'Rejected',
      'hi': 'अस्वीकार कर दिया',
    },
    'ly0v8lwe': {
      'en': 'Send Back',
      'hi': 'वापस भेजे',
    },
    '85qm395r': {
      'en': 'Select Report conclusion...',
      'hi': 'रिपोर्ट निष्कर्ष चुनें...',
    },
    'nsc3aql9': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '1w004oft': {
      'en': 'Approver Remarks ',
      'hi': 'अनुमोदक टिप्पणियाँ',
    },
    'p5924u6p': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'aoskh49m': {
      'en': '',
      'hi': '',
    },
    'd1s089ed': {
      'en': 'View Outward Material',
      'hi': 'बाहरी सामग्री देखें',
    },
    '4yrh2a3v': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // OutwardBack
  {
    'e5od9spk': {
      'en': 'Approval Outward Material',
      'hi': '',
    },
    'abytw7mm': {
      'en': 'Workflow History',
      'hi': '',
    },
    'wcllbxpo': {
      'en': 'Sales Order Number :',
      'hi': '',
    },
    '54zqj08j': {
      'en': 'Select ...',
      'hi': 'चुनना ...',
    },
    'nfu2d30y': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'jvemm2h7': {
      'en': 'Outward Number',
      'hi': '',
    },
    'rkh2xr3f': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    '74t45hfq': {
      'en': '',
      'hi': '',
    },
    'v7gta9oe': {
      'en': 'Outwarded On',
      'hi': '',
    },
    'vkxm27dl': {
      'en': 'Enter Here..',
      'hi': '',
    },
    'm4ducf8z': {
      'en': '',
      'hi': '',
    },
    'see1oc12': {
      'en': 'Outwarded by',
      'hi': '',
    },
    'm9xnrxbg': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'anebk3op': {
      'en': '',
      'hi': '',
    },
    'zl8r5psr': {
      'en': 'Send Apprroval To',
      'hi': '',
    },
    'vm5qes19': {
      'en': 'Enter Here..',
      'hi': '',
    },
    '5rplbuj4': {
      'en': '',
      'hi': '',
    },
    'cs1vgjsv': {
      'en': 'Outward Type :',
      'hi': '',
    },
    'ttkjobn8': {
      'en': 'Purchase',
      'hi': 'खरीदना',
    },
    'r83pb1ud': {
      'en': 'Production Receipt',
      'hi': '',
    },
    'rl6e78b5': {
      'en': 'Sales Return',
      'hi': 'बिक्री वापसी',
    },
    '3v61n5ge': {
      'en': 'Select Outward Type',
      'hi': '',
    },
    '4mav0hpk': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'c4qnrney': {
      'en': 'Outward Warehouse :',
      'hi': '',
    },
    'c6zbozw6': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    'gltatki2': {
      'en': 'Pune',
      'hi': '',
    },
    'wnf5rw3x': {
      'en': 'Banglore',
      'hi': 'बंगलोर',
    },
    'h3x9gsxt': {
      'en': 'Select Outward Location',
      'hi': '',
    },
    'svza9kez': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '5amxesga': {
      'en': 'Is this received from \'Issued for Subcontract WIP ?',
      'hi': '',
    },
    'i3agjbk6': {
      'en': 'Material Handed Over To',
      'hi': '',
    },
    '0lwl4thh': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'vk7mayx2': {
      'en': '',
      'hi': '',
    },
    'qdo9zpmn': {
      'en': 'Reference Number',
      'hi': '',
    },
    't3tiec71': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'utkc0iu2': {
      'en': '',
      'hi': '',
    },
    'u8x1dloc': {
      'en': 'Remarks ',
      'hi': 'उपयोगकर्ता टिप्पणियाँ',
    },
    'ux94uvmu': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '3aekn4kf': {
      'en': '',
      'hi': '',
    },
    'j143m6gm': {
      'en': 'Production supplier',
      'hi': '',
    },
    'f007kwwa': {
      'en': 'Customer',
      'hi': '',
    },
    'lo2gh0e3': {
      'en': 'Issue To',
      'hi': '',
    },
    'hosqdl28': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'xdiurfty': {
      'en': 'Customer Name :',
      'hi': '',
    },
    'qb3w2r36': {
      'en': 'Mamta Private Limited',
      'hi': '',
    },
    'pf4kh3xt': {
      'en': 'Elde Infotech Solutions',
      'hi': '',
    },
    'ii4ka23n': {
      'en': 'Zeus Learning',
      'hi': '',
    },
    '8f52r0oh': {
      'en': 'TCS',
      'hi': '',
    },
    '8q0ipgvz': {
      'en': 'Infosys',
      'hi': '',
    },
    'r8k5gm4h': {
      'en': 'Accenture',
      'hi': '',
    },
    'aocj6atb': {
      'en': 'Select Customer Name',
      'hi': '',
    },
    'u0be83w5': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '25rqd64b': {
      'en': 'Supplier Name :',
      'hi': '',
    },
    'bk505yvu': {
      'en': 'Mamta Private Limited',
      'hi': '',
    },
    'fjwa5hza': {
      'en': 'Elde Infotech Solutions',
      'hi': '',
    },
    'kacn72gj': {
      'en': 'Zeus Learning',
      'hi': '',
    },
    'nbirapt7': {
      'en': 'TCS',
      'hi': '',
    },
    'ie23m913': {
      'en': 'Infosys',
      'hi': '',
    },
    '2g5nz8ms': {
      'en': 'Accenture',
      'hi': '',
    },
    'cx5zvc3e': {
      'en': 'Select Supplier Name',
      'hi': '',
    },
    'cvn2n08n': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'dnfis0x6': {
      'en': 'Delivered To',
      'hi': '',
    },
    'qtafs1jn': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'qzqnmyip': {
      'en': '',
      'hi': '',
    },
    'dnyzhlm0': {
      'en': 'Remarks ',
      'hi': '',
    },
    'rnwlv40o': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '63wybi02': {
      'en': '',
      'hi': '',
    },
    'wqnayxcg': {
      'en': 'Outward Table :',
      'hi': '',
    },
    'pldvpguw': {
      'en': 'Add Item',
      'hi': '',
    },
    'pyc3e4pi': {
      'en': 'Card Header',
      'hi': '',
    },
    'vx93nwts': {
      'en': 'Filter',
      'hi': '',
    },
    'fobgcee5': {
      'en': 'Search users...',
      'hi': '',
    },
    'e3kznj9i': {
      'en': 'Item Details',
      'hi': 'आइटम विवरण',
    },
    '1yfbgmzb': {
      'en': 'Item Category',
      'hi': '',
    },
    'ax4rgyx2': {
      'en': 'Lot No',
      'hi': '',
    },
    'f1oimlo1': {
      'en': 'UoM',
      'hi': '',
    },
    'urk6360o': {
      'en': 'Available Qty',
      'hi': 'उपलब्ध मात्रा',
    },
    'i6myek0o': {
      'en': 'Qty to be issued (SO qty)',
      'hi': 'जारी की जाने वाली मात्रा (SO मात्रा)',
    },
    '0ijqn0pi': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'rn5cxv1h': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'iqq0wfcj': {
      'en': 'Finish',
      'hi': 'खत्म करना',
    },
    'ktzgurvb': {
      'en': 'Edge',
      'hi': 'किनारा',
    },
    '05hy1x57': {
      'en': 'No Of Pcs',
      'hi': 'पीसी की संख्या',
    },
    'lrnqy1mn': {
      'en': 'HR Coil No',
      'hi': 'एचआर कॉइल नं',
    },
    'np2c0iun': {
      'en': 'Grade',
      'hi': 'श्रेणी',
    },
    'uqh4zc3f': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    '396k0flb': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    'ayebbw0s': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'ge3fkopj': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    'okaxkam8': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'v7gn6huh': {
      'en': '100',
      'hi': '100',
    },
    '4llptd5h': {
      'en': '100',
      'hi': '100',
    },
    'uzx4jizc': {
      'en': '100',
      'hi': '100',
    },
    'vc2abi7j': {
      'en': ' ',
      'hi': '',
    },
    'yj5obwj3': {
      'en': '2B',
      'hi': '2 बी',
    },
    's6uxrb51': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    '8tepkgwx': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'neyg3odx': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    '632583h6': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'nsivwgmi': {
      'en': 'SS003',
      'hi': 'एसएस003',
    },
    'l6bpylvt': {
      'en': '3.00X1500.0',
      'hi': '3.00X1500.0',
    },
    'j7vsgr4h': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'hrv5cl9c': {
      'en': 'MHR3210OPR',
      'hi': 'एमएचआर3210ओपीआर',
    },
    'whselam6': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'b5mz7sti': {
      'en': '212',
      'hi': '212',
    },
    'mn532cys': {
      'en': '75',
      'hi': '75',
    },
    'm75nkn45': {
      'en': '45',
      'hi': '45',
    },
    'qpk2jtzb': {
      'en': ' ',
      'hi': '',
    },
    '0yfgpssb': {
      'en': ' ',
      'hi': '',
    },
    'ogimcipo': {
      'en': ' ',
      'hi': '',
    },
    'nb4pl4hr': {
      'en': '216 ua',
      'hi': '216 यूए',
    },
    'zyhf5bmz': {
      'en': '0000543798',
      'hi': '0000543798',
    },
    'd6sqjj5q': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'mx9hv88p': {
      'en': 'SS004',
      'hi': 'एसएस004',
    },
    '5xypm9gw': {
      'en': '4.00X1500.0',
      'hi': '4.00X1500.0',
    },
    'timm0zkh': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'qgepondg': {
      'en': 'TDE6979JGN',
      'hi': 'TDE6979JGN',
    },
    '3mcj5y2b': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'wv3c5xva': {
      'en': '478',
      'hi': '478',
    },
    'tj9cv86a': {
      'en': '319',
      'hi': '319',
    },
    'we4ys646': {
      'en': '63',
      'hi': '63',
    },
    'c1v1565n': {
      'en': ' ',
      'hi': '',
    },
    'bgjzk256': {
      'en': ' ',
      'hi': '',
    },
    'y91yx2qg': {
      'en': ' ',
      'hi': '',
    },
    '75rkgzcj': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'cgzmb8qr': {
      'en': '0000943564',
      'hi': '0000943564',
    },
    'j20n27sx': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'kij7o36k': {
      'en': 'SS001',
      'hi': 'एसएस001',
    },
    'kc7dt8c9': {
      'en': '0.8X1350.0X2500.0',
      'hi': '0.8X1350.0X2500.0',
    },
    '0fvkmh44': {
      'en': 'Roll',
      'hi': 'रोल',
    },
    'z5dbzoet': {
      'en': 'tre394865iuy',
      'hi': 'tre394865iuy',
    },
    'sh9yyhdc': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'czni4duv': {
      'en': '100',
      'hi': '100',
    },
    '2hzp6yj6': {
      'en': '100',
      'hi': '100',
    },
    '1bvkisu1': {
      'en': '90',
      'hi': '90',
    },
    'ipb66bp0': {
      'en': ' ',
      'hi': '',
    },
    'rc3buua6': {
      'en': ' ',
      'hi': '',
    },
    '6cm1jnfz': {
      'en': 'Mill Edge',
      'hi': 'मिल एज',
    },
    'bfydlyn0': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'ylmo2k19': {
      'en': '0000932664',
      'hi': '0000932664',
    },
    '17y804ky': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'g6ax6asu': {
      'en': 'SS002',
      'hi': 'एसएस002',
    },
    '4boz3vlq': {
      'en': '0.8X1250.0X2500.0',
      'hi': '0.8X1250.0X2500.0',
    },
    '0144hdpk': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'viaunkur': {
      'en': 'KSE230190',
      'hi': 'केएसई230190',
    },
    '9k5lg2a6': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    'li66rjoy': {
      'en': '100',
      'hi': '100',
    },
    '5ig1hjla': {
      'en': '100',
      'hi': '100',
    },
    '5pw8gvam': {
      'en': '53',
      'hi': '53',
    },
    'huz5sepg': {
      'en': '  ',
      'hi': '',
    },
    '191mckrr': {
      'en': '2B ',
      'hi': '2 बी',
    },
    'g0umiowb': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'e5h28soc': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'wyflpw6r': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'h0dz8er9': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    'yxk7fjjg': {
      'en': 'SS005',
      'hi': 'एसएस005',
    },
    '85qzzbnh': {
      'en': '0.8210X1250.0X2500.0',
      'hi': '0.8210X1250.0X2500.0',
    },
    'e7zs01zk': {
      'en': 'Coil',
      'hi': 'कुंडल',
    },
    'wlnodumb': {
      'en': '6543REXDU',
      'hi': '6543रेक्सडु',
    },
    't42m2di3': {
      'en': 'mt',
      'hi': 'मीट्रिक टन',
    },
    '66i0bvj1': {
      'en': '150',
      'hi': '150',
    },
    'qfk5sorr': {
      'en': '145',
      'hi': '145',
    },
    'w5tlsq3i': {
      'en': '100',
      'hi': '100',
    },
    'i41cz7bh': {
      'en': ' ',
      'hi': '',
    },
    '1nzevkbh': {
      'en': '2B',
      'hi': '2 बी',
    },
    'xfadyxv5': {
      'en': 'Mill Edge',
      'hi': 'चक्की का किनारा',
    },
    'b22qarj1': {
      'en': '146 EA',
      'hi': '146 ईए',
    },
    'fcyppb8p': {
      'en': '0000989928',
      'hi': '0000989928',
    },
    'ns7z0g51': {
      'en': 'JT',
      'hi': 'संयुक्त',
    },
    '4agnmxq7': {
      'en': 'QR scanner :',
      'hi': 'क्यूआर स्कैनर:',
    },
    '7lvzyhxi': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '2mtgamvr': {
      'en': 'Quality Report :',
      'hi': 'गुणवत्ता रिपोर्ट:',
    },
    'pprsvea8': {
      'en': 'Report Conclusion:',
      'hi': 'रिपोर्ट निष्कर्ष:',
    },
    '2lxub17g': {
      'en': 'Approved',
      'hi': 'अनुमत',
    },
    '8yq55jh3': {
      'en': 'Approved',
      'hi': '',
    },
    'ai8jr0hb': {
      'en': 'Rejected',
      'hi': 'अस्वीकार कर दिया',
    },
    '1dac579m': {
      'en': 'Send Back',
      'hi': '',
    },
    '7jnpac4x': {
      'en': 'Select Report conclusion...',
      'hi': 'रिपोर्ट निष्कर्ष चुनें...',
    },
    'pg6w7r4e': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'aytfvfcx': {
      'en': 'Approver Remarks ',
      'hi': '',
    },
    '5247t1m1': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '4qcebh3e': {
      'en': '',
      'hi': '',
    },
    'l3nqch38': {
      'en': 'Submit',
      'hi': '',
    },
    'e7fm8ztm': {
      'en': 'Approval Outward Material',
      'hi': 'बाहरी सामग्री देखें',
    },
    'n4uy7iv4': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // HistorCardLeads
  {
    'i04qd8vg': {
      'en': 'Search any contact...',
      'hi': 'कोई भी संपर्क खोजें...',
    },
    'mfxf3d5k': {
      'en': 'History Card',
      'hi': 'इतिहास कार्ड',
    },
    'xl4ci6jb': {
      'en': 'Date',
      'hi': '',
    },
    'meain7ys': {
      'en': 'Asignee',
      'hi': '',
    },
    '9gez8xqw': {
      'en': 'Lead Status',
      'hi': '',
    },
    'q4j6dwxx': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'pdrh7gcf': {
      'en': '27 Jan 2024',
      'hi': '',
    },
    'tmfuyrip': {
      'en': 'Rajesh  Nair',
      'hi': '',
    },
    'x6cp6ij0': {
      'en': 'Start',
      'hi': '',
    },
    'e425ue1e': {
      'en': 'Please Enter Correct Quantity',
      'hi': '',
    },
    'tylziswx': {
      'en': 'Send Back',
      'hi': '',
    },
    'dspcdci7': {
      'en': 'Yogesh Rane',
      'hi': '',
    },
    'jsg4yo7x': {
      'en': '29 Jan 2024',
      'hi': '',
    },
    'phlheyld': {
      'en': ' Enter Correct Details',
      'hi': '',
    },
    'viluc3sd': {
      'en': 'Start',
      'hi': '',
    },
    'ugp1rfcf': {
      'en': 'Rajesh  Nair',
      'hi': '',
    },
    '76ersaov': {
      'en': '30 Jan 2024',
      'hi': '',
    },
    'z0xm561y': {
      'en': 'Enter Correct Quantity',
      'hi': '',
    },
    '8hyxqeik': {
      'en': 'History Card',
      'hi': 'इतिहास कार्ड',
    },
  },
  // AddTagComponentContacts
  {
    'ktj41w9r': {
      'en': 'Tags :',
      'hi': 'टैग :',
    },
    'rkqfbk87': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'nya8dfkn': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
  },
  // tAGS
  {
    'yf355qsh': {
      'en': 'Architect',
      'hi': 'वास्तुकार',
    },
  },
  // CreateContactComponent
  {
    'eddeaoxf': {
      'en': 'Create Contact :',
      'hi': 'संपर्क बनाएं :',
    },
    '4iofidmy': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    't4e1jx08': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'lay0nb6d': {
      'en': '',
      'hi': '',
    },
    'lubkf737': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'eyugausi': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'vspv6chu': {
      'en': '',
      'hi': '',
    },
    'hvlgwov1': {
      'en': 'Created By',
      'hi': '',
    },
    'qhtpqqpg': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'ok478nag': {
      'en': '',
      'hi': '',
    },
    'z3lr2j23': {
      'en': 'Created On',
      'hi': '',
    },
    '1g876vwq': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'vyd91deh': {
      'en': '',
      'hi': '',
    },
    'q2hqw7y9': {
      'en': 'First Name',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'ed909sop': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '0pv6zdg5': {
      'en': '',
      'hi': '',
    },
    'vffa5aec': {
      'en': 'Last Name',
      'hi': 'सेकेंडरी मोबाइल नंबर',
    },
    '9k4k1ef6': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'npie27ig': {
      'en': '',
      'hi': '',
    },
    'wwxhjpcw': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'bplqyhie': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '7me0pbhy': {
      'en': '',
      'hi': '',
    },
    'c9c4npdn': {
      'en': 'Secondary Mobile No.',
      'hi': '',
    },
    '80gie34b': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wboezhyd': {
      'en': '',
      'hi': '',
    },
    '5zr6q061': {
      'en': 'General Follow Up Frequency :',
      'hi': '',
    },
    'zcvtvzyt': {
      'en': 'Monthly',
      'hi': '',
    },
    'jxvdgfkr': {
      'en': 'Quaterly',
      'hi': '',
    },
    'qi2w11fn': {
      'en': 'Half Yearly',
      'hi': '',
    },
    'oxpvqy2d': {
      'en': 'Yearly',
      'hi': '',
    },
    'kgf2zich': {
      'en': 'Half Yearly',
      'hi': '',
    },
    '5mhy2ftg': {
      'en': 'Profile Category :',
      'hi': '',
    },
    '7q1h80pl': {
      'en': 'B2B',
      'hi': '',
    },
    'roexzkga': {
      'en': 'B2B',
      'hi': '',
    },
    '01yedp8k': {
      'en': 'B2C',
      'hi': '',
    },
    'rf9nmawv': {
      'en': 'Networking',
      'hi': '',
    },
    'jrnw7ug6': {
      'en': 'Supplier',
      'hi': '',
    },
    '3py20yg3': {
      'en': 'Family & Friends',
      'hi': '',
    },
    'u923kt11': {
      'en': 'Select Category...',
      'hi': '',
    },
    'i756dgwn': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '74scryoj': {
      'en': 'Country:',
      'hi': 'देश:',
    },
    '915yvawa': {
      'en': 'India',
      'hi': 'भारत',
    },
    '454ujdoc': {
      'en': 'India',
      'hi': 'भारत',
    },
    'mfuc8erc': {
      'en': 'Australia',
      'hi': 'ऑस्ट्रेलिया',
    },
    '1zpzpe8k': {
      'en': 'USA',
      'hi': 'यूएसए',
    },
    '2572r7k2': {
      'en': 'Select Country',
      'hi': 'कृपया चयन कीजिए...',
    },
    '0goj2lwe': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'ibl33g47': {
      'en': 'State :',
      'hi': '',
    },
    'nrvgkk0a': {
      'en': 'Maharashtra',
      'hi': 'महाराष्ट्र',
    },
    's93hm3pk': {
      'en': 'Maharashtra',
      'hi': 'महाराष्ट्र',
    },
    'xi3iupes': {
      'en': 'Rajasthan',
      'hi': 'राजस्थान Rajasthan',
    },
    'p44xieml': {
      'en': 'Tamil Nadu',
      'hi': 'तमिलनाडु',
    },
    'aprpah95': {
      'en': 'Select State',
      'hi': 'कृपया चयन कीजिए...',
    },
    '15pqpq6a': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '1wdqkg64': {
      'en': 'City :',
      'hi': '',
    },
    '4srz8zyi': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    '733cxxme': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    't53fdfsb': {
      'en': 'Mumbai Suburban',
      'hi': 'मुंबई उपनगर',
    },
    'zik9wsyt': {
      'en': 'Select City',
      'hi': 'कृपया चयन कीजिए...',
    },
    '32pl2ppd': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'fetmyxi2': {
      'en': 'Address',
      'hi': 'पता',
    },
    'y1v4dy0a': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '83lou0iz': {
      'en': '',
      'hi': '',
    },
    '1xdduybv': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    'uqyjmfnc': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'b5mytd18': {
      'en': '',
      'hi': '',
    },
    'xewozrxk': {
      'en': 'Pincode',
      'hi': 'पिन कोड',
    },
    'n95rc1ey': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '77fhv0xm': {
      'en': '',
      'hi': '',
    },
    'ygzt6if0': {
      'en': 'Reference \nFrom:',
      'hi': 'यहां से संदर्भ:',
    },
    'y7dv580a': {
      'en': 'Contact',
      'hi': '',
    },
    'z1xw141p': {
      'en': 'Tags :',
      'hi': 'टैग:',
    },
    '6sp2mh11': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
    },
    '7zy9rd73': {
      'en': 'Select Tag',
      'hi': 'कृपया चयन कीजिए...',
    },
    '3fy2b609': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'g4u0ym67': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '1f26fhob': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
    },
  },
  // sideNav
  {
    'vlqa8236': {
      'en': 'MicroApp',
      'hi': 'माइक्रोएप',
    },
    'mp6z6qcg': {
      'en': 'MicroApp',
      'hi': '',
    },
    'q5bfn9vp': {
      'en': 'Tiny App , Big Impact',
      'hi': 'छोटा ऐप, बड़ा प्रभाव',
    },
    'bvh7c3w9': {
      'en': 'Tiny App , Big Impact',
      'hi': '',
    },
    'phkezs7z': {
      'en': 'Casper Ghost',
      'hi': 'कैस्पर भूत',
    },
    'hfmbrhfh': {
      'en': 'admin@gmail.com',
      'hi': 'admin@gmail.com',
    },
    'hlce9f0h': {
      'en': 'Platform Navigation',
      'hi': 'प्लेटफ़ॉर्म नेविगेशन',
    },
    'unvwsepb': {
      'en': 'Platform Navigation',
      'hi': '',
    },
    'wpcon3pp': {
      'en': 'Home',
      'hi': 'घर',
    },
    'oe4f9hho': {
      'en': 'Home',
      'hi': 'घर',
    },
    '9q758big': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
    '63a33t3w': {
      'en': 'CRM',
      'hi': 'सीआरएम',
    },
    'yc9s4iwe': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'tepkgvc2': {
      'en': 'Inventory',
      'hi': 'भंडार',
    },
    'hxi77z9q': {
      'en': 'Item Master',
      'hi': 'आइटम मास्टर',
    },
    'ncd3f0o3': {
      'en': 'Item Master',
      'hi': 'आइटम मास्टर',
    },
    'd7naur09': {
      'en': 'Admin Panel',
      'hi': 'व्यवस्थापक पैनल',
    },
    '1s8zauat': {
      'en': 'Admin Panel',
      'hi': '',
    },
    'gs78fg48': {
      'en': 'User Management',
      'hi': 'प्रयोक्ता प्रबंधन',
    },
    'f3gn9lmf': {
      'en': 'User Management',
      'hi': 'प्रयोक्ता प्रबंधन',
    },
    '0idyn8k0': {
      'en': 'Dropdown Management',
      'hi': 'ड्रॉपडाउन प्रबंधन',
    },
    '5w6gw3gt': {
      'en': 'Dropdown Management',
      'hi': 'ड्रॉपडाउन प्रबंधन',
    },
    'o0q98nme': {
      'en': 'Settings',
      'hi': 'समायोजन',
    },
    'qp7t7viw': {
      'en': 'Settings',
      'hi': '',
    },
    'sgju7e46': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
    },
    'jlfy3map': {
      'en': 'LogOut',
      'hi': 'लॉग आउट',
    },
    'wj6zus4f': {
      'en': 'Light Mode',
      'hi': 'लाइट मोड',
    },
    'i2bswfwf': {
      'en': 'Dark Mode',
      'hi': 'डार्क मोड',
    },
    'f8yioj1a': {
      'en': 'Company Management',
      'hi': 'कंपनी प्रबंधन',
    },
    '9srz2a6r': {
      'en': 'Company Management',
      'hi': 'कंपनी प्रबंधन',
    },
  },
  // ProfileComponent
  {
    '92r4q5sk': {
      'en': 'Profile Details',
      'hi': 'प्रोफ़ाइल विवरण',
    },
    'l7avya3m': {
      'en': 'Below are your profile details',
      'hi': 'नीचे आपकी प्रोफ़ाइल विवरण हैं',
    },
    'hm7rae44': {
      'en': 'Manage your account',
      'hi': 'अपना खाता प्रबंधित करें',
    },
    '7vwb31wu': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    'jplmh9o4': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
    },
    'i2exeid9': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
    },
    '5judmx0h': {
      'en': 'Language Selector',
      'hi': 'भाषा चयनकर्ता',
    },
    '2y8pllxh': {
      'en': 'Light Mode',
      'hi': 'लाइट मोड',
    },
    '11wxza8z': {
      'en': 'Dark Mode',
      'hi': 'डार्क मोड',
    },
    'frjfhprh': {
      'en': 'Close',
      'hi': 'बंद करना',
    },
  },
  // ViewContact
  {
    'u7ewocta': {
      'en': 'View Contact :',
      'hi': 'संपर्क देखें :',
    },
    'o32pl11q': {
      'en': 'Profile Id',
      'hi': '',
    },
    '34zi7v7k': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'ug7aj8s3': {
      'en': '',
      'hi': '',
    },
    'e2s1oy60': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'ubl599fh': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'waf5qt1b': {
      'en': '',
      'hi': '',
    },
    'olvdtd86': {
      'en': 'Created By',
      'hi': '',
    },
    'brxzu42w': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'zlx31881': {
      'en': '',
      'hi': '',
    },
    '69wet63g': {
      'en': 'Created On',
      'hi': '',
    },
    'bbe7nydn': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'j6gaw54f': {
      'en': '',
      'hi': '',
    },
    '4i0xco15': {
      'en': 'First Name',
      'hi': '',
    },
    'sdlh69e4': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '7mfyag40': {
      'en': '',
      'hi': '',
    },
    'lrkbn0ly': {
      'en': 'Last Name',
      'hi': '',
    },
    '85dfpgje': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wy85gr2f': {
      'en': '',
      'hi': '',
    },
    '7od3v1nn': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'ffnmeo1y': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'nsbhedo9': {
      'en': '',
      'hi': '',
    },
    'ellqm8dm': {
      'en': 'Secondary Mobile No.',
      'hi': '',
    },
    '6vqx0f2d': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fs1pcq23': {
      'en': '',
      'hi': '',
    },
    'u9cgtuge': {
      'en': 'General Follow Up Frequency :',
      'hi': '',
    },
    'g66j2wfp': {
      'en': 'Monthly',
      'hi': '',
    },
    'dmhnbhqf': {
      'en': 'Quaterly',
      'hi': '',
    },
    '8yg6su3g': {
      'en': 'Half Yearly',
      'hi': '',
    },
    'msr0mwav': {
      'en': 'Yearly',
      'hi': '',
    },
    'zur1lgwt': {
      'en': 'Half Yearly',
      'hi': '',
    },
    '2cshnx7m': {
      'en': 'Profile Category',
      'hi': '',
    },
    '3f4e5170': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'l85tflm5': {
      'en': '',
      'hi': '',
    },
    'f17qsl15': {
      'en': 'Country',
      'hi': '',
    },
    'lbavzgsa': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '2uqz1wux': {
      'en': '',
      'hi': '',
    },
    'uwchfawm': {
      'en': 'State',
      'hi': '',
    },
    'tv4snxj8': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'nmj3iqnt': {
      'en': '',
      'hi': '',
    },
    '326boiy4': {
      'en': 'City',
      'hi': '',
    },
    '1n2vuqxs': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '4wwstrkx': {
      'en': '',
      'hi': '',
    },
    'llac2esn': {
      'en': 'Address',
      'hi': '',
    },
    'hn3y279u': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '27c96o0h': {
      'en': '',
      'hi': '',
    },
    'izc86967': {
      'en': 'Landmark',
      'hi': '',
    },
    '8vtqga2v': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'rgx5rh2a': {
      'en': '',
      'hi': '',
    },
    'jzlsne58': {
      'en': 'Pincode',
      'hi': '',
    },
    'xqs6i3w0': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fvqdt3z7': {
      'en': '',
      'hi': '',
    },
    'nu9h19im': {
      'en': 'Reference From',
      'hi': '',
    },
    'jpikshjd': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'e1bmr5se': {
      'en': '',
      'hi': '',
    },
    'cxov7nc8': {
      'en': 'Tags :',
      'hi': 'टैग :',
    },
    'f01ryvkk': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    's8y8yo3m': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
  },
  // EditContact
  {
    'ara1qbu3': {
      'en': 'Edit Contact :',
      'hi': 'संपादित संपर्क :',
    },
    '5jy0mpbi': {
      'en': 'Profile Id',
      'hi': '',
    },
    'bg13tdqa': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    '6a1maqhh': {
      'en': '',
      'hi': '',
    },
    'he4pqjjo': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    '4qxyg0dy': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'w56ye14b': {
      'en': '',
      'hi': '',
    },
    'oxfm1gwc': {
      'en': 'Created By',
      'hi': '',
    },
    'dgmee555': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'h9knn01u': {
      'en': '',
      'hi': '',
    },
    'n9hc4gwj': {
      'en': 'Created On',
      'hi': '',
    },
    's8lj7loe': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'f4g60t1w': {
      'en': '',
      'hi': '',
    },
    'zjfxva45': {
      'en': 'First Name',
      'hi': '',
    },
    '2xrkcbla': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wundqtx9': {
      'en': '',
      'hi': '',
    },
    'rhluftr6': {
      'en': 'Last Name',
      'hi': '',
    },
    'lapawf6i': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'zfv2fjb4': {
      'en': '',
      'hi': '',
    },
    'boo0uk6v': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    '2g7ds9sm': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '5g40vx5l': {
      'en': '',
      'hi': '',
    },
    'p27wlcad': {
      'en': 'Secondary Mobile No.',
      'hi': '',
    },
    '9vxowtkc': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wzwgnh2s': {
      'en': '',
      'hi': '',
    },
    'de4jp49w': {
      'en': 'General Follow Up Frequency :',
      'hi': '',
    },
    '239iquaj': {
      'en': 'Monthly',
      'hi': '',
    },
    'gzkjqrup': {
      'en': 'Quaterly',
      'hi': '',
    },
    'tmowc6sd': {
      'en': 'Half Yearly',
      'hi': '',
    },
    'f3be9ucb': {
      'en': 'Yearly',
      'hi': '',
    },
    'rs14uwpn': {
      'en': 'Half Yearly',
      'hi': '',
    },
    'frf0t8ca': {
      'en': 'Profile Category :',
      'hi': '',
    },
    'ggtf9mn5': {
      'en': 'B2B',
      'hi': '',
    },
    'c0pdcprj': {
      'en': 'B2B',
      'hi': '',
    },
    'e0auw23e': {
      'en': 'B2C',
      'hi': '',
    },
    'l9mt8hpc': {
      'en': 'Networking',
      'hi': '',
    },
    'sqcqq31k': {
      'en': 'Supplier',
      'hi': '',
    },
    '4ph90pji': {
      'en': 'Family & Friends',
      'hi': '',
    },
    'w2bz3puf': {
      'en': 'Select Category...',
      'hi': '',
    },
    '9it770tp': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'jy9wloub': {
      'en': 'Country:',
      'hi': '',
    },
    'ufemzdxx': {
      'en': 'India',
      'hi': '',
    },
    'f4dojnzg': {
      'en': 'India',
      'hi': '',
    },
    'n947kqmn': {
      'en': 'Australia',
      'hi': '',
    },
    '9ado4kop': {
      'en': 'USA',
      'hi': '',
    },
    'plcsv049': {
      'en': 'Select Country',
      'hi': '',
    },
    'z2doauqn': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'twdro7b9': {
      'en': 'State :',
      'hi': '',
    },
    '48qtow84': {
      'en': 'Maharashtra',
      'hi': '',
    },
    'cz66letb': {
      'en': 'Maharashtra',
      'hi': '',
    },
    'nohufeh9': {
      'en': 'Rajasthan',
      'hi': '',
    },
    'aw9yn01y': {
      'en': 'Tamil Nadu',
      'hi': '',
    },
    'f9i9fm39': {
      'en': 'Select State',
      'hi': '',
    },
    'nx4cd17u': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '6n0hvc8l': {
      'en': 'City :',
      'hi': '',
    },
    '5b177248': {
      'en': 'Mumbai',
      'hi': 'मुंबई',
    },
    '3auas0i9': {
      'en': 'Mumbai',
      'hi': '',
    },
    'jrshuihx': {
      'en': 'Mumbai Suburban',
      'hi': '',
    },
    'd7bts6kb': {
      'en': 'Select City',
      'hi': '',
    },
    'srnt8kqw': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'fdqzdvtg': {
      'en': 'Address',
      'hi': '',
    },
    'm8y4uxe6': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '853hn786': {
      'en': '',
      'hi': '',
    },
    'u0l5c331': {
      'en': 'Landmark',
      'hi': '',
    },
    'cfmri25h': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '74aidyl4': {
      'en': '',
      'hi': '',
    },
    'd0w2nzs7': {
      'en': 'Pincode',
      'hi': '',
    },
    'jfqigwor': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'b6hsypdm': {
      'en': '',
      'hi': '',
    },
    'ytth5etc': {
      'en': 'Reference \nfrom:',
      'hi': '',
    },
    'mkbmfsif': {
      'en': 'Contact',
      'hi': '',
    },
    'q02ew76b': {
      'en': 'Tags :',
      'hi': 'टैग :',
    },
    'kmbsf9sc': {
      'en': 'Option 1',
      'hi': '',
    },
    'atifxq0f': {
      'en': 'Select Tag',
      'hi': '',
    },
    '48jsomlj': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '4yjlzsbe': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'ycgr0dv7': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
    },
  },
  // TreeStructure
  {
    '8t5q9izl': {
      'en': 'Tree :',
      'hi': 'पेड़ :',
    },
  },
  // textttag
  {
    'ok0cgbv3': {
      'en': 'Tag Name',
      'hi': 'टैग नाम',
    },
    'lng00s2f': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wu6jh97n': {
      'en': '',
      'hi': '',
    },
  },
  // ContactsAction
  {
    'w8u76vna': {
      'en': 'View',
      'hi': 'देखना',
    },
    'y55hugaf': {
      'en': 'Create Lead',
      'hi': 'लीड बनाएं',
    },
    'fxqa03hs': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
    '0dnb8apb': {
      'en': 'Structure',
      'hi': 'संरचना',
    },
  },
  // AddParameters
  {
    'rcnqim61': {
      'en': 'Parameters :',
      'hi': 'पैरामीटर :',
    },
    'jyxon7dq': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
    },
    'iwqd19wj': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '6ehtmaej': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
  },
  // ParameterName
  {
    '0maikgf1': {
      'en': 'Parameter Name',
      'hi': 'मापदण्ड नाम',
    },
    'hturuzzw': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '581oeiid': {
      'en': '',
      'hi': '',
    },
  },
  // ParameterValue
  {
    'whad11qt': {
      'en': 'Parameter Value',
      'hi': 'पैरामीटर मान',
    },
    'xpnfmycm': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'jt8zy9i2': {
      'en': '',
      'hi': '',
    },
  },
  // LeadsAction
  {
    'bd0yfh6y': {
      'en': 'View',
      'hi': 'देखना',
    },
    'gljf545l': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
  },
  // CreateUser
  {
    '70olrvvn': {
      'en': 'Create User :',
      'hi': 'उपयोगकर्ता बनाइये :',
    },
    'mizdzotw': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'z6skk4pp': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'jr9267g4': {
      'en': '',
      'hi': '',
    },
    'fsxfqsgf': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'q978uxdt': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '69v4ef6u': {
      'en': '',
      'hi': '',
    },
    'lit9k35z': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
    },
    '19x5j0rt': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'xq6bc7ne': {
      'en': '',
      'hi': '',
    },
    'zmll6t3r': {
      'en': 'Company Name :',
      'hi': 'कंपनी का नाम :',
    },
    'fl4kr7k7': {
      'en': '',
      'hi': '',
    },
    'oapu5cus': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'fr6kjok3': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'r4zno0q0': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'zge5suen': {
      'en': 'Create User',
      'hi': 'उपयोगकर्ता बनाइये',
    },
    '32spog2e': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'oswzlsor': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'ng21tpda': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '67ggu5h8': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'hep1w8dt': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'oj1ol1no': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // UserOptionDropdown
  {
    '0cerpnja': {
      'en': 'Admin',
      'hi': 'व्यवस्थापक',
    },
    'y7oeew9u': {
      'en': 'Operate',
      'hi': 'प्रचालन',
    },
    '8kd9xpnh': {
      'en': 'View',
      'hi': 'देखना',
    },
    'o6p9nwie': {
      'en': 'Support',
      'hi': 'सहायता',
    },
    'jkor0xa3': {
      'en': 'NA',
      'hi': 'ना',
    },
    'hmmpb55h': {
      'en': 'Select Role..',
      'hi': 'भूमिका चुनें..',
    },
    '81qkka9o': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
  },
  // FilterForContacts
  {
    'bvh2amjx': {
      'en': 'Filter :',
      'hi': 'फ़िल्टर :',
    },
    '7886ef9e': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    'dtvuxgti': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'b9c38sm8': {
      'en': 'Prrimary Mobile No ',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'msve5wuh': {
      'en': 'Secondary Mobile No ',
      'hi': 'सेकेंडरी मोबाइल नंबर',
    },
    'h3in42dk': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'pybg0x3l': {
      'en': 'Profile Category',
      'hi': 'प्रोफ़ाइल श्रेणी',
    },
    'meypv4dj': {
      'en': 'Follow Up Frequency',
      'hi': 'अनुवर्ती आवृत्ति',
    },
    '8ia41xvz': {
      'en': 'Country/Region',
      'hi': 'देश/क्षेत्र',
    },
    'n0kkcwwn': {
      'en': 'Pincode',
      'hi': 'पिन कोड',
    },
    'l4zzhdy6': {
      'en': 'Address',
      'hi': 'पता',
    },
    'v83g9k7q': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    '2j50tij7': {
      'en': 'Town/ City',
      'hi': 'नगर/नगर',
    },
    '7er1e04n': {
      'en': 'State',
      'hi': 'राज्य',
    },
    'tss4r2nu': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    '5teelsa9': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'g0n1i5y6': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'z072aq7x': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
  },
  // EditUser
  {
    '0qzyiylm': {
      'en': 'Edit User :',
      'hi': 'यूजर को संपादित करो :',
    },
    'dd8hnxvn': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'tb1j1ygy': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '3b4hncov': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    '7fv7k080': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fvnihrce': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
    },
    '7zlcp0i1': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'pgd71iqk': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'a574vzvn': {
      'en': 'Update',
      'hi': 'अद्यतन',
    },
    '5qqxf791': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '2kuvjkfx': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'iuopngv3': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '8lcx05zd': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '98ms5na4': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'gzx3z5yk': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // FilterForLeads
  {
    'afu4130s': {
      'en': 'Filter :',
      'hi': 'फ़िल्टर :',
    },
    'w81wqfy4': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    'hkz1r8di': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    'acyp5jzn': {
      'en': 'Location',
      'hi': 'जगह',
    },
    '4plbxjol': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    '2f5u9txt': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'moc9ucr1': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'tz61wndg': {
      'en': 'Next follow up Date',
      'hi': 'अगली अनुवर्ती तिथि',
    },
    '17qf3s8l': {
      'en': 'Currently assigned to',
      'hi': 'वर्तमान में सौंपा गया है',
    },
    'gwgh2m5i': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'yh7e0ze4': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    'ufkzudbc': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'iektkail': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
  },
  // ViewUser
  {
    '4miqt6yb': {
      'en': 'View User :',
      'hi': 'उपयोगकर्ता देखें:',
    },
    'qjoteg8t': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'qdt68y3p': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '1mq6uw7j': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    '36c64rwe': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'mbtcgeto': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
    },
    'z3tw3siy': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'zff70v6j': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'o7pq8ltx': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'a6jd3550': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'rrtgmgw2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'isby4b1b': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'agohvlmg': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '5n481bcj': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'zehmxhpx': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '0g8ko95e': {
      'en': 'Module Name',
      'hi': 'मोड्यूल का नाम',
    },
    'p49fje8n': {
      'en': 'Role Type',
      'hi': 'भूमिका प्रकार',
    },
    '8ay1x16w': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'g2cp6e67': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
  },
  // ViewCompany
  {
    'ohae33di': {
      'en': 'View Details :',
      'hi': 'विवरण देखें :',
    },
    '9umpasax': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'x7s3q9c6': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'kysbwumz': {
      'en': 'Default Password',
      'hi': 'डिफ़ॉल्ट पासवर्ड',
    },
    'arnvicqx': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'xie99p33': {
      'en': 'Default Password',
      'hi': 'डिफ़ॉल्ट पासवर्ड',
    },
    '0ejzywsv': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '1uktp3yj': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'gmdoieu2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'rtuasgx0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'h24oll6o': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'hgk3kdnw': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'f6fklx8m': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '4zgda67i': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'aigcj45y': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'qv3vlto4': {
      'en': 'Module Name :',
      'hi': 'मोड्यूल का नाम :',
    },
    'jc0k1xs1': {
      'en': 'Title',
      'hi': 'शीर्षक',
    },
    'drgnzahi': {
      'en': 'Title',
      'hi': 'शीर्षक',
    },
    '4rq2dx5y': {
      'en': 'Title',
      'hi': 'शीर्षक',
    },
    'j61km5ee': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'cmdzopch': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
  },
  // CreateCompany
  {
    '37h6ozfx': {
      'en': 'Create Company :',
      'hi': 'कंपनी बनाएं:',
    },
    '423p0w7m': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'zah96obn': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '3f578l4t': {
      'en': '',
      'hi': '',
    },
    'g5qybg8h': {
      'en': 'Default Password',
      'hi': 'डिफ़ॉल्ट पासवर्ड',
    },
    'hg2cvcby': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'msgi8z3v': {
      'en': '',
      'hi': '',
    },
    'sd04ag9x': {
      'en': 'Moving Average',
      'hi': 'औसत चलन',
    },
    'h99hqa4f': {
      'en': 'Lot Wise',
      'hi': 'बहुत बुद्धिमान',
    },
    '3gpmxql8': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '2qi7fk20': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'u1gj4rrr': {
      'en': '',
      'hi': '',
    },
    'mn0r6xps': {
      'en': 'Search....',
      'hi': 'खोज....',
    },
    'pesas5ur': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '5imnql9p': {
      'en': 'Create',
      'hi': 'बनाएं',
    },
    'hvs5ecjx': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'wsw3bgu1': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'h8irghh2': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '9pllhnkx': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'lj36cx6k': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'h1bibdlz': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // EditCompany
  {
    'iw1e6hgn': {
      'en': 'Edit Company :',
      'hi': 'कंपनी संपादित करें:',
    },
    'nhalimp9': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'cgs1br2o': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '08xl8sd3': {
      'en': 'Default Password',
      'hi': 'डिफ़ॉल्ट पासवर्ड',
    },
    'xwtp1k0t': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'gkjwx2e9': {
      'en': 'Moving Average',
      'hi': 'औसत चलन',
    },
    '8uf3szpg': {
      'en': 'Lot Wise',
      'hi': 'बहुत बुद्धिमान',
    },
    'fnlndtnd': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'qd5rc8qz': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    '9kvaenyv': {
      'en': 'Module Name :',
      'hi': 'मोड्यूल का नाम :',
    },
    'bs4a8sts': {
      'en': '',
      'hi': '',
    },
    '1wq3xwes': {
      'en': 'Search....',
      'hi': 'खोज....',
    },
    '8r3o3qc5': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '1dc21boz': {
      'en': 'Update',
      'hi': 'अद्यतन',
    },
    'xzrza44b': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '10zmgtrv': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'e76obsou': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'lmvk561q': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '8eub8rc9': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'e6s7mc4j': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // DeleteOption
  {
    'ctzqjj0f': {
      'en': 'You want to deactivate ?',
      'hi': 'आप निष्क्रिय करना चाहते हैं?',
    },
    'vrzlzv7v': {
      'en': 'No',
      'hi': 'नहीं',
    },
    '8vrgmdgn': {
      'en': 'Yes',
      'hi': 'हाँ',
    },
  },
  // DeleteOptionCopy
  {
    'q46cbtca': {
      'en': 'You want to Activate ?',
      'hi': 'आप सक्रिय करना चाहते हैं?',
    },
    'tcqjssal': {
      'en': 'No',
      'hi': 'नहीं',
    },
    '3a4b190e': {
      'en': 'Yes',
      'hi': 'हाँ',
    },
  },
  // AddParametersCopy
  {
    '63733bjj': {
      'en': 'Add Parameters :',
      'hi': 'पैरामीटर जोड़ें:',
    },
    '8f7bhlow': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'lxtxq74a': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
  },
  // CreateUserCopy
  {
    'am9wz0m7': {
      'en': 'Create User :',
      'hi': 'उपयोगकर्ता बनाइये :',
    },
    'zgz5v7kk': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'luzazzq3': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'swajirvt': {
      'en': '',
      'hi': '',
    },
    '08ki0fie': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    '73ktuu6k': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '64cx10e6': {
      'en': '',
      'hi': '',
    },
    'yx5ziprt': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
    },
    'dleldvv1': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '3ou4exds': {
      'en': '',
      'hi': '',
    },
    'l0im80w8': {
      'en': 'Module Name',
      'hi': 'मोड्यूल का नाम',
    },
    'jfnzfjx8': {
      'en': 'Role Type',
      'hi': 'भूमिका प्रकार',
    },
    'ofkrf39s': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '9ndnf9ru': {
      'en': 'Create User',
      'hi': 'उपयोगकर्ता बनाइये',
    },
    '9xd8ij4m': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ubphko6t': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    's8jtbmj0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'gd0ko1qm': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'g89ynw5d': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'bllx3xh4': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // EditDropdown
  {
    '4js6hqzz': {
      'en': 'Edit Details :',
      'hi': 'विवरण संपादित करें :',
    },
    '3ft1ttff': {
      'en': 'Name',
      'hi': 'नाम',
    },
    '1e7hqnqp': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fduzjnss': {
      'en': '',
      'hi': '',
    },
    'wuckjget': {
      'en': 'Value',
      'hi': 'कीमत',
    },
    '5mgt1zfx': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '2tti4um3': {
      'en': '',
      'hi': '',
    },
    '8wfh2ytt': {
      'en': 'Code (Name - ModuleName- CompanyName)',
      'hi': 'कोड (नाम - मॉड्यूलनाम- कंपनी का नाम)',
    },
    'xxqd2kzu': {
      'en': 'hidden for backend',
      'hi': 'बैकएंड के लिए छिपा हुआ',
    },
    'rzpy8no2': {
      'en': '',
      'hi': '',
    },
    'sx36kunt': {
      'en': 'Company Name :  (hidden for backend)',
      'hi': 'कंपनी का नाम: (बैकएंड के लिए छिपा हुआ)',
    },
    '4czvc4gh': {
      'en': '',
      'hi': '',
    },
    'f0lb4olm': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '8ycevgwj': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'ysu6ddtf': {
      'en': 'Module Name :  (hidden for backend)',
      'hi': 'मॉड्यूल नाम : (बैकएंड के लिए छुपाया गया)',
    },
    'l1m8mzdi': {
      'en': '',
      'hi': '',
    },
    'jt4k7i25': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'o7h8xr5f': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'eyl493yr': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '13qt9du6': {
      'en': 'Delete',
      'hi': 'मिटाना',
    },
    'ghparp0j': {
      'en': 'Edit ',
      'hi': 'संपादन करना',
    },
    '2xtef516': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'dorjonr2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'do4jnvo1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'zz7r4tm1': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'nwfr8mkt': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '8fah1nmz': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // EditDropdownValues
  {
    'urx0jbio': {
      'en': 'Edit Details :',
      'hi': 'विवरण संपादित करें :',
    },
    'fjt9bf1n': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'gd71fgei': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'nsi9465u': {
      'en': '',
      'hi': '',
    },
    'zwsactx9': {
      'en': 'Values :',
      'hi': 'मान :',
    },
    'qhz8k09y': {
      'en': 'Value',
      'hi': 'कीमत',
    },
    'ua2u7lt4': {
      'en': 'Value',
      'hi': 'कीमत',
    },
    '9bvn4qef': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '2w7rizfo': {
      'en': 'Edit ',
      'hi': 'संपादन करना',
    },
    'z4aoq63g': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'kz7zgxyi': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'feicv4gy': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '5ljtwcb4': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'm9b65fqt': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'w3547eco': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // CreateItem
  {
    '6nnbj5nx': {
      'en': 'Create Item :',
      'hi': 'आइटम बनाएं:',
    },
    'j0crjmox': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    '395zhhok': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'xubvz4ca': {
      'en': '',
      'hi': '',
    },
    'tfhsok5k': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    'nempv84f': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '27e8ul83': {
      'en': '',
      'hi': '',
    },
    '4d71q3ei': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'gw2vihxo': {
      'en': 'Enter Here....',
      'hi': '',
    },
    's2g2e30p': {
      'en': '',
      'hi': '',
    },
    'tfzer4ox': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    'q8js3b8y': {
      'en': 'Enter Here...',
      'hi': 'यहाँ से प्रवेश करें...',
    },
    'r7qszgbr': {
      'en': '',
      'hi': '',
    },
    '9wbhrxha': {
      'en': 'MOQ',
      'hi': 'MOQ',
    },
    '7het7f42': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '0bf82ym0': {
      'en': '',
      'hi': '',
    },
    'tymdgm8i': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'l1td4wmg': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'ngtgmh3c': {
      'en': '',
      'hi': '',
    },
    '1cbsuxih': {
      'en': 'Vender Name',
      'hi': 'विक्रेता का नाम',
    },
    'lwxc4eo0': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '0rg9qyam': {
      'en': '',
      'hi': '',
    },
    'wvmm27cf': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'gsbvd7f1': {
      'en': 'Create ',
      'hi': 'बनाएं',
    },
    'n2uc01db': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'tdya15nm': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'nztxmp7f': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'azyyenxe': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '6c2wr5kr': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '6nh6ulck': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '9z802oig': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'jk6l9pna': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'wm0prxcu': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'dile9oj8': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'qrzgniqh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '3t7j2uzd': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'fpnugz6m': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'p7dez8bl': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // EditUserCopy
  {
    '4h02367o': {
      'en': 'Edit User :',
      'hi': 'यूजर को संपादित करो :',
    },
    'pv3zbpzi': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'idwdm5fp': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fvy9jski': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'xc62ciak': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'shfg5gog': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
    },
    'axyxy0by': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '3i4y63p9': {
      'en': 'Module Name',
      'hi': 'मोड्यूल का नाम',
    },
    'a4f4gl6y': {
      'en': 'Role Type',
      'hi': 'भूमिका प्रकार',
    },
    'e8t8beg8': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'veptgxev': {
      'en': 'Update',
      'hi': 'अद्यतन',
    },
    'bbr9kfjs': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '43ihgdzh': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'tpt95p3e': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '9958av06': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'jauxmp0k': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'gf441l58': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // DeleteOptionCopy2
  {
    '5zqnu6xo': {
      'en': 'You want to Deactivate ?',
      'hi': 'आप निष्क्रिय करना चाहते हैं?',
    },
    'pasvr5zz': {
      'en': 'No',
      'hi': 'नहीं',
    },
    'tm1bj2kc': {
      'en': 'Yes',
      'hi': 'हाँ',
    },
  },
  // DeleteOptionCopyCopy
  {
    'ztr91pfd': {
      'en': 'You want to Activate ?',
      'hi': 'आप सक्रिय करना चाहते हैं?',
    },
    '0asybqxb': {
      'en': 'No',
      'hi': 'नहीं',
    },
    'wlcfl5jr': {
      'en': 'Yes',
      'hi': 'हाँ',
    },
  },
  // EditUserCopy2
  {
    'md6w3jh4': {
      'en': 'Edit User :',
      'hi': 'यूजर को संपादित करो :',
    },
    'zwifqgvy': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'p2px8twm': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '6tcw01pq': {
      'en': 'Primary Mobile No.',
      'hi': 'प्राथमिक मोबाइल नंबर',
    },
    'mq1f14kx': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fku50lbs': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
    },
    'gy9cnkus': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'd8widcp7': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'fbaa85kl': {
      'en': 'Update',
      'hi': 'अद्यतन',
    },
    '23pp6vim': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '0y570bgu': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'njghzx7h': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'g47kanl6': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'si5xnstz': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'zzybgibd': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // ViewItem
  {
    '04ouzbn3': {
      'en': 'View Item :',
      'hi': 'आइटम देखें :',
    },
    'bgxrek5w': {
      'en': 'Item Code :',
      'hi': 'आइटम कोड :',
    },
    'gd58rmkk': {
      'en': 'Item Name:',
      'hi': 'आइटम नाम:',
    },
    'dyw51e4u': {
      'en': 'Item Category: :',
      'hi': 'आइटम श्रेणी: :',
    },
    'rsqrj0sy': {
      'en': 'UoM :',
      'hi': 'यूओएम :',
    },
    'sjnn2qby': {
      'en': 'Remarks :',
      'hi': 'टिप्पणी :',
    },
    'nzar8dd3': {
      'en': 'Min Order Quantity :',
      'hi': 'न्यूनतम आर्डर राशि :',
    },
    'i19oknsv': {
      'en': 'Vendor Name :',
      'hi': 'विक्रेता का नाम :',
    },
    'mn8252zc': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'ews5jlol': {
      'en': 'Edit ',
      'hi': 'संपादन करना',
    },
    '3x3o5qc8': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'dh1b1kk7': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'so03mmdq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'piwrugic': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'rh9m2n0x': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'c0w58od1': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // itemparameter
  {
    'dwz9b0e7': {
      'en': 'Enter Here',
      'hi': 'यहाँ से प्रवेश करें',
    },
  },
  // DefineParameterInventory
  {
    '46oiyhq5': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    '0avs6y5j': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    'lpcqq39h': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'yfn3br2y': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    '5hsfflti': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'y7gdyf5h': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'bll3g3dc': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'g43fpnp6': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'efmaut7d': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'u4orx9cc': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // dropdownValues
  {
    'hjhabia4': {
      'en': 'Value',
      'hi': 'कीमत',
    },
  },
  // ItemMasterParameter
  {
    'qnpthlhm': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    '1rka1sr9': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '6k4pqhgz': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    'y4wd1xei': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '5ycziwkd': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'mp6kj5gm': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '84mk58wj': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '8f59siyw': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'fgrwxdkq': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // DefineParameterInventoryCopy
  {
    'h4zx2i2y': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    'ldzow8uq': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    'hgclsymk': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'u36gw5h5': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    'utsnqfbg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '72ccb9e0': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'tdp75fqh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '0rkcqb60': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'w5q29xr5': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    't02pkc73': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // EditItem
  {
    '7k6fy88l': {
      'en': 'Edit Item',
      'hi': 'संपादित आइटम',
    },
    'hvhrkhbh': {
      'en': 'Item Code',
      'hi': 'आइटम कोड',
    },
    '8cp91pp5': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'ez5kz8ta': {
      'en': 'Item Name',
      'hi': 'आइटम नाम',
    },
    'eg4ldre8': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'zcz77hou': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '88mcl6oy': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'x7ouzcwk': {
      'en': 'Item Category',
      'hi': 'आइटम श्रेणी',
    },
    '9pw6t5s8': {
      'en': 'MOQ',
      'hi': 'एमओक्यू',
    },
    'r083x4gi': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'q2ia5jia': {
      'en': 'Vendor Name',
      'hi': 'विक्रेता का नाम',
    },
    'p8yu2pwq': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'snwoznjo': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'vtw21r14': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wqk7vc2h': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'jp1lg0xc': {
      'en': 'Save',
      'hi': 'बचाना',
    },
    '2e1ohod0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    't2m9tlbr': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'sdr0sczp': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'vdslbu77': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'qvgrjgme': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '9wrh9d59': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'splj6zn0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '9wf1isxy': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'g1l3n1bt': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'knrm9v1h': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // DeleteOptionCopy3
  {
    'nco1873a': {
      'en': 'You want to delete ?',
      'hi': 'आप हटाना चाहते हैं?',
    },
    'jlv8ql4n': {
      'en': 'No',
      'hi': 'नहीं',
    },
    'fj78vvi2': {
      'en': 'Yes',
      'hi': 'हाँ',
    },
    'zxq9nafv': {
      'en':
          'The Item is been used in the transaction and so it can\'t be deleted.',
      'hi':
          'आइटम का उपयोग लेन-देन में किया गया है और इसलिए इसे हटाया नहीं जा सकता।',
    },
  },
  // InwardMaterial-InwardType
  {
    'grki7v4a': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    '2ngj5u30': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    'rl8logzk': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'dwqawfxf': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    '9kttv977': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'vepriufp': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'iptj76xq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'm5gcdkrg': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'qormbe34': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'zkfzcnwy': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // AssignUser
  {
    '60zs5b9q': {
      'en': 'Assign User',
      'hi': 'उपयोगकर्ता असाइन करें',
    },
    'wos2nma2': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    't5nnsg8o': {
      'en': 'Assign',
      'hi': 'सौंपना',
    },
    'agldbdu6': {
      'en': 'Search Users',
      'hi': 'उपयोगकर्ता खोजें',
    },
    'j4v345s6': {
      'en': '',
      'hi': '',
    },
  },
  // InwardMaterial-InwardLocation
  {
    '17e739vq': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    '9texy2ec': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    '00fw0ivt': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '4kwcm4an': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    'u55877ky': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'iopxrx3h': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'pbbytyw0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'dqqzjm9e': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'yli77x6c': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'n8c18mls': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // AddItem
  {
    '7t3gpwot': {
      'en': 'Add Item :',
      'hi': 'मद जोड़ें :',
    },
    'l7yd0mgd': {
      'en': 'Item Code :',
      'hi': 'आइटम कोड :',
    },
    '5wyr3u8z': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'vyxo1wiw': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'uvfcmdd5': {
      'en': 'Category:',
      'hi': 'वर्ग:',
    },
    '74qr7ozj': {
      'en': 'Vendor :',
      'hi': 'विक्रेता :',
    },
    'you5e72v': {
      'en': 'UoM :',
      'hi': 'यूओएम :',
    },
    '6tl6jxdk': {
      'en': 'MOQ :',
      'hi': 'MOQ:',
    },
    'aujub0ht': {
      'en': 'Require Qunatity',
      'hi': 'Qunatity की आवश्यकता है',
    },
    '18aaba6x': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'uc3xwqpv': {
      'en': 'Received Qunatity',
      'hi': 'Qunatity प्राप्त हुई',
    },
    'tyzd2w9c': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'a33jlnbp': {
      'en': 'Rate/unit',
      'hi': 'दर/इकाई',
    },
    'rn306zk3': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'fcaqw7e6': {
      'en': 'Lot No',
      'hi': 'बहुत कुछ नहीं',
    },
    'h073nzsd': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'd4u1octd': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'kx6vwv58': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'n3si7g3r': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'ervwhbj0': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    '6rr8e4fu': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'f9o21crt': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'ph4allvh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'lbqpwmpi': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'avx9kgj1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'cuw0x0oc': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'yg06err1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '2es2j3bo': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'g5brljq1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'xlxcyxtz': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // table
  {
    '5jkcgocz': {
      'en': 'Card Header',
      'hi': 'कार्ड हैडर',
    },
    'szijp04q': {
      'en': '12',
      'hi': '12',
    },
    '8t32hp89': {
      'en': 'Filter',
      'hi': 'फ़िल्टर',
    },
    'hzqpib8d': {
      'en': 'Search users...',
      'hi': 'उपयोगकर्ता खोजें...',
    },
    'g5gddw89': {
      'en': 'Customer Information',
      'hi': 'ग्राहक सूचना',
    },
    'ievss9z7': {
      'en': 'Paid On',
      'hi': 'भुगतान करना',
    },
    'aow9ju5m': {
      'en': 'Invoice #',
      'hi': 'चालान #',
    },
    '38hyc78p': {
      'en': 'Amount',
      'hi': 'मात्रा',
    },
    '7am6ataf': {
      'en': 'Status',
      'hi': 'स्थिति',
    },
    'f2k4fweq': {
      'en': 'Randy Peterson',
      'hi': 'रैंडी पीटरसन',
    },
    '0bik5nr2': {
      'en': 'Jan. 30th, 2023',
      'hi': '30 जनवरी, 2023',
    },
    '2mu5teg8': {
      'en': '#4292',
      'hi': '#4292',
    },
    'x3etz8fx': {
      'en': '\$2,100.00',
      'hi': '\$2,100.00',
    },
    'uyjwal84': {
      'en': 'Pending',
      'hi': 'लंबित',
    },
    '2acuo265': {
      'en': 'Pending',
      'hi': 'लंबित',
    },
    'z7hrbjz6': {
      'en': 'Paid',
      'hi': 'चुकाया गया',
    },
    'r8mh1c44': {
      'en': 'Overdue',
      'hi': 'अतिदेय',
    },
    'jiwvsgha': {
      'en': 'Randy Peterson',
      'hi': 'रैंडी पीटरसन',
    },
    '7oaqk01z': {
      'en': 'Jan. 30th, 2023',
      'hi': '30 जनवरी, 2023',
    },
    '9aswti2a': {
      'en': '#4292',
      'hi': '#4292',
    },
    'myeld6wz': {
      'en': '\$2,100.00',
      'hi': '\$2,100.00',
    },
    'c14nwwvt': {
      'en': 'Pending',
      'hi': 'लंबित',
    },
    'wxqubwue': {
      'en': 'Pending',
      'hi': 'लंबित',
    },
    'nic98fc8': {
      'en': 'Paid',
      'hi': 'चुकाया गया',
    },
    '1g1983s6': {
      'en': 'Overdue',
      'hi': 'अतिदेय',
    },
    'uifir1ns': {
      'en': 'Randy Peterson',
      'hi': 'रैंडी पीटरसन',
    },
    '0ugxus9w': {
      'en': 'Jan. 30th, 2023',
      'hi': '30 जनवरी, 2023',
    },
    'tso9wp6z': {
      'en': '#4292',
      'hi': '#4292',
    },
    'ahy7mwzx': {
      'en': '\$2,100.00',
      'hi': '\$2,100.00',
    },
    'sftzkoua': {
      'en': 'Pending',
      'hi': 'लंबित',
    },
    '18h3e620': {
      'en': 'Pending',
      'hi': 'लंबित',
    },
    'n0gh2v7j': {
      'en': 'Paid',
      'hi': 'चुकाया गया',
    },
    'jayv6bmr': {
      'en': 'Overdue',
      'hi': 'अतिदेय',
    },
  },
  // receivedquantity
  {
    '8s0vqsrf': {
      'en': '',
      'hi': '',
    },
    'ak56bs9w': {
      'en': 'Received Quantity',
      'hi': 'प्राप्त मात्रा',
    },
  },
  // AddItemCopy
  {
    'fj9g6fnd': {
      'en': 'Add Item :',
      'hi': 'मद जोड़ें :',
    },
    'x04yesat': {
      'en': 'Item Code:',
      'hi': 'आइटम कोड:',
    },
    '8sg8gxff': {
      'en': 'Item Name:',
      'hi': 'आइटम नाम:',
    },
    'chfd7n9b': {
      'en': 'Category:',
      'hi': 'वर्ग:',
    },
    'uoqll1wr': {
      'en': 'Lot No:',
      'hi': 'बहुत कुछ नहीं:',
    },
    'knlgtv6h': {
      'en': '',
      'hi': '',
    },
    'u5jpffw4': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'uaxi0ux7': {
      'en': 'MOQ :',
      'hi': 'MOQ:',
    },
    'b1x735wl': {
      'en': 'Vendor :',
      'hi': 'विक्रेता :',
    },
    'w40ym23w': {
      'en': 'Require Qunatity',
      'hi': 'Qunatity की आवश्यकता है',
    },
    '9irb6ujj': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '7cgxxaac': {
      'en': 'Received Qunatity',
      'hi': 'प्राप्त मात्रा',
    },
    '1w9323f1': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'mqnht8zr': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'dqy4u31u': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '6x78m4e7': {
      'en': 'Rate/unit',
      'hi': 'दर/इकाई',
    },
    'zaso4kjd': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'extss5dt': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'gonvuih2': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'smaqjrw3': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'luc94lv7': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    'grj1kc7i': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '4g98ppmn': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'e8uuapwm': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ymr15gk2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'a6wv4k68': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'tqgblbty': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'oo871oh4': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'ut413k7a': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'pxc3qrvk': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'c8n9v256': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '6if64bv4': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '08ysmp3q': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // AssignUserCopy
  {
    'wjh5zn8s': {
      'en': 'Assign User',
      'hi': 'उपयोगकर्ता असाइन करें',
    },
    'wbogpk01': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'vm1ld7p4': {
      'en': 'Assign',
      'hi': 'सौंपना',
    },
    'xo31yvti': {
      'en': 'Search Users',
      'hi': 'उपयोगकर्ता खोजें',
    },
    'wq7y6xvl': {
      'en': '',
      'hi': '',
    },
  },
  // AddItemInOutwardLotWise
  {
    'v4nrrnv0': {
      'en': 'Add Item :',
      'hi': 'मद जोड़ें :',
    },
    'oqbvo4t1': {
      'en': 'Item Code :',
      'hi': 'आइटम कोड :',
    },
    '8v9ik254': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'it5ykezy': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    '01w1iesf': {
      'en': 'Category:',
      'hi': 'वर्ग:',
    },
    'caiozefh': {
      'en': 'UoM :',
      'hi': 'यूओएम :',
    },
    'ddagy7k7': {
      'en': 'Vendor :',
      'hi': 'विक्रेता :',
    },
    'bq8ky1yn': {
      'en': 'Available Quantity :',
      'hi': 'उपलब्ध मात्रा :',
    },
    'aavn8kj3': {
      'en': 'Quantity to be issued :',
      'hi': 'जारी की जाने वाली मात्रा :',
    },
    'h2c0t9ga': {
      'en': 'Rate/unit :',
      'hi': 'दर/इकाई :',
    },
    'dam7m02w': {
      'en': 'Lot No :',
      'hi': 'बहुत कुछ नहीं :',
    },
    'roop6gs2': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
    },
    'ym9ls0a6': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '0nh9jd7i': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'se6bbyx8': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'akn7k9h3': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '79qxdflx': {
      'en': '',
      'hi': '',
    },
    'lchhm4bd': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'jseu1hvt': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'onnvviie': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'dj1i49zc': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    '6zy5a7fc': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'jdnidsw5': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '9by6c32d': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'cfhjvwav': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '8ufcpove': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'c40p14cn': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // OutwardMaterial-OutwardType
  {
    'hkas6d8d': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    'l0gpyd4m': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    'xxvvd9l4': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'vzqncix6': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    'ucsg8o01': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'yjig07ls': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'kebzunos': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'jhyyqf96': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '0bzinqia': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '0fcyyh67': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // OutwardMaterial-OutwardWarehouse
  {
    'uip5emne': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    't9tojr1d': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    'y41l16pq': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'mig6yigb': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    'kuqcfu4e': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'tf2stvuy': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    '6nq0yw8w': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'kqqkbis8': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'pf040mwm': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'day7fh5v': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // OutwardMaterial-IssueTo
  {
    'jdi0sz2c': {
      'en': 'Define Parameters :',
      'hi': 'पैरामीटर परिभाषित करें:',
    },
    'ppd3gypa': {
      'en': 'Row',
      'hi': 'पंक्ति',
    },
    '5eax43jd': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '4xb0qmxr': {
      'en': 'Save Parameters',
      'hi': 'पैरामीटर सहेजें',
    },
    'w5retm3v': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'zv4n8dbo': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'ktpykidm': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '2v91cm37': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'ylgeneyy': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'avuhpogf': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // AddItemInOutwardMovingAverage
  {
    'mka2965x': {
      'en': 'Add Item :',
      'hi': 'मद जोड़ें :',
    },
    '8ght78pc': {
      'en': 'Item Code :',
      'hi': 'आइटम कोड :',
    },
    'lv9a6g30': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '2sg6xf98': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'wam336e2': {
      'en': 'Category:',
      'hi': 'वर्ग:',
    },
    'ya2k63vd': {
      'en': 'UoM :',
      'hi': 'यूओएम :',
    },
    '8vmfyh31': {
      'en': 'Vendor :',
      'hi': 'विक्रेता :',
    },
    'qj6i7190': {
      'en': 'Available Quantity :',
      'hi': 'उपलब्ध मात्रा :',
    },
    'gcpqt62w': {
      'en': 'Quantity to be issued:',
      'hi': 'जारी की जाने वाली मात्रा:',
    },
    'lnm5y7xq': {
      'en': 'Rate/unit :',
      'hi': 'दर/इकाई :',
    },
    '35p1kcob': {
      'en': 'Issued Quantity',
      'hi': 'जारी मात्रा',
    },
    'epyv3o50': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'mxz0r16r': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'kmug0176': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'o3dvsl21': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    '4wspoaho': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    '6j9h2npf': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '2smty7i3': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '1o51pgfe': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    '55c4tmhe': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'jmdhu6qz': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'i4s0fxvv': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
  },
  // ScanOutwardLotWise
  {
    'awsk2le2': {
      'en': 'Add Item :',
      'hi': '',
    },
    'ry5cpkem': {
      'en': 'Item Code:',
      'hi': '',
    },
    'uwx62bks': {
      'en': 'Item Name:',
      'hi': 'आइटम नाम:',
    },
    'm9b83epg': {
      'en': 'Category:',
      'hi': '',
    },
    '5gaoyo0v': {
      'en': 'Lot No:',
      'hi': '',
    },
    'vqzbdz3x': {
      'en': '',
      'hi': '',
    },
    'wzb6z4x1': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    '8blj48hm': {
      'en': 'MOQ :',
      'hi': 'MOQ:',
    },
    'zx6423hl': {
      'en': 'Vendor :',
      'hi': '',
    },
    'vpzwotse': {
      'en': 'Received Qunatity',
      'hi': 'प्राप्त मात्रा',
    },
    'r3h6rixl': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'il6mljvk': {
      'en': 'Require Qunatity',
      'hi': 'Qunatity की आवश्यकता है',
    },
    '2vxzsroo': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'lw7e9hxe': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    'nkksvw4e': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '7f7gi7i9': {
      'en': 'Rate/unit',
      'hi': 'दर/इकाई',
    },
    '0yo3o1jn': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'lndtbf74': {
      'en': 'Remarks',
      'hi': '',
    },
    'i78yh68q': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'f95r52oq': {
      'en': 'Cancel',
      'hi': '',
    },
    'yxzf5smr': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    'c4vm437p': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'kvmjdu3t': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'vfyl0gsi': {
      'en': 'Field is required',
      'hi': '',
    },
    '3fktl7am': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'io8taajl': {
      'en': 'Field is required',
      'hi': '',
    },
    'l4v9hdgx': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '0jnijcm0': {
      'en': 'Field is required',
      'hi': '',
    },
    '82oku7in': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'ehgux6hk': {
      'en': 'Field is required',
      'hi': '',
    },
    'badhtmct': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'vkuucd1a': {
      'en': 'Field is required',
      'hi': '',
    },
    '8wnm4cqi': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
  },
  // ScanOutwardMovingAverage
  {
    'zzzkjp7m': {
      'en': 'Add Item :',
      'hi': '',
    },
    'e4ou3j08': {
      'en': 'Item Code:',
      'hi': '',
    },
    'w3jpa8ia': {
      'en': 'Item Name:',
      'hi': '',
    },
    '926ywu6p': {
      'en': 'Category:',
      'hi': '',
    },
    '17ehhby3': {
      'en': 'Lot No:',
      'hi': '',
    },
    'gt4jivg0': {
      'en': '',
      'hi': '',
    },
    'xnxwzbje': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'yujkw199': {
      'en': 'MOQ :',
      'hi': '',
    },
    'gvgli67s': {
      'en': 'Vendor :',
      'hi': '',
    },
    '3txb46dh': {
      'en': 'Received Qunatity',
      'hi': '',
    },
    'e2d7vwrx': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'ldhfj8zw': {
      'en': 'Require Qunatity',
      'hi': '',
    },
    'xbo1w9h0': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '7dmcaz8e': {
      'en': 'UoM',
      'hi': 'यूओएम',
    },
    '3kz64hyp': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'ohxnv85l': {
      'en': 'Rate/unit',
      'hi': '',
    },
    'hvmewn99': {
      'en': 'Enter Here....',
      'hi': '',
    },
    'kr3qd2jl': {
      'en': 'Remarks',
      'hi': '',
    },
    't7et0ajw': {
      'en': 'Enter Here....',
      'hi': '',
    },
    '8b6vefzu': {
      'en': 'Cancel',
      'hi': '',
    },
    '8h8beruh': {
      'en': 'Add',
      'hi': '',
    },
    '5hda86gh': {
      'en': 'Field is required',
      'hi': '',
    },
    'tmo110ws': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'yil3thij': {
      'en': 'Field is required',
      'hi': '',
    },
    'azafmywp': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'lxdn6hob': {
      'en': 'Field is required',
      'hi': '',
    },
    'i1qub947': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'f52ndfzl': {
      'en': 'Field is required',
      'hi': '',
    },
    'b4tiq89h': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'dbvrvwqg': {
      'en': 'Field is required',
      'hi': '',
    },
    'monq88w1': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'hkjrxrxl': {
      'en': 'Field is required',
      'hi': '',
    },
    'dzdh5t3j': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
  },
  // AddTagComponentLeads
  {
    '2f65eg2y': {
      'en': 'Tags :',
      'hi': '',
    },
    'obj888wz': {
      'en': 'Cancel',
      'hi': '',
    },
    '8xq5n1tj': {
      'en': 'Add',
      'hi': '',
    },
  },
  // ImportExportAction
  {
    '9wz94jvc': {
      'en': 'Import',
      'hi': '',
    },
    'dhldx3cv': {
      'en': 'Export',
      'hi': '',
    },
  },
  // ContactReferenceFrom
  {
    'n2hf1tld': {
      'en': '',
      'hi': '',
    },
    'up5lyv4x': {
      'en': 'Search Contact',
      'hi': '',
    },
  },
  // DefineContactTypes
  {
    '0uqapncc': {
      'en': 'Parameters :',
      'hi': '',
    },
    '3oqwps3n': {
      'en': 'Active',
      'hi': '',
    },
    'a340xg1r': {
      'en': 'Mild',
      'hi': '',
    },
    'lwjr7iab': {
      'en': 'Dormant',
      'hi': '',
    },
    '1wzlfgq8': {
      'en': 'Cancel',
      'hi': '',
    },
    'yxl1kalg': {
      'en': 'Add',
      'hi': '',
    },
  },
  // ParameterValueForContact
  {
    'vwa8iodf': {
      'en': '',
      'hi': '',
    },
    '3wyaqj9s': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'wxpguhr5': {
      'en': '',
      'hi': '',
    },
  },
  // VisibilityContacts
  {
    'ls71fpi9': {
      'en': 'Filter :',
      'hi': '',
    },
    'd1yosxpi': {
      'en': 'Profile Id',
      'hi': '',
    },
    '07ld5trb': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    '6mcduzg0': {
      'en': 'Primary Mobile No',
      'hi': '',
    },
    '3jap1wdd': {
      'en': 'Secondary Mobile No',
      'hi': '',
    },
    '3xac89pe': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    '01i4ou1v': {
      'en': 'Profile Category',
      'hi': '',
    },
    'd4fu44k9': {
      'en': 'Follow Up Frequency',
      'hi': '',
    },
    'dktcmay8': {
      'en': 'Country / Region',
      'hi': '',
    },
    'im1i8cwt': {
      'en': 'State',
      'hi': '',
    },
    '2uadht7n': {
      'en': 'City',
      'hi': '',
    },
    'slnjsmxb': {
      'en': 'Address',
      'hi': '',
    },
    'op4tk048': {
      'en': 'Landmark',
      'hi': '',
    },
    't6hxe0wi': {
      'en': 'Pincode',
      'hi': '',
    },
    'l9kduvhj': {
      'en': 'Cancel',
      'hi': '',
    },
    '2xt4y442': {
      'en': 'Apply',
      'hi': '',
    },
  },
  // LeadSource
  {
    'd2nhkqk8': {
      'en': '',
      'hi': '',
    },
    'dcuc5vv4': {
      'en': 'Search Contact',
      'hi': '',
    },
  },
  // remarks
  {
    '5snyt73v': {
      'en': 'Remark',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'g09noo87': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    '3ob8z8l8': {
      'en': 'Enter Here..',
      'hi': 'यहाँ से प्रवेश करें..',
    },
    'rdgzilpg': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
    },
    'ft1qlekb': {
      'en': 'Enter Here....',
      'hi': 'यहाँ से प्रवेश करें....',
    },
    'r3vdzjcd': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
    },
    'j0i98by5': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
    },
    'xo0x0tgk': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'picklzu9': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'xa09vp0n': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
    },
    'i6rx1hts': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'mbtuhkph': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'cr37nv46': {
      'en': 'Mobile No.',
      'hi': 'मोबाइल नहीं है।',
    },
    'rmmpcsnq': {
      'en': 'Country',
      'hi': 'देश',
    },
    'dms9wazg': {
      'en': 'State',
      'hi': 'राज्य',
    },
    's0d89d3a': {
      'en': 'City',
      'hi': 'शहर',
    },
    '3mzvlhsn': {
      'en': 'Company Name',
      'hi': 'कंपनी का नाम',
    },
    'ieopncc3': {
      'en': 'Profile Category',
      'hi': 'प्रोफ़ाइल श्रेणी',
    },
    'g0i1tb8n': {
      'en': 'Profile Id',
      'hi': 'प्रोफ़ाइल आईडी',
    },
    'tm6fultj': {
      'en': 'Landmark',
      'hi': 'सीमाचिह्न',
    },
    'ad1mjudy': {
      'en': 'Frequency',
      'hi': 'आवृत्ति',
    },
    'uw6ltep4': {
      'en': 'Tags',
      'hi': 'टैग',
    },
    '2oe5cy18': {
      'en': 'Tree',
      'hi': 'पेड़',
    },
    '0q1jef7p': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    'ycmqyzkx': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
    },
    'xa1b8xpu': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    'm4cbv7h2': {
      'en': 'Lead Number',
      'hi': 'लीड नंबर',
    },
    '4j3tmvtd': {
      'en': 'Lead Source',
      'hi': 'लीड स्रोत',
    },
    'r7razamh': {
      'en': 'Location',
      'hi': 'जगह',
    },
    'wmlqre95': {
      'en': 'Remarks',
      'hi': 'टिप्पणी',
    },
    'axfkcwyo': {
      'en': 'Lead Status',
      'hi': 'लीड स्थिति',
    },
    'gwn7q2su': {
      'en': 'Next Follow Up Date',
      'hi': 'अगली अनुवर्ती तिथि',
    },
    'eg6iwrqa': {
      'en': 'Currently assigned to',
      'hi': 'वर्तमान में सौंपा गया है',
    },
    '630t3amv': {
      'en': 'Customer Requirement',
      'hi': 'ग्राहक की आवश्यकता',
    },
    '6hg2f058': {
      'en': 'Please select...',
      'hi': 'कृपया चयन कीजिए...',
    },
    '9jjpbomo': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'fwkqy4q0': {
      'en': 'MICROAPP',
      'hi': 'माइक्रोऐप',
    },
    'm31hf793': {
      'en': 'Tiny App , Big Impact',
      'hi': 'छोटा ऐप, बड़ा प्रभाव',
    },
    'padfo8rd': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'uqhhu3qp': {
      'en': 'Add',
      'hi': 'जोड़ना',
    },
    '8bncu5j9': {
      'en': 'Approve',
      'hi': 'मंज़ूरी देना',
    },
    'jwou05dw': {
      'en': 'Purchase Order Number :',
      'hi': 'खरीद क्रम संख्या :',
    },
    'zye05o3c': {
      'en': 'Inward Details',
      'hi': 'आवक विवरण',
    },
    'zdfh0sc3': {
      'en': 'Unit Of Measure',
      'hi': 'माप की इकाई',
    },
    '8vane7tw': {
      'en': '',
      'hi': '',
    },
    '9a4wn1zb': {
      'en': '',
      'hi': '',
    },
    '3pl8c77t': {
      'en': '',
      'hi': '',
    },
    'vo6psv5b': {
      'en': '',
      'hi': '',
    },
    'gx6tardv': {
      'en': '',
      'hi': '',
    },
    '67wt7xo2': {
      'en': '',
      'hi': '',
    },
    'qhg0478d': {
      'en': '',
      'hi': '',
    },
    '11ztek0k': {
      'en': '',
      'hi': '',
    },
    '89b1l911': {
      'en': '',
      'hi': '',
    },
    'dv1wvjr4': {
      'en': '',
      'hi': '',
    },
    '1j6esxat': {
      'en': '',
      'hi': '',
    },
    'g099u49o': {
      'en': '',
      'hi': '',
    },
    'tbc5e8pq': {
      'en': '',
      'hi': '',
    },
    '0le7nnml': {
      'en': '',
      'hi': '',
    },
    'tknp9jcz': {
      'en': '',
      'hi': '',
    },
    'x512yb3k': {
      'en': '',
      'hi': '',
    },
    'fxd6oiw0': {
      'en': '',
      'hi': '',
    },
    'v5vy4r6i': {
      'en': '',
      'hi': '',
    },
    '6n6lkbk0': {
      'en': '',
      'hi': '',
    },
    'w0yqvwyu': {
      'en': '',
      'hi': '',
    },
    '0vjdvg0d': {
      'en': '',
      'hi': '',
    },
    'qhxtk6ds': {
      'en': '',
      'hi': '',
    },
    '1j35a6rb': {
      'en': '',
      'hi': '',
    },
    'rtmt9xtp': {
      'en': '',
      'hi': '',
    },
    '0iffvavd': {
      'en': '',
      'hi': '',
    },
    'j7zlxnn4': {
      'en': '',
      'hi': '',
    },
    'edf1vpr0': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
