// lib/data/dummy_data.dart
import 'models/experience_model.dart';
import 'models/education_model.dart';
import 'models/hobby_model.dart';
import 'models/profile_model.dart';
import '../core/constants.dart';

class DummyData {
  static final ProfileModel profile = ProfileModel(
    name: AppConstants.profileName,
    tagline: AppConstants.profileTagline,
    profileImage: AppConstants.profileImage,
    summary: AppConstants.aboutDescription,
    profession: 'Telephone Technician',
    location: 'Mumbai, India',
    email: 'contact.ankityadav@gmail.com',
  );

  static final List<ExperienceModel> experiences = [
    ExperienceModel(
      title: "Telephone Technician",
      company: "MTNL",
      duration: "Feb 2020 - Present",
      responsibilities: [
        "Install, maintain, and repair electrical control, wiring, and lighting systems.",
        "Read technical diagrams and blueprints.",
        "Perform general electrical maintenance.",
        "Repair and replace equipment, electrical wiring, or fixtures.",
      ],
    ),
  ];

  static final List<EducationModel> educations = [
    EducationModel(
      qualification: "S.S.C",
      institution: "B.L.Ruia High School",
      board: "Maharashtra State Board",
      year: "2013",
    ),
    EducationModel(
      qualification: "H.S.C",
      institution: "Patuck College",
      board: "Maharashtra State Board",
      year: "2015",
    ),
    EducationModel(
      qualification: "Diploma in Electrical Engineering",
      institution: "Pravin Patil College",
      board: "Maharashtra State Board",
      year: "2020",
    ),
  ];

  static final List<HobbyModel> hobbies = [
    HobbyModel(name: "Travelling", iconPath: "assets/images/icons/travel.png"),
    HobbyModel(name: "Reading Books", iconPath: "assets/images/icons/reading.png"),
  ];
}
