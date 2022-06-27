import 'package:objd/core.dart';
import 'dart:math';

List<String> LAYOUT = [
"##############################################",
"#  #     #  #  #        #     #  #           #",
"#  ####  #  #  #######  ####  #  ##########  #",
"#  #              #  #              #        #",
"#  #  #  ##########  ####  #######  #  ####  #",
"#  #  #     #  #  #     #  #  #  #     #     #",
"#  #  #######  #  ####  #  #  #  ####  #  ####",
"#                 #     #  #           #     #",
"#######  #######  ####  #######  ##########  #",
"#  #        #  #  #        #  #  #  #        #",
"#  #  #######  ####  #  ####  ####  #######  #",
"#        #           #           #  #        #",
"#  ####  ####  #  #  ####  #######  ####  ####",
"#  #     #     #  #     #  #  #              #",
"#  #  ####  ####  ##########  #  #  #  #  ####",
"#  #     #  #     #  #        #  #  #  #     #",
"####  #######  ####  ####  #######  ####  ####",
"#  #        #     #     #  #        #  #     #",
"#  ####  ####  ####  #  #  #  ####  #  #  ####",
"#     #     #        #  #     #        #  #  #",
"#  ####  ####  #  ####  #######  #######  #  #",
"#  #           #     #  #  #        #  #     #",
"#  #  ####  #######  ####  #  ####  #  ####  #",
"#     #  #     #  #  #  #     #  #  #  #  #  #",
"#######  #  ####  #  #  #######  #  #  #  ####",
"#  #  #           #  #                       #",
"#  #  #  #  ##########  ####  ################",
"#  #  #  #  #           #  #                 #",
"#  #  ####  ####  #  #  #  ####  ####  #######",
"#     #           #  #  #        #        #  #",
"#  #  ##########  ####  ####  #  #######  #  #",
"#  #  #     #  #     #     #  #  #     #     #",
"####  ####  #  #  #  #  #  #######  #######  #",
"#  #  #     #     #  #  #  #  #  #  #  #     #",
"#  #  #  #  #  #  ##########  #  #  #  #######",
"#     #  #     #           #           #     #",
"####  #  #######  #######  ####  ##########  #",
"#           #  #  #  #     #     #           #",
"#  #######  #  ####  #######  #############  #",
"#  #              #     #  #        #        #",
"####  #  #  #  ####  ####  #  #  #  ####  #  #",
"#  #  #  #  #  #        #     #  #        #  #",
"#  #  #  ####  ####  #######  #######  #######",
"#  #  #     #        #  #        #        #  #",
"#  ####  #############  ####  ##########  #  #",
"#     #     #  #  #  #     #     #           #",
"#  ####  ####  #  #  ####  #######  #  #  #  #",
"#        #              #     #     #  #  #  #",
"#  #  ####  ####  #  #  #  #  #  #  #  ####  #",
"#  #           #  #  #     #     #  #  #     #",
"#######  ####  #  #  #  ####  #  ##########  #",
"#  #  #  #  #  #  #  #     #  #     #        #",
"#  #  #  #  #######  #############  ##########",
"#        #  #        #           #     #     #",
"#######  #  ################  ####  #  ####  #",
"#        #     #              #     #     #  #",
"#  #  #  #  #  #  ####  #######  ####  #  #  #",
"#  #  #     #  #  #  #           #     #  #  #",
"#  ####  ####  ####  #######  #######  #  #  #",
"#     #  #        #                 #  #     #",
"##############################################",
];

Map selectBlock = {
    "#" : Blocks.end_stone_bricks,
    " " : Blocks.air
};

class GenerateLevel extends Widget {
    @override
    generate(Context context) {
        return For.of([
                Fill(Blocks.air,area: Area.fromLocations(Location.here(), Location.rel(x: LAYOUT.length-1,z: LAYOUT[0].length-1))),
                For(
                    from: 0,
                    to: LAYOUT.length-1,
                    create: (i){
                        return For(
                            from: 0,
                            to: LAYOUT[0].length-1,
                            create: (j){
                                // return SetBlock(selectBlock[LAYOUT[i][j]],location: Location.rel(x: i.toDouble(),z: j.toDouble()));
                                return Fill(Blocks.air, area: Area.fromLocations(Location.rel(x: (3*i).toDouble(),z: (3*j).toDouble()), Location.rel(x: (3*i+2).toDouble(),z: (3*j+2).toDouble(),y: 3)));
                            }
                        );
                    }
                ),
                Fill(Blocks.cut_sandstone,area: Area.fromLocations(Location.rel(y: -1), Location.rel(x: (LAYOUT.length-1)*3,z: (LAYOUT[0].length-1)*3,y: -1))),
                Fill(Blocks.cut_sandstone,area: Area.fromLocations(Location.rel(y: 4), Location.rel(x: (LAYOUT.length-1)*3,z: (LAYOUT[0].length-1)*3,y: 4))),
                For(
                from: 0,
                to: LAYOUT.length-1,
                create: (i){
                    return For(
                        from: 0,
                        to: LAYOUT[0].length-1,
                        create: (j){
                            // return SetBlock(selectBlock[LAYOUT[i][j]],location: Location.rel(x: i.toDouble(),z: j.toDouble()));
                            return For.of([
                                Fill(selectBlock[LAYOUT[i][j]], area: Area.fromLocations(Location.rel(x: (3*i).toDouble(),z: (3*j).toDouble()), Location.rel(x: (3*i+2).toDouble(),z: (3*j+2).toDouble(),y: 3))),
                                SetBlock(Random().nextDouble() < 0.4 ? Blocks.sea_lantern : Blocks.cut_sandstone,location: Location.rel(x: (1+3*i).toDouble(),z: (1+3*j).toDouble(),y: 4))
                            ]);
                        }
                    );
                },
            ),
            
            
        ]);
    }
}