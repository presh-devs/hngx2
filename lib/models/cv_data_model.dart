class CVData {
  final String? fullName,
  stack,
      githubHandle,
      slackUsername,
      briefBio,
      role,
      employmentDate,
      company,
      school,
      course,
      educationDate;

  const CVData(
      {this.fullName = 'Adebayo Precious Oluwafemi',
      this.stack = 'Flutter Developer',
      this.githubHandle = 'presh-devs',
      this.slackUsername = 'Precious_Adebayo',
      this.briefBio =
          '''I am a budding mobile application developer with a passion for creating innovative and user-friendly apps. I am a highly motivated and self-driven individual who is always eager to learn new things and take on new challenges.''',
      this.role = 'Flutter Developer Intern',
      this.employmentDate = '12/03/2023',
      this.company = 'HNG',
      this.course = '''Computer Science with maths''',
      this.school = 'OAU',
      this.educationDate = '13/03/2023'});

  CVData copyWith(
      {String? fullName,
      githubHandle,
      slackUsername,
      briefBio,
      role,
      employmentDate,
      company, educationDate}) {
    return CVData(
        fullName: fullName ?? this.fullName,
        githubHandle: githubHandle ?? this.githubHandle,
        slackUsername: slackUsername ?? this.slackUsername,
        briefBio: briefBio ?? this.briefBio,
        role: role ?? this.role,
        employmentDate: employmentDate ?? this.employmentDate,
        company: company ?? this.company,
        educationDate: educationDate ?? this.educationDate);
  }
}
