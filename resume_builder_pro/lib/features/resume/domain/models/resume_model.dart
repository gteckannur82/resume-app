import 'package:uuid/uuid.dart';

/// Complete resume data model.
/// Serializable to/from Map for Hive persistence.
class ResumeModel {
  ResumeModel({
    String? id,
    this.title = 'Untitled Resume',
    this.templateId = 'minimal',
    PersonalInfo? personalInfo,
    this.summary = '',
    List<Experience>? experiences,
    List<Education>? educations,
    List<Skill>? skills,
    List<Project>? projects,
    List<Language>? languages,
    List<Achievement>? achievements,
    List<Certificate>? certificates,
    List<String>? interests,
    List<Reference>? references,
    List<CustomSection>? customSections,
    List<String>? sectionOrder,
    this.accentColor = '#4F46E5',
    this.fontFamily = 'Inter',
    this.fontSize = 14.0,
    this.lineHeight = 1.5,
    this.sectionSpacing = 24.0,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.tags = const [],
    this.isPdfReady = false,
  })  : id = id ?? const Uuid().v4(),
        personalInfo = personalInfo ?? PersonalInfo(),
        experiences = experiences ?? [],
        educations = educations ?? [],
        skills = skills ?? [],
        projects = projects ?? [],
        languages = languages ?? [],
        achievements = achievements ?? [],
        certificates = certificates ?? [],
        interests = interests ?? [],
        references = references ?? [],
        customSections = customSections ?? [],
        sectionOrder = sectionOrder ??
            [
              'personalInfo',
              'summary',
              'experience',
              'education',
              'skills',
              'projects',
              'languages',
              'achievements',
              'certificates',
              'interests',
              'references',
            ],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String id;
  final String title;
  final String templateId;
  final PersonalInfo personalInfo;
  final String summary;
  final List<Experience> experiences;
  final List<Education> educations;
  final List<Skill> skills;
  final List<Project> projects;
  final List<Language> languages;
  final List<Achievement> achievements;
  final List<Certificate> certificates;
  final List<String> interests;
  final List<Reference> references;
  final List<CustomSection> customSections;
  final List<String> sectionOrder;
  final String accentColor;
  final String fontFamily;
  final double fontSize;
  final double lineHeight;
  final double sectionSpacing;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;
  final bool isPdfReady;

  /// Calculate profile completion percentage.
  int get completionPercentage {
    int total = 8;
    int filled = 0;
    if (personalInfo.fullName.isNotEmpty) filled++;
    if (personalInfo.email.isNotEmpty) filled++;
    if (personalInfo.phone.isNotEmpty) filled++;
    if (summary.isNotEmpty) filled++;
    if (experiences.isNotEmpty) filled++;
    if (educations.isNotEmpty) filled++;
    if (skills.isNotEmpty) filled++;
    if (personalInfo.jobTitle.isNotEmpty) filled++;
    return ((filled / total) * 100).round();
  }

  ResumeModel copyWith({
    String? id,
    String? title,
    String? templateId,
    PersonalInfo? personalInfo,
    String? summary,
    List<Experience>? experiences,
    List<Education>? educations,
    List<Skill>? skills,
    List<Project>? projects,
    List<Language>? languages,
    List<Achievement>? achievements,
    List<Certificate>? certificates,
    List<String>? interests,
    List<Reference>? references,
    List<CustomSection>? customSections,
    List<String>? sectionOrder,
    String? accentColor,
    String? fontFamily,
    double? fontSize,
    double? lineHeight,
    double? sectionSpacing,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? tags,
    bool? isPdfReady,
  }) {
    return ResumeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      templateId: templateId ?? this.templateId,
      personalInfo: personalInfo ?? this.personalInfo,
      summary: summary ?? this.summary,
      experiences: experiences ?? this.experiences,
      educations: educations ?? this.educations,
      skills: skills ?? this.skills,
      projects: projects ?? this.projects,
      languages: languages ?? this.languages,
      achievements: achievements ?? this.achievements,
      certificates: certificates ?? this.certificates,
      interests: interests ?? this.interests,
      references: references ?? this.references,
      customSections: customSections ?? this.customSections,
      sectionOrder: sectionOrder ?? this.sectionOrder,
      accentColor: accentColor ?? this.accentColor,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      sectionSpacing: sectionSpacing ?? this.sectionSpacing,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
      tags: tags ?? this.tags,
      isPdfReady: isPdfReady ?? this.isPdfReady,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'templateId': templateId,
      'personalInfo': personalInfo.toMap(),
      'summary': summary,
      'experiences': experiences.map((e) => e.toMap()).toList(),
      'educations': educations.map((e) => e.toMap()).toList(),
      'skills': skills.map((e) => e.toMap()).toList(),
      'projects': projects.map((e) => e.toMap()).toList(),
      'languages': languages.map((e) => e.toMap()).toList(),
      'achievements': achievements.map((e) => e.toMap()).toList(),
      'certificates': certificates.map((e) => e.toMap()).toList(),
      'interests': interests,
      'references': references.map((e) => e.toMap()).toList(),
      'customSections': customSections.map((e) => e.toMap()).toList(),
      'sectionOrder': sectionOrder,
      'accentColor': accentColor,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'lineHeight': lineHeight,
      'sectionSpacing': sectionSpacing,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'tags': tags,
      'isPdfReady': isPdfReady,
    };
  }

  factory ResumeModel.fromMap(Map<String, dynamic> map) {
    return ResumeModel(
      id: map['id'] as String? ?? const Uuid().v4(),
      title: map['title'] as String? ?? 'Untitled Resume',
      templateId: map['templateId'] as String? ?? 'minimal',
      personalInfo: map['personalInfo'] != null
          ? PersonalInfo.fromMap(
              Map<String, dynamic>.from(map['personalInfo'] as Map))
          : PersonalInfo(),
      summary: map['summary'] as String? ?? '',
      experiences: (map['experiences'] as List<dynamic>?)
              ?.map((e) =>
                  Experience.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      educations: (map['educations'] as List<dynamic>?)
              ?.map((e) =>
                  Education.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      skills: (map['skills'] as List<dynamic>?)
              ?.map(
                  (e) => Skill.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      projects: (map['projects'] as List<dynamic>?)
              ?.map((e) =>
                  Project.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      languages: (map['languages'] as List<dynamic>?)
              ?.map((e) =>
                  Language.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      achievements: (map['achievements'] as List<dynamic>?)
              ?.map((e) =>
                  Achievement.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      certificates: (map['certificates'] as List<dynamic>?)
              ?.map((e) =>
                  Certificate.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      interests: (map['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      references: (map['references'] as List<dynamic>?)
              ?.map((e) =>
                  Reference.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      customSections: (map['customSections'] as List<dynamic>?)
              ?.map((e) =>
                  CustomSection.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      sectionOrder: (map['sectionOrder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      accentColor: map['accentColor'] as String? ?? '#4F46E5',
      fontFamily: map['fontFamily'] as String? ?? 'Inter',
      fontSize: (map['fontSize'] as num?)?.toDouble() ?? 14.0,
      lineHeight: (map['lineHeight'] as num?)?.toDouble() ?? 1.5,
      sectionSpacing: (map['sectionSpacing'] as num?)?.toDouble() ?? 24.0,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : DateTime.now(),
      tags: (map['tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isPdfReady: map['isPdfReady'] as bool? ?? false,
    );
  }

  /// Create a sample resume for demo / preview purposes.
  factory ResumeModel.sample() {
    return ResumeModel(
      title: 'Product Manager 2024',
      templateId: 'minimal',
      personalInfo: PersonalInfo(
        fullName: 'Jane Doe',
        jobTitle: 'Senior Product Designer',
        email: 'jane.doe@example.com',
        phone: '+1 (555) 000-0000',
        location: 'San Francisco, CA',
        profileImageUrl: '',
      ),
      summary:
          'Innovative Product Designer with 8+ years of experience in creating human-centered SaaS platforms. Specialized in design systems, user research, and cross-functional team leadership.',
      experiences: [
        Experience(
          title: 'Lead UI Designer',
          company: 'TechFlow',
          location: 'San Francisco, CA',
          startDate: DateTime(2021, 1),
          description:
              'Spearheaded the redesign of the core SaaS platform, resulting in a 40% increase in user engagement.',
          isCurrent: true,
        ),
        Experience(
          title: 'Product Designer',
          company: 'InnovateIQ',
          location: 'New York, NY',
          startDate: DateTime(2018, 3),
          endDate: DateTime(2021, 1),
          description:
              'Developed design systems that reduced engineering hand-off time by 25%.',
        ),
      ],
      educations: [
        Education(
          degree: 'BFA in Graphic Design',
          institution: 'RISD',
          startDate: DateTime(2014, 9),
          endDate: DateTime(2018, 5),
        ),
      ],
      skills: [
        Skill(name: 'Figma', level: SkillLevel.expert),
        Skill(name: 'Tailwind CSS', level: SkillLevel.advanced),
        Skill(name: 'React', level: SkillLevel.advanced),
        Skill(name: 'Prototyping', level: SkillLevel.expert),
        Skill(name: 'User Research', level: SkillLevel.advanced),
        Skill(name: 'Design Systems', level: SkillLevel.expert),
      ],
      tags: ['TECH', 'PDF READY'],
      isPdfReady: true,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    );
  }
}

// ──────────────────────────────────────────────
// SUB-MODELS
// ──────────────────────────────────────────────

class PersonalInfo {
  PersonalInfo({
    this.fullName = '',
    this.jobTitle = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.website = '',
    this.linkedIn = '',
    this.github = '',
    this.profileImageUrl = '',
  });

  final String fullName;
  final String jobTitle;
  final String email;
  final String phone;
  final String location;
  final String website;
  final String linkedIn;
  final String github;
  final String profileImageUrl;

  PersonalInfo copyWith({
    String? fullName,
    String? jobTitle,
    String? email,
    String? phone,
    String? location,
    String? website,
    String? linkedIn,
    String? github,
    String? profileImageUrl,
  }) {
    return PersonalInfo(
      fullName: fullName ?? this.fullName,
      jobTitle: jobTitle ?? this.jobTitle,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      website: website ?? this.website,
      linkedIn: linkedIn ?? this.linkedIn,
      github: github ?? this.github,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toMap() => {
        'fullName': fullName,
        'jobTitle': jobTitle,
        'email': email,
        'phone': phone,
        'location': location,
        'website': website,
        'linkedIn': linkedIn,
        'github': github,
        'profileImageUrl': profileImageUrl,
      };

  factory PersonalInfo.fromMap(Map<String, dynamic> map) => PersonalInfo(
        fullName: map['fullName'] as String? ?? '',
        jobTitle: map['jobTitle'] as String? ?? '',
        email: map['email'] as String? ?? '',
        phone: map['phone'] as String? ?? '',
        location: map['location'] as String? ?? '',
        website: map['website'] as String? ?? '',
        linkedIn: map['linkedIn'] as String? ?? '',
        github: map['github'] as String? ?? '',
        profileImageUrl: map['profileImageUrl'] as String? ?? '',
      );
}

class Experience {
  Experience({
    String? id,
    this.title = '',
    this.company = '',
    this.location = '',
    this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.description = '',
    List<String>? bulletPoints,
  })  : id = id ?? const Uuid().v4(),
        bulletPoints = bulletPoints ?? [];

  final String id;
  final String title;
  final String company;
  final String location;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isCurrent;
  final String description;
  final List<String> bulletPoints;

  Experience copyWith({
    String? id,
    String? title,
    String? company,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    bool? isCurrent,
    String? description,
    List<String>? bulletPoints,
  }) {
    return Experience(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrent: isCurrent ?? this.isCurrent,
      description: description ?? this.description,
      bulletPoints: bulletPoints ?? this.bulletPoints,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'company': company,
        'location': location,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'isCurrent': isCurrent,
        'description': description,
        'bulletPoints': bulletPoints,
      };

  factory Experience.fromMap(Map<String, dynamic> map) => Experience(
        id: map['id'] as String?,
        title: map['title'] as String? ?? '',
        company: map['company'] as String? ?? '',
        location: map['location'] as String? ?? '',
        startDate: map['startDate'] != null
            ? DateTime.parse(map['startDate'] as String)
            : null,
        endDate: map['endDate'] != null
            ? DateTime.parse(map['endDate'] as String)
            : null,
        isCurrent: map['isCurrent'] as bool? ?? false,
        description: map['description'] as String? ?? '',
        bulletPoints: (map['bulletPoints'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
      );
}

class Education {
  Education({
    String? id,
    this.degree = '',
    this.institution = '',
    this.location = '',
    this.startDate,
    this.endDate,
    this.gpa = '',
    this.description = '',
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String degree;
  final String institution;
  final String location;
  final DateTime? startDate;
  final DateTime? endDate;
  final String gpa;
  final String description;

  Education copyWith({
    String? id,
    String? degree,
    String? institution,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? gpa,
    String? description,
  }) {
    return Education(
      id: id ?? this.id,
      degree: degree ?? this.degree,
      institution: institution ?? this.institution,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      gpa: gpa ?? this.gpa,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'degree': degree,
        'institution': institution,
        'location': location,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'gpa': gpa,
        'description': description,
      };

  factory Education.fromMap(Map<String, dynamic> map) => Education(
        id: map['id'] as String?,
        degree: map['degree'] as String? ?? '',
        institution: map['institution'] as String? ?? '',
        location: map['location'] as String? ?? '',
        startDate: map['startDate'] != null
            ? DateTime.parse(map['startDate'] as String)
            : null,
        endDate: map['endDate'] != null
            ? DateTime.parse(map['endDate'] as String)
            : null,
        gpa: map['gpa'] as String? ?? '',
        description: map['description'] as String? ?? '',
      );
}

enum SkillLevel { beginner, intermediate, advanced, expert }

class Skill {
  Skill({
    String? id,
    this.name = '',
    this.level = SkillLevel.intermediate,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final SkillLevel level;

  Skill copyWith({String? id, String? name, SkillLevel? level}) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'level': level.index,
      };

  factory Skill.fromMap(Map<String, dynamic> map) => Skill(
        id: map['id'] as String?,
        name: map['name'] as String? ?? '',
        level: SkillLevel.values[(map['level'] as int?) ?? 1],
      );
}

class Project {
  Project({
    String? id,
    this.name = '',
    this.description = '',
    this.url = '',
    this.technologies = const [],
    this.startDate,
    this.endDate,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final String description;
  final String url;
  final List<String> technologies;
  final DateTime? startDate;
  final DateTime? endDate;

  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    List<String>? technologies,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
      technologies: technologies ?? this.technologies,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'url': url,
        'technologies': technologies,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
      };

  factory Project.fromMap(Map<String, dynamic> map) => Project(
        id: map['id'] as String?,
        name: map['name'] as String? ?? '',
        description: map['description'] as String? ?? '',
        url: map['url'] as String? ?? '',
        technologies: (map['technologies'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        startDate: map['startDate'] != null
            ? DateTime.parse(map['startDate'] as String)
            : null,
        endDate: map['endDate'] != null
            ? DateTime.parse(map['endDate'] as String)
            : null,
      );
}

class Language {
  Language({
    String? id,
    this.name = '',
    this.proficiency = 'Intermediate',
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final String proficiency;

  Language copyWith({String? id, String? name, String? proficiency}) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
      proficiency: proficiency ?? this.proficiency,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'proficiency': proficiency,
      };

  factory Language.fromMap(Map<String, dynamic> map) => Language(
        id: map['id'] as String?,
        name: map['name'] as String? ?? '',
        proficiency: map['proficiency'] as String? ?? 'Intermediate',
      );
}

class Achievement {
  Achievement({
    String? id,
    this.title = '',
    this.description = '',
    this.date,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String title;
  final String description;
  final DateTime? date;

  Achievement copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
  }) {
    return Achievement(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date?.toIso8601String(),
      };

  factory Achievement.fromMap(Map<String, dynamic> map) => Achievement(
        id: map['id'] as String?,
        title: map['title'] as String? ?? '',
        description: map['description'] as String? ?? '',
        date: map['date'] != null
            ? DateTime.parse(map['date'] as String)
            : null,
      );
}

class Certificate {
  Certificate({
    String? id,
    this.name = '',
    this.issuer = '',
    this.date,
    this.url = '',
    this.credentialId = '',
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final String issuer;
  final DateTime? date;
  final String url;
  final String credentialId;

  Certificate copyWith({
    String? id,
    String? name,
    String? issuer,
    DateTime? date,
    String? url,
    String? credentialId,
  }) {
    return Certificate(
      id: id ?? this.id,
      name: name ?? this.name,
      issuer: issuer ?? this.issuer,
      date: date ?? this.date,
      url: url ?? this.url,
      credentialId: credentialId ?? this.credentialId,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'issuer': issuer,
        'date': date?.toIso8601String(),
        'url': url,
        'credentialId': credentialId,
      };

  factory Certificate.fromMap(Map<String, dynamic> map) => Certificate(
        id: map['id'] as String?,
        name: map['name'] as String? ?? '',
        issuer: map['issuer'] as String? ?? '',
        date: map['date'] != null
            ? DateTime.parse(map['date'] as String)
            : null,
        url: map['url'] as String? ?? '',
        credentialId: map['credentialId'] as String? ?? '',
      );
}

class Reference {
  Reference({
    String? id,
    this.name = '',
    this.title = '',
    this.company = '',
    this.email = '',
    this.phone = '',
    this.relationship = '',
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final String title;
  final String company;
  final String email;
  final String phone;
  final String relationship;

  Reference copyWith({
    String? id,
    String? name,
    String? title,
    String? company,
    String? email,
    String? phone,
    String? relationship,
  }) {
    return Reference(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      company: company ?? this.company,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      relationship: relationship ?? this.relationship,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'title': title,
        'company': company,
        'email': email,
        'phone': phone,
        'relationship': relationship,
      };

  factory Reference.fromMap(Map<String, dynamic> map) => Reference(
        id: map['id'] as String?,
        name: map['name'] as String? ?? '',
        title: map['title'] as String? ?? '',
        company: map['company'] as String? ?? '',
        email: map['email'] as String? ?? '',
        phone: map['phone'] as String? ?? '',
        relationship: map['relationship'] as String? ?? '',
      );
}

class CustomSection {
  CustomSection({
    String? id,
    this.title = '',
    List<CustomSectionItem>? items,
  })  : id = id ?? const Uuid().v4(),
        items = items ?? [];

  final String id;
  final String title;
  final List<CustomSectionItem> items;

  CustomSection copyWith({
    String? id,
    String? title,
    List<CustomSectionItem>? items,
  }) {
    return CustomSection(
      id: id ?? this.id,
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'items': items.map((e) => e.toMap()).toList(),
      };

  factory CustomSection.fromMap(Map<String, dynamic> map) => CustomSection(
        id: map['id'] as String?,
        title: map['title'] as String? ?? '',
        items: (map['items'] as List<dynamic>?)
                ?.map((e) => CustomSectionItem.fromMap(
                    Map<String, dynamic>.from(e as Map)))
                .toList() ??
            [],
      );
}

class CustomSectionItem {
  CustomSectionItem({
    String? id,
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.date,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final DateTime? date;

  CustomSectionItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    DateTime? date,
  }) {
    return CustomSectionItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'description': description,
        'date': date?.toIso8601String(),
      };

  factory CustomSectionItem.fromMap(Map<String, dynamic> map) =>
      CustomSectionItem(
        id: map['id'] as String?,
        title: map['title'] as String? ?? '',
        subtitle: map['subtitle'] as String? ?? '',
        description: map['description'] as String? ?? '',
        date: map['date'] != null
            ? DateTime.parse(map['date'] as String)
            : null,
      );
}
