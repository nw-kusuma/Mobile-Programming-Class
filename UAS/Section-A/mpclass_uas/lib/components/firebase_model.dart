class Students {
  final String id;
  final String name;
  final String email;
  final String subject;
  final String grade;

  Students(
    { required this.id, 
      required this.name, 
      required this.email,
      required this.subject, 
      required this.grade, 
    });
  
  factory Students.fromRTDB(Map<String, dynamic> data){
    return Students(
      id: data['id'] ?? 0, 
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      subject: data['subject'] ?? 'mpclass',
      grade: data['grade'] ?? 'E');
  }
}

class Subjects {
  final String subject;
  final String description;

  Subjects(
    { required this.subject, 
      required this.description
    });
  
  factory Subjects.fromRTDB(Map<String, dynamic> data){
    return Subjects(
      subject: data['subject'] ?? 'mpclass',
      description: data['description'] ?? "Mobile Programming");
  }
}

class Grades {
  final String grade;
  final String description;

  Grades(
    { required this.grade, 
      required this.description
    });
  
  factory Grades.fromRTDB(Map<String, dynamic> data){
    return Grades(
      grade: data['grade'] ?? 'E',
      description: data['description'] ?? "Failed");
  }
}