let mainInput = """
.###...##
##..#....
##..#..#.
......###
#..##..##
######.#.
.#.###..#
#####.#.#
##..#..##
##..#..##
#####.#.#
.#.###..#
######.#.
#..##..##
......###
##..#..#.
##..#....

.#....#..#...
#..##..##....
...##...#.##.
...##...###.#
.##..##.#.#.#
.##..##.#.###
...##...###.#

....#.##..##.
....##......#
.##.##......#
#..####.##.##
####....##...
#..##..#..#..
.##.####..###
#..###..##..#
####..#.##.#.
....###....##
.....#..##..#
.....##...###
....#.#....#.

.######..##..##
.#.##.#.####.##
.#.##.#.####..#
.######..##..##
.#....#.#..#.##
########...#...
..####.........
..#..#..##.###.
#.#..#.#..####.

..#.#.##.##.#
##.#.#.#..##.
....##..##.#.
..#..###...#.
#.###..#....#
..###..#.#.##
#..#.####..##
....#.######.
#.##.....#.#.
..##.########
..##.##.#####
###.##.####..
###.##.####..
..##.##.#####
..##.########

#.#######
....#####
..##.....
.#.######
.#..#....
#........
..#...##.
#.###....
###.##..#
.########
#.##.#..#
.#.###..#
..###....
..###....
...###..#

#.##.######.##.##
###...####...####
....##.##.##.....
#..#.#....#.#..##
.....##..##......
#.#.###..###.#.##
.##.#.####.#.#...
.#..#......#..#..
.####.####.####..
###...####...####
#.##........##.##
.#....#..#....#..
..###.####.###...

.##.#.....#..
......#...###
.##..#..#....
.##.##..#....
.......#...##
.##..#.##...#
.....####..##
#..#.#..#####
####.#.#.####
.##.#.##..#..
.##.#####.#..
#..#.##..##..
####.###..#..

##.#...#..#
##.#...#..#
###....#..#
####.####.#
.###..#.##.
###...##.##
#...###.#..
#...###.#..
###...##.##
.###..#.##.
####.####.#
###....#..#
##.##..#..#

.#.##..#..###.###
#..#..##.########
..##..#.#...#####
.#...#..##....##.
#.####......##.##
#.#...##.#.###...
#.#...##.#.###...

.#..###..###..#
.#..#.####.#..#
#.##.##..##.##.
..##.#.##.#.##.
##..##....##..#
#.##...##...##.
..##..#..#..##.
#.##..####..##.
#....##..##....
.##############
###.###..###.##
#####.#..#.####
#######..######
.#..#.####.#..#
#....#.##.#....

....#..########..
...#....######...
.......#.####.#..
####.##.#.##.#.##
.##.##..#....#..#
..#.####..##..###
...#..#..#..#..#.

##..##..######.
##..##..##..##.
#.#.##.#.#..#.#
###....########
##.......####..
.##....##....##
.#.#..#.#....#.
####..#########
###.##.###..###
.########....##
..######..##..#

###..............
.######.####.####
.#..##.######.##.
##.....#.##.#....
..#####.#..#.####
#.#....######....
##..##.######.##.
###.##..#..#..##.
...##############
.#....#.#..#.#...
#.#..............

#.##.#...##...#
#############.#
#.##.#.#....#.#
..##..##....##.
..##..########.
#.##.#..#..#..#
.#..#.###..###.
.####.#......#.
#.##.#.##..##.#
........#..#...
.####..######..
........#..#...
........####...
.####.##....##.
..##..##....##.

#.##....##.#.
#....##....#.
###......###.
###......###.
#....##....#.
#.##....##.#.
#.#......#.##
.#..####....#
.#...##...#.#
.##......##.#
...######...#
###.####.###.
...######...#
##.##..##.###
.####..####..

..###..#..#...#
..###..#..#...#
#.##..##..#.#.#
..#..#....##..#
##..##.##.#####
....####.#....#
##..#..#.##...#
.#...#####..##.
.#...#####..##.
##..#..#.##.#.#
....####.#....#

...##.#..##
..#.##.####
..#.###....
######.##..
...#.#..#..
...#.....#.
##..#...###

#....##..####..
......#.##..##.
.####..#####..#
#######.##..##.
.#..#...######.
##..##..#..#..#
##..##..#..#..#
.#..#...######.
#######.##..###
.####..#####..#
......#.##..##.
#....##..####..
#....###..#.###
#....#.##...#..
.#..#..##..##.#
##..#######..#.
.####...#.##..#

...#.#...
###....#.
..###.###
...##.###
###....#.
...#.#...
###....##
###..#...
##....##.
..#.#.#..
####.##.#
..#####..
##.##.##.
##.#.#..#
....##..#

#...#.##.
#.#..####
....#####
##.#.....
.##.##..#
.##.#####
.#.#..##.
#...#....
.#.#.....
.####.##.
.####.##.
.###.....
#...#....

#.####.###......#
########.#.####.#
#..##..##...##...
##.##.##.........
#......##.######.
....#.....#....#.
#..##..#....##...
#.#..#.##..####..
.##..##.#.######.
..####....#.##.#.
..#..#..##......#
#.####.###.####.#
.##..##..#..##..#

.......#.#.#..##.
.##....#..##.#...
..#.#.#.##..#.##.
.####.#####.##...
#.#..#...####.#.#
..#..####.#.#.###
..#..####.#.#.###
#.#..#...####.#.#
.####.#####.##...
..#.#.#.##..#.##.
.##....#..##.#...
.......#.#.#..##.
######.....#.##.#
.###.###..##.#...
.###.####.##.#...

######..#..
##..#..####
##.#.#.###.
..###..##.#
..#....##..
...#..##...
....#....#.
....#....#.
...#..##...
..#....##..
..###..##.#
##.#.#.##..
##..#..####

....#.##.##.#.###
...#..#.#...#....
..##..#.#...#....
....#.##.##.#.###
########.##.##.#.
#.##.....##...#..
.#..#....##.#....
.#.#..##.#.#.##.#
#####.#...##...##
#.#######...##...
##..#.##.#.##.###
#..#......##..#.#
#..#......##..#.#
##..#.##.#.##.###
#.#######...##...
#####.#...##...##
.#.#..##.#.#.##.#

..####..#.#.....#
##.#.#..#.#...#..
#####.#.#.#.#..##
.###...##..##.#..
##..#....##..#.#.
##..#....##..#.#.
.###...##..##.#..
#####.#.#...#..##
##.#.#..#.#...#..
..####..#.#.....#
..####..#.#.....#

..####..####....#
##..#....#..####.
.##........##..##
.....####........
#.##.####.##.##.#
##...####...####.
...#..##..#......
####.#..#.#######
##....##....####.
.#....##....#..#.
.#.##.##.##.#..#.
.#####..#####..##
##.#.#....#.####.
##..######..####.
..##.#..#.##....#

.##.##..##..#
#..#.........
#.##..##..##.
###..########
######......#
..#..########
..##.########
..#.#########
..###.##..##.
.##..#..##..#
#####.##..##.
.#...........
.#.##.##..##.
#..##.##..##.
..###########
###..########
##.#.#..##..#

....##....##.
####.#.##.#.#
..####....###
...##.#..#.##
..##..####..#
..###########
.......##....
#####.#..#.##
######....#.#

....##.#.#.##.#
....#######..##
##.#..#..#....#
###....###....#
...#...#...##..
..####....####.
...#.#.#.##..##
###......##..##
......#....##..
##.###.####..##
..#..##...#....
..#..#...#.##.#
##.#.#.....##..
##.#.##...####.
...#..#.#......
#####.####....#
##.###.##.#..#.

#.#....#.##..
##.#..#.##...
#.######.#...
.##.##.##....
#........#.#.
##.####.###..
....##.....##
##......###..
..######...##

...###.#.#.#.
#..#.##..#.#.
#.###..#.##..
#.#..###.....
#.#..###.....
#.###..#.##..
#..#.##..#.#.
...###.#.#.#.
##.##.#.###..
....#.###...#
#.#####.#.#..
#.#####.#.#..
....#..##...#

....####...#...
....#.....#.#.#
.....##...##...
..#..#..#.#..##
###..#..#.#####
##.##..##......
##..#.#.#.#.#..
....#.####.....
####.####.#.#..
..###.###...###
#######....##..
###.....####...
###..#....#.#..

..####.
###.#..
.#..###
..#.#..
####.##
#.#.#..
#.#....
.##.###
..#..##
..#..##
.##.###

##.######.###
.##########..
..#......#...
#.##.##.##.##
###......####
.#.##..####..
..########...
..#.#..#.#...
#..#.##.#..##

.##.#...##.
#.##.#.##..
#.##.#.##..
.##.#...##.
#..#.#..###
.####.###.#
...#..###..
####.#.####
###.##...##
#...#..####
##.##.....#
####.#..#..
####.#..#..
##.##.....#
#..##..####

###.#...####...#.
.###.#.#....#.#.#
#.###..##..##..##
###.#..........#.
###.#..........#.
#.###..##..##..##
.###.#.#....#.#.#
###.#...####...#.
.###...####.#...#
#..#.#..####..#.#
....##.#.##.#.##.
#.#..####..####..
##.#.#.##..##.#.#
####..#..##..#..#
..####..#..#..###
#.###..#.##.#..##
##.##..##..##..##

..##.....
###...##.
#..#.####
..##..##.
#.#.#.##.
#.#.#.##.
..###.##.
#..#.####
###...##.
..##.....
.##...##.

..##.##.###..#.
..##.##.###..#.
#.##.###.#.##.#
..###...#.##.#.
.##....##..##..
.###.######....
...####..###.##
#####.##.###.##
###..#.###.....
###.#..#.##.#..
..#..#....#.##.
###.#.##.##....
##.##....##..##
##.##....###.##
###.#.##.##....
..#..#....#.##.
###.#..#.##.#..

##.#..#...#
..###...#..
....#.#####
..#.###.##.
#######..##
###...#..#.
....###..##
..#.###..##
###...#..#.

...#.##..##.#
...#.##..##.#
#..#..#..##.#
..#.#.####.#.
..#.########.
.#.#........#
.###..####..#

#..#.#####.##..
........#...###
#####.##.#.####
#####...##.....
....#.#..######
..#.####..###..
.##.#..##.###..

#...####.
#.##.##.#
#..######
...#.##.#
...#.##.#
#..######
#.##.##.#
#...####.
#.#.#..#.
..#.#..#.
#..#.####
.#.......
..###..##
.#.##..##
.##.#..#.

....####..#
##..#######
##..##.####
....####..#
...##.##..#
.#...######
.####.#.##.
#......#..#
.##...#####
.#..##.....
#......#..#

#.#.#....###.#..#
#...###..#..#####
.#.#..####.##.##.
#.#......#...####
..###.#.##..##..#
..#.#....#.######
#..#.####..######
.##.#..#.###.....
###....#.#....##.
.##.#.###...#####
.##.#####...#####
###....#.#....##.
.##.#..#.###.....
#..#.####..######
..#.#....#.######

#..#...####
.##.###.#..
##.###....#
.....##..##
.....##..##
##.###....#
.##.###.#..
#..#...####
##..#.###..
.......##..
..##.####..
..##.####.#
.......##..

##...#..#...###
###..####..####
.###..##..###..
##.########.###
#..#..##..##.##
###..#..#..####
##.#.#..#.#.###
.#..#.##.#..#..
.#.##....##.#..
#..#......#..##
....#....#.....

.##..#####.
.....##.#..
###.###.#..
####...####
..#...##.##
#...####.##
.#...#.####
##....#....
.#.#.######
....#..#.##
....#..#.##
.#.#.######
##....#....

#.#.#.##.....
#......#####.
.###..#..#.##
.###..#..#.##
#......#####.
#.#.#.##.....
###..##..#.#.
###..##..#.#.
#.#.#.##.....
#......####..
.###..#..#.##

.#.......
#.#######
..##.####
.....#..#
#..##.##.
..#......
#..##....
#.#.##..#
.###.####
.###.####
#.#.##..#
#..##....
#.#......
#..##.##.
.....#..#
..##.####
#.#######

..##.#....#.#
....###..###.
...#...##...#
..##.#.##.#.#
####...##...#
####.#....#.#
####.#....#.#
..###......##
..###....#.##
##....#..#...
##..########.
.....######..
######.##.###

..#.######.
..#..#####.
#...#..#.##
#.#.#..##.#
##..##..#..
.#..###.###
.####.#.#.#
...#.####.#
.#..#####.#
.#..#####.#
...#.####.#
.####.#.#.#
.#..###.###
##..##..#..
#.#.#..##.#
#...#..#.##
..#..#####.

##.#.####
.##.#.#..
.##.#.#..
##.#.####
###.###..
#.#..#.##
#...##...
##.#...##
...##.###
##..#.#..
..##..#..
..#......
#.#.#.#.#

..#.####.#.
###.####.##
....####...
..#.#..#.#.
##..#..#..#
###.####..#
##..#..#..#
..#......#.
..#.#..#.#.
....#..#...
....#..#...
##.#.##.#.#
....####...

#...##..#
...#....#
..#.###.#
#....#...
..##.####
.#.#####.
.###.#...
.###.#...
.#.#####.
.###.####
#....#...
..#.###.#
...#....#
#...##..#
#.#.##.##
###.#..##
###.#..##

###.##.#..##..#
.........#..#..
#.#..#####..###
....#.##.####.#
....#.##.####.#
..#..#####..###
.........#..#..
###.##.#..##..#
##..#.####..###
.#.##.##......#
.##....#.####.#
.#.###...####..
###............
.###...#.#..#.#
#..#..#.##..##.

...####.##.##
.##..##....##
##...#......#
#...#..#..#..
#####.##..##.
###..#..##..#
#..#.##.##.##
#...##.#..#.#
##.#..##..##.
.##..#.####.#
..#..#.####.#

#.#..#.##...#.###
###..#######.#.##
.##..##..#..##..#
.#....#..#...####
.#....#..#...####
.##..##..#..##..#
###..#######.#.##
#.#..#.##...#.###
.#....#.#####...#
.#....#.#....#...
#..##..##...#....
..#..#....#....##
..####..#.##.#..#
.#.##.##...#####.
##.##.###.#.#....

..#...###
.#.#.####
.#.#.####
.##...###
..#....##
..###....
##....###
#..###...
..#.#####

..#######
###.##..#
###...#..
######..#
..####..#
..#.#....
...###..#
##..##..#
..##.#..#
..#.#....
###......
##.######
....#.##.

###.##.#####..##.
.#.####.#.#...##.
.##....##.#..#..#
.###..###.#.#....
.########..#..##.
####..####..#####
..#.##.#......##.
###.##.####..####
##########...####
#.#....#.##..####
.#..#...#.#..####

....#.##.#...
####......###
##.#..##..#.#
####.####.###
####.####.###
##..........#
..#.#.##.#.#.
...######.#..
##.##....##.#

..#.....#
..#.....#
....##.#.
##.#####.
..#..#...
..#...##.
#.#.....#

###..##..####..#.
##..#..#..##.....
.##.#..#.##..####
..##....##..#####
#.#..##..#.######
#.#......#.###..#
##..#..#..#######
..##.##.##..#.##.
####.##.#####....

..##..###.#
..#..#...#.
..###.##..#
..#.#.####.
.#..##..#..
...#.#.##.#
####......#
####......#
...#.#.##.#
.#..##..#.#
..#.#.####.
..###.##..#
..#..#...#.
..##..###.#
#....#..#.#
#....#..#.#
..##..###.#

#...#######
#.#.#######
#....#.####
#....#.####
#.#.#######
#...#######
#.##.##.###
#...#...##.
##.##..##.#
###.####.##
....##.#...

#..####
..###.#
###...#
.#.###.
.##..#.
.##.#..
.####..
.##..#.
.#.###.
###...#
..###.#
#..####
##...#.
##...#.
#..####

....##.##.#####.#
#...##.##....##.#
.###.#####..#####
...####...##...##
#.#.#.###....###.
#######...##...##
.########.##.####
..#.######..#####
#..#..#.######.#.
##..#.##..##..##.
.#..#.##..##..##.
.#.#.###..##..###
....#...##..##...
######.#......#.#
##.#######..#####
##.#######..#####
######.#......#.#

#######......##
...##.########.
#.##...........
#######......##
.#.#..##.##.##.
#.............#
#.#.....####...
##.###........#
##.##.#......#.
...###..#..#..#
.#.##..........
.####..#.##.#..
.####..#.##.#..

.#..#..####.####.
.#####...###.##.#
#.##.#...##......
.####.##...##..##
..##..#.#.#.#..#.
.####.#.#...#..#.
##..##.#..#.####.
.#..#.#.....#..#.
......#....#....#

###...#
###.#.#
#.#####
###...#
...##.#
....##.
####.#.
####.#.
....##.
...##.#
###...#
#.#####
###.#.#

#..##....##..#.#.
#..##....##..#.#.
#.....##.....#.#.
..###.##.###..###
...##....##....#.
.#..#.##.#..#.###
....#....#....#.#
.#....##....#..#.
####.####.#####.#
###.######.###...
..#..#####.#....#
#..#.#..#.#..##.#
..#..#..#..#..##.

##.#..#
##.#..#
#..####
...#...
#.#####
..#..#.
..##.#.
#.#####
...#...
#..####
##.#..#

..##........#
##..###..##..
#.##.##..##.#
......####...
.......##....
.####......##
.#..#.#..#.#.

.#..#..#.##.#
..##.....#..#
.......#...#.
#.##.###.####
#.##.###.####
.......#...#.
..##.....#..#
.#..#..#.##.#
########..###
.#..#.##.####
.####..##..##
.##.#..##.##.
.####.###.##.

#...##...###.#.##
##..####.#.#.##.#
....#..#.....##..
.#..##..#.#.#####
###........##..##
###........##...#
.#..##..#.#.#####
....#..#.....##..
##..####.#.#.##.#
#...##...###.#.##
...##.#.#.......#
##...#..###.###..
##...#..###.###..
...##.#.#.......#
#...##...###.#.##

##.#..##.##.#
#####........
#####........
##.#..##.##.#
..#.#..######
...#.....#...
...#..#..##.#
......##..#.#
..##.###.##.#
#...##.#.##..
.....####...#
#####..##.###
..#.####.###.

###.###.#
##.#.##..
..####...
...#..#.#
....##.#.
###....#.
###.###..
...#...##
..##.###.
..##.###.
...#...##
###.###..
###..#.#.
....##.#.
...#..#.#

..##..#
..##..#
..#...#
.....#.
##..##.
##.#.##
..#...#
#....#.
##.....

.#......#....#...
#........#..#...#
#..####..#..#..##
..........##.....
..#.##.#..##..#.#
.#..##..#....#..#
#..#..#..####..#.
##..##..##..##..#
..#.##.#..##..#.#
.#..##..#....#..#
#..#..#..####..#.
####..##########.
.#.#..#.#....#.#.

####.##
..##...
.#..#..
.####..
.#.....
..###..
..###..
.#.....
.####..
.#..#..
..##...
#.##.##
.#..###
#...#..
...#.##

.#.#..#.#.#####
.###..###.#....
#..#..#..######
..######.......
.#.####.#..####
##..##..#######
#...##...###..#
##......##.####
###.##.#####..#
.##....##.#####
.#.####.#.##...
#.######.######
##..##..###....
..##..##..#....
..#....#...#..#

#.##..##.#.
##########.
###.##.###.
##.#..#.###
...#..#...#
...####...#
....##....#

.....#..##.
..###.#..##
##.#...#.#.
##.....#.#.
..###.#..##
.....#..##.
.......#.##
.###.#.....
.###.#.....

...#.#..##..#
###.....##...
....#.#....#.
#.#....#..#..
#.#....#..#..
....#.#....#.
###.#...##...

##..#.####.#..##.
##..#.####.#..##.
####.#.##.#.####.
#.##........##.#.
.##..######..##.#
####..####..#.##.
..#..........#...
##..###..###..##.
.#..#..##..#..#..
##.##..##..##.###
.####......####..

..##..#.###....##
##..##..#..#..#..
#....######....##
#....#..#........
......##.#..##..#
#....#.###..##..#
#....#.##..#..#..
##..#######.....#
.####..####....##
.#..#..##.######.
#.##.#.##.######.

##.#.#.###..#
...######.#..
..###.#.#....
#.#.###.##.##
#######.#.#..
###...##.#...
.#.#.###.....
###..#.##.###
#####..######
.....#.#..###
.####..#..#..
#.###.##..###
.##.....#..##
.#.#.####....
.#.#.####....
.##.....#..##
#.###.##..###

#.#..###.####.###
#.#..###.####.###
#...###........##
.....#.########.#
.#####.#......#.#
#..#...###..###..
.##.##..#....#..#
#.#....#.####.#..
##...#.########.#
.#.##.#.#.##.#...
..##..###.##.###.

.#..##.##
....##.##
....##.##
.#..##.##
...#..#..
.#.####.#
##.#..##.
#...###.#
.####...#
....#####
#.#.#.#.#

..#..#.......
.#.##...#####
...######..#.
...######..#.
.#.##...#####
..#..#.......
#......#.###.
##..#........
#...##..###.#
##.##.#.#..#.
##.##.#.#..#.
#...##..###.#
##.##........

..####...####.#
...##.##..##...
...##.##..##...
..####...####.#
###...#...#####
.#.#.##.#.#.##.
#####..###.##..
...#.#..#..####
####..#.......#
.#.#.##.#.#..#.
..####.#.......
....#.##.#.#.#.
##..#..#..####.
##..#..#..####.
....#.##.#.#...

#..##.##.##
.#.........
#.##..##..#
#..###..###
###.##..##.
#####.##.##
##..#.##.#.
##..#....#.
.#..#....#.

##.#..#.###
.########..
.########..
##.#..#.##.
..#.##.#...
##......##.
##########.
##..##..##.
.##....##.#

...##...#.#####
.######...#####
#......##...#.#
..#..#..#######
#..###.#.....##
...##..........
...##...####..#
########....##.
##.##.##..##..#
.##..##.##....#
#.#..#.##.#..#.
.#.##.#...####.
.#.##.#...####.

..#..##..#..#...#
#.#..##.#....#.##
##.#...###..###..
##...#..##..##..#
#.###.##.####.##.
###...##..##..##.
######..######..#
######..######..#
###...##..##..##.
#.###.##.####.##.
##...#..##..##..#

#.#.##...#.
#..#.##..#.
#..#...#...
#..#...#...
#..#.##..#.
#.#.##...#.
##..#.##.##
#.##.###.##
###..##...#
#.#.##..##.
#..#.#.####
#..#.#.####
..#.##..##.

..#.#.#.#..#.#.
##.#.#...##...#
...#...#....#..
..#............
###.#..##..##..
......#..##..#.
####.#..#..#..#
###.#..######..
...#...##..##..
..##.##########
##....##....##.
###..#.#....#.#
###.#..#.##.#..
..##..##....##.
...#..#.####.#.
#.#####......##
..#..#...##...#

#..####....
####.######
.......#...
....#...#..
####.......
#..#.....##
#..#...####
#######....
....###.#.#
.........##
.....#.##..
######..###
#..##..##..
#..###.#...
#..#.#.....
#..###.##..
#..#..#.#..

#...##.#.##
#...##.#.##
.###..#.#.#
##.###..#..
..#...##..#
....##.####
##.###.#.#.
##.###...#.
....##.####
..#...##..#
##.###..#..
.###..#.#.#
#...##.#.##
"""
