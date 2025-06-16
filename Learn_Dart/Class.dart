class Patient{
  String? name;
  int? age;
  String? disease;
  Patient({required this.name,required this.age,this.disease}){}
}
void main(){
  Patient patient = Patient(name: 'Sunita', age: 60, disease: 'AIDS');
  print("""
  Patient name : ${patient.name}
  Patient age : ${patient.age}
  Patient disease : ${patient.disease}""");
}