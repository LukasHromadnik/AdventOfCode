let mainInput = """
#.###########################################################################################################################################
#.###.......#...#...#.....###...#...............###...#####...#...#...#...#...#.....#...#.........#.........#...........#...###...#.........#
#.###.#####.#.#.#.#.#.###.###.#.#.#############.###.#.#####.#.#.#.#.#.#.#.#.#.#.###.#.#.#.#######.#.#######.#.#########.#.#.###.#.#.#######.#
#...#.....#...#.#.#.#...#...#.#.#.......#.......#...#...###.#.#.#.#.#.#.#.#.#...#...#.#.#.......#.#.#.......#.........#.#.#.###.#.#.#.......#
###.#####.#####.#.#.###.###.#.#.#######.#.#######.#####.###.#.#.#.#.#.#.#.#.#####.###.#.#######.#.#.#.###############.#.#.#.###.#.#.#.#######
#...#.....#...#...#...#...#.#.#.#...###.#.....###.#.....#...#.#.#.#.#.#.#.#.#.....###.#.#.......#.#.#.....###.........#.#.#.....#.#.#.#...###
#.###.#####.#.#######.###.#.#.#.#.#.###.#####.###.#.#####.###.#.#.#.#.#.#.#.#.#######.#.#.#######.#.#####.###.#########.#.#######.#.#.#.#.###
#...#.#.....#.........#...#...#...#.>.>.#.....#...#.#...#.#...#.#...#.#.#.#.#.....#...#.#.......#.#.#.....#...#.....#...#.......#...#...#...#
###.#.#.###############.#############v###.#####.###.#.#.#.#.###.#####.#.#.#.#####.#.###.#######.#.#.#.#####.###.###.#.#########.###########.#
###...#...........#...#...........###...#...###...#.#.#.#.#.###.#.....#.#...#.....#...#.#...###.#.#.#.#...#.....#...#.#...#...#.#...........#
#################.#.#.###########.#####.###.#####.#.#.#.#.#.###.#.#####.#####.#######.#.#.#.###.#.#.#.#.#.#######.###.#.#.#.#.#.#.###########
#.................#.#.#...#.......#.....###.#...#.#...#...#.>.>.#.....#.#...#.#...#...#.#.#.#...#.#.#.#.#.#...###...#.#.#.#.#.#.#.......#####
#.#################.#.#.#.#.#######.#######.#.#.#.###########v#######.#.#.#.#.#.#.#.###.#.#.#.###.#.#.#.#.#.#.#####.#.#.#.#.#.#.#######.#####
#.................#.#.#.#.#.......#.#...###...#.#...#.........###.....#.#.#...#.#.#...#.#.#.#...#.#.#.#.#.#.#.#.>.>.#...#.#.#.#.#.....#.....#
#################.#.#.#.#.#######.#.#.#.#######.###.#.###########.#####.#.#####.#.###.#.#.#.###.#.#.#.#.#.#.#.#.#v#######.#.#.#.#.###.#####.#
#.................#.#.#.#.#...#...#...#.......#...#.#...........#...#...#...#...#.###.#.#.#.#...#.#.#.#.#...#...#.......#...#...#...#.#.....#
#.#################.#.#.#.#.#.#.#############.###.#.###########.###.#.#####.#.###.###.#.#.#.#.###.#.#.#.###############.###########.#.#.#####
#...#.......#...###.#.#.#.#.#...#.............###.#...#.......#...#.#.#.....#...#.#...#.#.#.#.###...#.#.#.....###.....#...#.....###.#...#####
###.#.#####.#.#v###.#.#.#.#.#####.###############.###.#.#####.###.#.#.#.#######.#.#.###.#.#.#.#######.#.#.###.###.###.###.#.###.###.#########
###...#...#...#.>.#.#.#.#.#.#...#.............###.....#.#...#.....#...#.#.>.>...#.#...#...#.#.....#...#.#...#...#...#.#...#...#.#...###...###
#######.#.#####v#.#.#.#.#.#.#.#.#############.#########.#.#.###########.#.#v#####.###.#####.#####.#.###.###.###.###.#.#.#####.#.#.#####.#.###
#.......#.......#...#.#.#...#.#.....#...#...#.....###...#.#...........#.#.#.....#...#.#...#.#...#.#.#...###...#.....#...#.....#...#.....#...#
#.###################.#.#####.#####.#.#.#.#.#####.###.###.###########.#.#.#####.###.#.#.#.#.#.#.#.#.#.#######.###########.#########.#######.#
#.#.....#...........#...#...#.....#.#.#.#.#.#...#...#.....#.........#.#...#.....###...#.#.#...#...#...###...#.......#...#...........#...#...#
#.#.###.#.#########.#####.#.#####.#.#.#.#.#.#.#.###.#######.#######.#.#####.###########.#.###############.#.#######.#.#.#############.#.#.###
#.#.#...#.#...#.....#.....#.......#...#...#...#.....#...###.......#.#.....#...###.......#...#...#...#...#.#.........#.#.#...#.....#...#...###
#.#.#.###.#.#.#.#####.###############################.#.#########.#.#####.###.###.#########.#.#.#.#.#.#.#.###########.#.#.#.#.###.#.#########
#...#.....#.#.#.....#.#...........................#...#...#...#...#.......###...#.......#...#.#.#.#.#.#.#.....#.....#.#...#.#.#...#.........#
###########.#.#####.#.#.#########################.#.#####.#.#.#.###############.#######.#.###.#.#.#.#.#.#####.#.###.#.#####.#.#.###########.#
#.......#...#.....#.#...#...........#...#...#.....#.....#...#.#.......#...#...#...#...#.#.###.#.#.#.#.#.#...#.#...#.#...#...#.#.#...#...#...#
#.#####.#.#######.#.#####.#########.#.#.#.#.#.#########.#####.#######.#.#.#.#.###.#.#.#.#.###.#.#.#.#.#.#.#.#v###.#.###.#.###.#.#.#.#v#.#.###
#.....#.#.......#...#...#.........#.#.#.#.#...###.......#...#.........#.#.#.#.....#.#...#...#.#.#.#...#.#.#.>.>...#.#...#.#...#.#.#.>.#...###
#####.#.#######.#####.#.#########.#.#.#.#.#######.#######.#.###########.#.#.#######.#######.#.#.#.#####.#.###v#####.#.###.#.###.#.###v#######
#...#.#.........#...#.#.#...#.....#.#.#.#...#...#.......#.#...#...#...#.#...#...###.....#...#.#.#.#.....#.#...#...#.#...#...#...#.#...###...#
#.#.#.###########.#.#.#.#.#.#.#####.#.#.###.#.#.#######.#.###.#.#.#.#.#.#####.#.#######.#.###.#.#.#.#####.#.###.#.#.###.#####.###.#.#####.#.#
#.#...#...#...###.#.#.#.#.#.#.....#...#.....#.#.#.....#...###...#.#.#.#.......#.#.....#.#.....#...#.......#.....#.#.#...#.....#...#...###.#.#
#.#####.#v#.#.###.#.#.#.#.#.#####.###########.#.#.###.###########.#.#.#########.#.###.#.#########################.#.#.###.#####.#####.###.#.#
#.#...#.#.>.#...#.#.#.#.#.#.#.....#...#...###.#.#...#.###...#...#...#.#...#...#.#...#.#.........#.......###...#...#.#...#.#...#.....#.....#.#
#.#.#.#.#v#####.#.#.#.#.#.#.#v#####.#.#.#.###.#.###.#.###.#.#.#.#####.#.#.#.#.#v###.#.#########.#.#####.###.#.#.###.###.#.#.#.#####.#######.#
#...#...#.....#...#.#.#.#.#.>.>.#...#.#.#...#.#...#.#.#...#.#.#.#.....#.#...#.>.>.#.#...#.......#.....#.#...#.#...#.#...#...#.......#.......#
#############.#####.#.#.#.###v#.#.###.#.###.#.###.#.#.#.###.#.#.#.#####.#######v#.#.###.#.###########.#.#.###.###.#.#.###############.#######
#.............#...#.#.#.#.###.#.#.#...#.#...#.#...#.#.#...#.#.#.#.#...#...#.....#...###.#.....#.......#.#...#.#...#.#.#.............#...#...#
#.#############.#.#.#.#.#.###.#.#.#.###.#.###.#.###.#.###.#.#.#.#v#.#.###.#.###########.#####.#.#######.###.#.#.###.#.#.###########.###.#.#.#
#...#...#...###.#.#...#.#.#...#...#.#...#.....#.#...#.#...#.#.#.>.>.#.....#...#...#...#.......#...#...#.#...#.#...#.#.#.#.....#...#.....#.#.#
###.#.#.#.#.###.#.#####.#.#.#######.#.#########.#.###.#.###.#.###v###########.#.#.#.#.###########.#.#.#.#.###.###.#.#.#.#.###.#.#.#######.#.#
###...#...#...#.#.###...#.#.#.....#...#.....#...#...#...###...###.....#.....#...#...#.....#...#...#.#.#...###.....#...#...###...#...#.....#.#
#############.#.#.###.###.#.#.###.#####.###.#.#####.#################.#.###.#############.#.#.#.###.#.#############################.#.#####.#
#.............#.#...#.....#.#.#...#...#...#.#.......###...#...#...#...#...#.#.............#.#...#...#.................#.............#.#.....#
#.#############.###.#######.#.#.###.#.###.#.###########.#.#.#.#.#.#.#####.#.#.#############.#####.###################.#.#############.#.#####
#...........#...###.....###...#...#.#.#...#...###...#...#.#.#...#...#.....#.#.............#.#...#.#...........#...#...#.....#...#.....#.....#
###########.#.#########.#########.#.#.#.#####.###.#.#.###.#.#########.#####.#############.#.#.#.#.#.#########.#.#.#.#######.#.#.#.#########.#
#...........#.#.........#...#...#...#...#.....#...#...#...#.........#.....#...............#...#...#.........#...#...#...###...#...#.........#
#.###########.#.#########.#.#.#.#########v#####.#######.###########.#####.#################################.#########.#.###########.#########
#...#.........#.........#.#.#.#.#.......>.>...#...#.....#.....#...#...#...#...................#...###.....#.#...#...#.#.#...#.....#.#.......#
###.#.#################.#.#.#.#.#.#######v###.###.#.#####v###.#.#.###.#.###.#################.#.#.###.###.#.#.#.#.#.#.#.#.#.#.###.#.#.#####.#
###...#...#...#...#...#.#.#...#.#.#.....#.###...#.#.#...>.>.#...#.....#...#.#.....#...........#.#.#...###...#.#.#.#.#.#.#.#.#...#.#...#.....#
#######.#.#.#.#.#.#.#.#.#.#####.#.#.###.#.#####.#.#.#.###v#.#############.#.#.###.#.###########.#.#.#########.#.#.#.#.#.#.#.###.#.#####.#####
#...#...#...#...#...#...#.....#...#...#.#.#.....#.#.#.#...#.#.....#.....#...#...#.#.....#...###.#.#.........#.#.#.#.#.#.#.#.#...#...#...#...#
#.#.#.#######################.#######.#.#.#.#####.#.#.#.###.#.###.#.###.#######.#.#####.#.#.###.#.#########.#.#.#.#.#.#.#.#.#.#####.#.###.#.#
#.#...#...............###...#...#.....#.#.#.#...#.#.#.#...#.#.#...#.#...#...#...#.......#.#.#...#.###.......#.#.#.#.#.#.#.#.#.....#.#...#.#.#
#.#####.#############.###.#.###.#.#####.#.#.#.#.#.#.#.###.#.#.#.###.#.###.#.#.###########.#.#.###.###v#######.#.#.#.#.#.#.#.#####.#.###v#.#.#
#.#...#.#.............#...#.....#.....#...#.#.#.#.#...#...#...#.....#...#.#.#.......#...#.#.#...#.#.>.>...#...#.#.#.#.#.#.#...#...#...>.#.#.#
#.#.#.#.#.#############.#############.#####.#.#.#.#####.###############.#.#.#######.#.#.#.#.###.#.#.#v###.#.###.#.#.#.#.#.###.#.#######v#.#.#
#...#...#...........###.......#...#...#...#...#.#.#.....#...###.........#.#.###...#.#.#.#.#.#...#...#...#.#.###...#.#.#...###...###...#...#.#
###################v#########.#.#.#.###.#.#####.#.#.#####.#.###.#########.#.###.#.#v#.#.#.#.#.#########.#.#.#######.#.#############.#.#####.#
#.................#.>.#...#...#.#.#.....#...###...#.....#.#...#.........#.#.....#.>.>.#.#.#.#.......###.#...#...#...#...#...#...#...#.#...#.#
#.###############.#v#.#.#.#.###.#.#########.###########.#.###.#########.#.#########v###.#.#.#######.###.#####.#.#.#####.#.#.#.#.#.###.#.#.#.#
#.......#.......#...#...#.#.#...#.....#.....#...#.......#...#...#.....#.#.#.........#...#.#.#.....#.#...#...#.#.#...#...#.#.#.#.#...#.#.#...#
#######.#.#####.#########.#.#.#######.#.#####.#.#.#########.###.#.###.#.#.#.#########.###.#.#.###.#.#.###.#.#.#.###.#.###.#.#.#.###.#.#.#####
#.......#.#.....#.......#.#.#...#...#...#####.#.#...........###...#...#.#.#...#.....#...#.#.#...#...#...#.#.#.#...#.#.#...#...#.....#.#.....#
#.#######.#.#####.#####.#.#.###.#.#.#########.#.###################.###.#.###.#.###.###.#.#.###.#######.#.#.#.###.#.#.#.#############.#####.#
#...#.....#.......#.....#.#.#...#.#...........#.....#...............###...###...###...#.#.#.....#...###...#...#...#...#.#...#.......#.#...#.#
###.#.#############.#####.#.#.###.#################.#.###############################.#.#.#######.#.###########.#######.#.#.#.#####.#.#.#.#.#
#...#.#.............#...#...#...#.#...#.....#.......#.......................###.......#.#.#.....#.#.#####.......#...###...#.#.#.....#...#.#.#
#.###.#.#############.#.#######.#.#.#.#.###.#.#############################.###.#######.#.#.###.#.#.#####.#######.#.#######.#.#.#########.#.#
#.....#...............#...#...#...#.#...###...#...#...#...#.................#...#...###...#.#...#.#.#.....#...###.#.###...#...#.........#.#.#
#########################.#.#.#####.###########.#.#.#.#.#.#.#################.###.#.#######.#.###.#.#.#####.#.###.#.###.#.#############.#.#.#
###...###...#.............#.#.#...#.......#...#.#.#.#...#.#.................#...#.#...###...#...#.#.#.....#.#.#...#.....#.#.............#.#.#
###.#.###.#.#.#############.#.#.#.#######.#.#.#.#.#.#####.#################.###.#.###.###.#####.#.#.#####.#.#.#.#########.#.#############.#.#
#...#.....#...#.......#...#.#...#.........#.#.#.#.#.....#.#...###...........###...###...#.....#.#.#.#...#...#...#.........#.............#.#.#
#.#############.#####.#.#.#.###############.#.#.#.#####.#.#.#.###v#####################.#####.#.#.#.#.#.#########v#####################.#.#.#
#.........#...#.#.....#.#.#.#...#.........#.#.#.#...#...#.#.#...>.>.###...###...#...###.#...#.#.#.#.#.#...#...#.>.>.......#.............#...#
#########.#.#.#.#.#####.#.#.#.#.#.#######.#.#.#.###.#.###.#.#####v#.###.#.###.#.#.#.###v#.#.#.#.#.#.#.###.#.#.#.#v#######.#.#################
#...#...#...#...#...###.#.#...#.#.#.......#.#.#.###...###...#...#.#.#...#...#.#.#.#.#.>.>.#...#.#.#.#...#.#.#...#.#.......#.........###.....#
#.#.#.#.###########v###.#.#####.#.#.#######.#.#.#############.#.#.#.#.#####.#.#.#.#.#.#v#######.#.#.###.#.#.#####.#.###############.###.###.#
#.#.#.#...###...###.>...#...###...#.#...#...#.#...#...#...#...#.#.#.#.....#...#...#...#.....#...#.#.#...#...#...#.#.#...###...#...#...#.#...#
#.#.#.###.###.#.###v#######.#######.#.#.#.###.###.#.#.#.#.#.###.#.#.#####.#################.#.###.#.#.#######.#.#.#.#.#.###.#.#.#.###.#.#.###
#.#.#...#.#...#.#...#.......#...###.#.#.#.#...#...#.#...#...#...#.#.#...#.#...........#...#.#.....#.#.#.......#.#.#.#.#...#.#.#.#.....#.#.###
#.#.###.#.#.###.#.###.#######.#.###v#.#.#.#.###.###.#########.###.#.#.#.#.#.#########.#.#.#.#######.#.#.#######.#.#.#.###.#.#.#v#######.#.###
#.#.#...#.#...#.#...#...#.....#...>.>.#.#.#.....###.........#...#.#...#...#.........#...#.#.......#.#.#.#.....#...#...###.#.#.>.#.......#...#
#.#.#.###.###.#.###.###.#.#########v###.#.#################.###.#.#################.#####.#######.#.#.#.#.###.###########.#.###v#.#########.#
#.#.#...#.#...#.....###.#.#.......#...#.#.....#...........#...#.#...#.........#...#.....#.#.......#...#...###...#...#...#.#.###...#.........#
#.#.###.#.#.###########.#.#.#####.###.#.#####.#.#########.###.#.###.#.#######.#.#.#####.#.#.###################.#.#.#.#.#.#.#######.#########
#.#.....#.#...........#...#...###.....#...#...#.........#.#...#.....#.......#...#...#...#.#.......#...#.....###...#...#.#.#.#.......###.....#
#.#######.###########.#######.###########.#.###########.#.#.###############.#######.#.###.#######.#.#.#.###.###########.#.#.#.#########.###.#
#...#...#...#.........#.......#...###...#.#.#...#.......#...#...###.....###.......#.#...#.#...#...#.#...#...#.......#...#.#.#.....#...#.#...#
###.#.#.###.#.#########.#######.#.###.#.#.#.#.#.#.###########.#.###.###.#########.#.###.#.#.#.#.###.#####.###.#####.#.###.#.#####.#.#.#.#.###
###...#...#...#...#...#.........#.#...#.#...#.#.#.............#...#...#.#.........#.....#...#...###.....#.....#...#.#...#...#...#...#...#...#
#########v#####.#.#.#.###########.#.###.#####.#.#################.###.#.#.#############################.#######.#.#.###.#####.#.###########.#
#.......#.>.#...#.#.#.#...........#...#.#...#.#.#...#.............#...#.#...........#.....#.....###...#.........#.#...#.#.....#...#...#.....#
#.#####.#v#.#.###.#.#.#.#############.#.#.#.#.#.#.#.#.#############.###.###########.#.###.#.###.###.#.###########.###.#.#.#######.#.#.#.#####
#.....#...#.#.#...#.#.#.........#...#.#.#.#.#.#.#.#.#.........#...#.#...#####.......#...#.#.#...#...#.#.........#...#...#.....###...#.#.....#
#####.#####.#.#.###.#.#########.#.#.#.#.#.#.#.#.#.#.#########.#.#.#.#.#######.#########.#.#.#.###.###.#.#######.###.#########.#######.#####.#
#.....#...#...#...#.#.###.......#.#.#.#.#.#.#.#.#.#.#.........#.#.#.#...#.....#...#...#.#.#.#.###...#.#.......#...#...###...#.......#.#...#.#
#.#####.#.#######.#.#.###.#######.#.#.#.#.#.#.#.#.#.#v#########.#.#.###.#.#####.#.#.#.#.#.#.#.#####.#.#######.###.###.###.#.#######.#.#.#.#.#
#.......#.#.....#...#...#.....###.#.#.#.#.#.#.#.#.#.>.>.....#...#.#...#.#.......#.#.#.#.#.#.#...#...#.#...#...###.....#...#.#.......#...#.#.#
#########.#.###.#######.#####.###.#.#.#.#.#.#.#.#.###v#####.#.###.###.#.#########.#.#.#.#.#.###.#.###.#.#.#.###########.###.#.###########.#.#
#...#...#.#...#.........###...#...#.#.#.#.#.#.#...###...#...#...#.###.#.#...#.....#.#.#.#.#.#...#...#.#.#.#.###...#...#...#.#.....#...###...#
#.#.#.#.#.###.#############.###.###.#.#.#.#.#.#########.#.#####.#.###.#.#.#.#v#####.#.#.#.#.#.#####.#.#.#.#v###.#.#.#.###.#.#####.#.#.#######
#.#...#.#...#.#...#...#...#...#...#.#.#...#.#.#.........#.....#.#...#.#.#.#.>.>.#...#.#.#.#.#.#...#.#.#.#.>.>.#.#.#.#.###.#.#.....#.#.......#
#.#####.###.#.#.#.#.#.#.#.###v###.#.#.#####.#.#.#############.#.###.#.#.#.###v#.#.###.#.#.#.#.#.#.#.#.#.###v#.#.#.#.#.###.#.#v#####.#######.#
#.....#.....#...#.#.#.#.#.#.>.>...#.#...###...#.............#.#.###.#.#...#...#.#.###.#.#.#.#.#.#...#...#...#.#.#.#.#.#...#.>.###...#.......#
#####.###########.#.#.#.#.#.#v#####.###.###################.#.#.###.#.#####.###.#.###.#.#.#.#.#.#########.###.#.#.#.#.#.#####v###.###.#######
#...#.....#.....#.#.#.#.#...#.....#.....#...#...............#...###...#...#.###...#...#.#...#...###...#...###.#.#.#.#.#.#.....###.#...###...#
#.#.#####.#.###.#.#.#.#.#########.#######.#.#.#########################.#.#.#######.###.###########.#.#.#####.#.#.#.#.#.#.#######.#.#####.#.#
#.#.......#.#...#.#.#.#.#.........#.......#.#...........###...#.........#.#.......#.#...#...........#...#...#.#.#.#.#...#...#...#.#.#...#.#.#
#.#########.#.###.#.#.#.#.#########.#######.###########.###.#.#.#########.#######.#.#.###.###############.#.#.#.#.#.#######.#.#.#.#.#.#.#.#.#
#...........#.###...#...#...........#...#...###.......#.....#.#.........#.........#...###.................#.#.#.#.#...#...#...#...#...#...#.#
#############.#######################.#.#.#####.#####.#######.#########.###################################.#.#.#.###.#.#.#################.#
#.......#...#...#...................#.#...#...#.....#.....#...#.....#...#.......#.....#...#.................#.#.#.....#.#.......#...#.....#.#
#.#####.#.#.###.#.#################.#.#####.#.#####.#####.#.###.###.#.###.#####.#.###.#.#.#.#################.#.#######.#######.#.#.#.###.#.#
#.....#...#.....#.....#.....#.....#.#...###.#.#####.....#...###...#.#.....#.....#.#...#.#.#.....#.........###...###...#...#...#.#.#...###...#
#####.###############.#.###.#.###.#.###.###.#.#########.#########.#.#######.#####.#.###.#.#####.#.#######.#########.#.###.#.#.#.#.###########
#.....#.............#.#.#...#.#...#.....#...#...#...###.......#...#.###...#.......#.....#.....#...###.....#.....#...#.###...#.#.#...........#
#.#####.###########.#.#.#.###.#.#########.#####.#.#.#########.#.###.###.#.###################.#######.#####.###.#.###.#######.#.###########.#
#...#...#...........#...#.....#.......#...#.....#.#...........#...#...#.#.......#.............#.....#.....#.#...#.#...#...#...#.............#
###.#.###.###########################.#.###.#####.###############.###.#.#######.#.#############.###.#####.#.#.###.#.###.#.#.#################
#...#.#...#.......#...###.............#...#...#...#.........#...#.#...#.......#.#.....###.....#...#.......#.#.....#.###.#.#...#.........#...#
#.###.#.###.#####.#.#.###.###############.###.#.###.#######.#.#.#.#.#########.#.#####.###.###.###.#########.#######.###.#.###.#.#######.#.#.#
#.....#...#.#.....#.#...#.......###...###...#.#.....###.....#.#.#.#.#...###...#.......#...#...###.........#.#.....#...#.#...#...#.....#...#.#
#########.#.#.#####.###.#######.###.#.#####.#.#########v#####.#.#.#.#.#.###v###########.###.#############.#.#.###.###.#.###.#####.###.#####.#
#.........#.#...###...#.#...#...#...#...#...#.#...#...>.>.#...#.#.#.#.#.#.>.>.#...#...#.#...#...###.......#.#...#.....#.#...#.....###.......#
#.#########.###.#####.#.#.#.#.###.#####.#.###.#.#.#.#####.#.###.#.#.#.#.#.###.#.#.#.#.#.#.###.#.###.#######.###.#######.#.###.###############
#.#...#...#.###...###.#.#.#.#...#.....#.#...#.#.#.#...###.#...#.#.#.#.#.#.###...#.#.#.#.#...#.#...#.....###...#.#.....#.#...#.........###...#
#.#.#.#.#.#.#####.###.#.#.#.###v#####.#.###.#.#.#.###.###.###.#.#.#.#.#.#.#######.#.#.#.###.#.###.#####.#####.#.#.###.#.###.#########.###.#.#
#.#.#.#.#.#...###...#.#.#.#.#.>.>...#.#...#.#.#.#.#...#...#...#.#.#...#.#.#...#...#.#.#.#...#.#...#...#.#...#.#.#.#...#.#...#...#...#.#...#.#
#.#.#.#.#.###.#####.#.#.#.#.#.#####.#.###.#.#.#.#.#.###.###.###.#.#####.#.#.#.#.###.#.#.#.###.#.###.#.#v#.#.#.#.#.#.###.#.###.#.#v#.#.#.###.#
#.#.#.#.#...#.#.....#.#.#.#.#.....#.#.#...#.#.#.#.#.###...#.###.#.#.....#.#.#...#...#.#.#...#.#...#.#.>.>.#.#.#.#.#...#.#.#...#.>.#...#...#.#
#.#.#.#.###.#.#.#####.#.#.#.#####.#.#.#.###.#.#.#.#.#####.#.###.#.#.#####.#.#####.###.#.###.#.###.#.#######.#.#.#.###.#.#.#.#####v#######.#.#
#...#...###...#.......#...#.......#...#.....#...#...#####...###...#.......#.......###...###...###...#######...#...###...#...#####.........#.#
###########################################################################################################################################.#
"""
