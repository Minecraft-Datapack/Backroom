import 'package:objd/core.dart';
import 'room/level0.dart';
import './main.dart';
import './load.dart';

void main(List<String> args){
	createProject(
		Project(
			name:"BackroomDP",
			target:"../", // path for where to generate the project
            version: 18,
			generate: CustomWidget() // The starting point of generation
		),
		args
	);
}

class CustomWidget extends Widget {

    @override
    Widget generate(Context context){
        return For.of([
            Pack(
                name:"index",
                main: File( // optional
                    'main',
                    child: MainFile()
                ),
                load: File(
                    'load',
                    child: LoadFile()
                ),
                files: [
                    File("generatelevel0",child: GenerateLevel())
                ],        
            )
        ]);
    }
}