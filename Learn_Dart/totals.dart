import 'dart:io';

void main(List<String> arguments) {
  if(arguments.isEmpty){
    print('Usage: dart totals.dart <inputfile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final totalDurationByTag = <String,double>{
  };
  final lines = File(inputFile).readAsLinesSync();
  lines.removeAt(0);
  var totalDuration =0.0;
  for(var line in lines){
    final values = line.split(',');
    final durationStr = values[3].replaceAll('"', '');
    final duration = double.parse(durationStr);
    final tag = values[5].replaceAll('"', '');
    final previousTotal = totalDurationByTag[tag];
    if (previousTotal==null){
      totalDurationByTag[tag] = duration;
    }
    else{
      totalDurationByTag[tag] = previousTotal + duration;
    }
    totalDuration+=duration;
  }
  for( var entry in totalDurationByTag.entries){
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key ==''?'Unallocated':entry.key;
    print('$tag : ${durationFormatted}h');
  }
  print('total duration : ${totalDuration.toStringAsFixed(1)}h');
}
