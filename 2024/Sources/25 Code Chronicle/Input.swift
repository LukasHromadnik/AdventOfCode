let mainInput = """
.....
....#
#...#
#...#
#...#
##.##
#####

.....
#....
##...
##..#
##..#
##.##
#####

#####
.#.##
...##
...##
....#
.....
.....

.....
.....
#..#.
#..#.
##.##
##.##
#####

#####
#####
#####
##.#.
#..#.
.....
.....

#####
#####
.####
.##.#
.#...
.#...
.....

.....
.#.#.
.#.#.
####.
####.
#####
#####

.....
.....
.#...
.#...
.#.#.
.#.#.
#####

#####
#####
#####
.#.##
.#.#.
.....
.....

.....
..#..
#.#.#
#.###
#.###
#.###
#####

.....
.....
#....
##..#
###.#
#####
#####

.....
.....
#.#..
#.##.
#.###
#.###
#####

#####
####.
##.#.
##...
.#...
.....
.....

#####
###.#
.##..
..#..
.....
.....
.....

.....
...#.
#.##.
####.
#####
#####
#####

#####
#####
#####
.###.
.#.#.
.#...
.....

.....
...#.
..##.
#.##.
#.###
#####
#####

#####
#####
.####
.####
.##.#
..#.#
.....

.....
...#.
..###
.####
#####
#####
#####

#####
#.###
#.###
#.#.#
#.#..
.....
.....

#####
.####
.#.#.
.#.#.
.#...
.#...
.....

.....
#.#..
#.#..
###..
####.
####.
#####

.....
.....
.#.#.
.#.#.
##.#.
#####
#####

#####
##.##
##.##
.#.##
.#.#.
.....
.....

.....
...#.
.#.#.
.###.
.###.
####.
#####

#####
#####
####.
.###.
.#.#.
.....
.....

.....
.....
#....
#....
#.#..
#.##.
#####

#####
###.#
###.#
#.#.#
#....
.....
.....

#####
###.#
###.#
#.#.#
..#..
..#..
.....

#####
###.#
##...
#....
#....
.....
.....

#####
#####
.##.#
.##..
.##..
..#..
.....

.....
....#
....#
.#..#
.##.#
.####
#####

#####
#.#.#
#.#.#
#...#
#...#
.....
.....

.....
....#
....#
#...#
##..#
###.#
#####

.....
.....
..#.#
..#.#
..#.#
#.###
#####

#####
.####
.###.
.#.#.
.#...
.#...
.....

.....
..#.#
.##.#
.####
.####
.####
#####

.....
.....
.....
....#
#.#.#
###.#
#####

.....
.....
..#..
..##.
..##.
#.###
#####

.....
#....
#...#
#...#
#..##
#.###
#####

#####
#####
##.##
##..#
##..#
.#..#
.....

.....
#.#..
#.##.
#####
#####
#####
#####

.....
....#
#.#.#
#####
#####
#####
#####

.....
....#
....#
#...#
#.#.#
#.#.#
#####

.....
....#
.#.##
.#.##
##.##
##.##
#####

#####
####.
##.#.
.#.#.
.#.#.
...#.
.....

#####
#.##.
..##.
...#.
.....
.....
.....

#####
#.##.
#.##.
..##.
..##.
...#.
.....

#####
#####
##.##
##..#
#...#
.....
.....

.....
..#..
#.#.#
#.###
#####
#####
#####

.....
.....
#..#.
#..##
##.##
##.##
#####

#####
###.#
#.#..
#.#..
..#..
.....
.....

#####
#####
.##.#
..#.#
..#..
..#..
.....

#####
###.#
##..#
##..#
#....
#....
.....

#####
#####
###.#
#.#..
#....
#....
.....

#####
###.#
#.#.#
#.#.#
..#.#
.....
.....

.....
.....
..#.#
#.#.#
#.#.#
#####
#####

.....
...#.
...#.
..##.
..##.
.###.
#####

.....
.#..#
.#..#
.#..#
##..#
###.#
#####

.....
.#...
.#...
.#.#.
.#.##
.####
#####

.....
.#...
.##..
###..
###.#
###.#
#####

#####
.#.##
....#
.....
.....
.....
.....

#####
#####
##.##
#..#.
#..#.
...#.
.....

#####
##.##
##.##
.#..#
.#..#
.....
.....

.....
.#..#
.##.#
.##.#
.##.#
#####
#####

#####
#####
.#.##
.#..#
.....
.....
.....

.....
.....
..#..
#.#.#
#.###
#.###
#####

.....
....#
....#
#.#.#
#.###
#.###
#####

#####
.####
.####
.###.
.##..
.#...
.....

#####
.#.##
.#.##
.#.##
.#.#.
.#.#.
.....

#####
#####
###.#
.##.#
.##.#
..#..
.....

.....
#..#.
#..#.
#..#.
##.#.
##.#.
#####

#####
#####
.####
.##.#
..#.#
....#
.....

#####
###.#
.##.#
.##..
..#..
.....
.....

.....
.....
.....
..#..
..#.#
.##.#
#####

.....
.#.#.
.#.#.
.#.#.
.#.#.
.###.
#####

.....
.#...
.#...
.#..#
.##.#
#####
#####

#####
##.##
##.#.
.#.#.
...#.
.....
.....

#####
#####
#####
.#.##
.#..#
.#...
.....

#####
####.
#.##.
#.##.
#..#.
#....
.....

.....
.....
#....
#.#.#
###.#
#####
#####

.....
.....
.....
..#.#
#.###
#####
#####

#####
#####
#####
#####
.####
..#.#
.....

.....
.....
....#
#.#.#
#.#.#
#####
#####

.....
#....
#...#
#.#.#
###.#
#####
#####

#####
#.###
#.#.#
#.#.#
....#
....#
.....

.....
.....
#.#..
#.#..
####.
#####
#####

.....
.....
..#..
#.#..
###..
####.
#####

#####
.####
..###
..#.#
..#..
.....
.....

.....
..#..
#.#..
#.#.#
#.#.#
#####
#####

#####
#####
#####
####.
##.#.
#....
.....

#####
#####
###.#
.##.#
..#.#
..#..
.....

#####
#####
#.###
...##
...#.
.....
.....

.....
...#.
#.###
#####
#####
#####
#####

#####
##.##
##.##
.#.#.
.#...
.#...
.....

#####
###.#
###.#
.##..
.##..
.#...
.....

.....
...#.
..##.
#.###
#####
#####
#####

#####
#####
#####
#####
###.#
.#..#
.....

.....
..#..
..#.#
..#.#
.####
.####
#####

.....
#....
#.#..
#.#..
#.#.#
#.###
#####

.....
#.#..
#.#..
#.#..
#.#.#
#####
#####

#####
###.#
.#...
.#...
.....
.....
.....

.....
.....
#.#.#
#.###
#####
#####
#####

.....
..#.#
#.#.#
#.#.#
#.#.#
###.#
#####

.....
#....
#....
#.#.#
#.#.#
#.###
#####

.....
#....
#....
#..#.
#.###
#.###
#####

.....
.....
.....
#....
#....
##.#.
#####

#####
.#.##
.#.##
.#.#.
.#...
.#...
.....

#####
#.###
#.#.#
#....
.....
.....
.....

#####
.####
.###.
.#.#.
.#.#.
.....
.....

.....
..#..
#.#..
#.##.
#.##.
#####
#####

.....
.....
.#.#.
.#.#.
.#.##
##.##
#####

.....
.#...
##..#
###.#
#####
#####
#####

.....
#.#..
#.##.
#.##.
#.##.
#.###
#####

.....
.....
...#.
..##.
#.###
#.###
#####

#####
###.#
##...
.#...
.....
.....
.....

#####
####.
.###.
..##.
..#..
.....
.....

.....
.#...
.#.#.
.#.##
#####
#####
#####

.....
.....
#....
#.#..
###.#
###.#
#####

#####
#.###
#.#.#
.....
.....
.....
.....

.....
....#
#...#
##.##
##.##
#####
#####

#####
#####
#####
#.#.#
..#.#
.....
.....

#####
#.#.#
#.#.#
#.#.#
#.#.#
#....
.....

#####
.####
.#.#.
.#...
.....
.....
.....

.....
.#..#
.#..#
.#..#
.##.#
.####
#####

#####
##.##
##.#.
.#...
.#...
.#...
.....

#####
###.#
###.#
###.#
.#..#
.#..#
.....

.....
....#
#..##
##.##
#####
#####
#####

.....
#....
##...
##.#.
##.#.
#####
#####

.....
.....
.....
..#.#
..#.#
.####
#####

#####
#.###
#..##
#...#
#...#
#...#
.....

#####
.####
..###
..###
..##.
..#..
.....

#####
#####
#.###
#.#.#
#.#.#
....#
.....

#####
#####
###.#
###.#
.#...
.#...
.....

.....
#..#.
#..#.
##.#.
##.##
#####
#####

#####
#.##.
#.##.
..##.
...#.
.....
.....

.....
..#..
#.#.#
#.#.#
###.#
#####
#####

#####
####.
.###.
.###.
.##..
..#..
.....

.....
#.#..
#.#..
#.#..
#.#..
#.#.#
#####

#####
.####
.####
..###
..#.#
.....
.....

#####
##.##
##.##
.#.##
...##
....#
.....

#####
.####
.####
.#.##
.#..#
.....
.....

#####
#####
###.#
###.#
##..#
.#...
.....

.....
..#..
.##.#
###.#
###.#
#####
#####

.....
.#..#
.##.#
###.#
###.#
#####
#####

.....
...#.
#..##
#..##
##.##
#####
#####

#####
#####
####.
.###.
.#.#.
.#.#.
.....

#####
#####
#.###
#.#.#
#.#..
..#..
.....

.....
...#.
#..#.
#..##
#.###
#####
#####

.....
#....
#..#.
##.##
##.##
#####
#####

.....
.....
.....
..#..
.##.#
#####
#####

#####
##.#.
##.#.
##.#.
##.#.
.#.#.
.....

.....
..#.#
..#.#
..#.#
.####
.####
#####

.....
#....
#....
#.#..
####.
#####
#####

.....
.....
.....
.#.#.
####.
#####
#####

.....
..#..
..#..
.##..
.###.
.####
#####

.....
#...#
#.#.#
###.#
#####
#####
#####

#####
#####
#####
#.#.#
#.#..
#.#..
.....

#####
##.##
#..##
....#
....#
....#
.....

#####
####.
.#.#.
.#.#.
.....
.....
.....

#####
#####
###.#
#.#.#
#...#
#...#
.....

#####
##.##
.#.##
.#.##
.#.#.
.....
.....

#####
#####
#####
###.#
#.#.#
#.#.#
.....

#####
####.
###..
#.#..
..#..
.....
.....

#####
##.##
##.#.
#..#.
#....
#....
.....

#####
#.#.#
#.#..
..#..
..#..
..#..
.....

.....
.....
.#...
.#...
.#.#.
.####
#####

.....
.....
#...#
#...#
#...#
#.#.#
#####

.....
.....
...#.
...#.
..###
#.###
#####

#####
####.
###..
#.#..
#.#..
#.#..
.....

.....
.#..#
.#..#
.#.##
.#.##
.####
#####

#####
#####
##.##
#..#.
.....
.....
.....

.....
.....
....#
.#..#
.#..#
###.#
#####

#####
#.##.
#.##.
#..#.
#....
.....
.....

.....
.....
.....
.#.#.
.#.#.
#####
#####

#####
#####
.##.#
.##.#
.#...
.....
.....

#####
##.#.
##.#.
#..#.
#..#.
...#.
.....

#####
.####
..###
..###
...##
....#
.....

#####
#####
###.#
###.#
###..
.#...
.....

.....
.#...
.#..#
.#..#
###.#
#####
#####

.....
.....
.....
.#.#.
.###.
.###.
#####

.....
.....
...#.
#..#.
#..#.
#.##.
#####

.....
.#.#.
.#.#.
.#.#.
####.
####.
#####

#####
.#.##
.#.##
.#..#
....#
....#
.....

.....
....#
...##
.#.##
##.##
##.##
#####

#####
#.###
...##
...##
...#.
...#.
.....

#####
.####
.##.#
..#.#
..#.#
..#.#
.....

.....
.....
..#..
..#.#
.##.#
###.#
#####

#####
##.##
#..##
#..##
#...#
#...#
.....

.....
.#...
.#...
##.#.
##.#.
##.##
#####

.....
....#
#...#
#...#
#..##
#.###
#####

.....
.....
....#
.#..#
##..#
###.#
#####

#####
#.##.
#.##.
#.#..
#....
#....
.....

#####
####.
###..
.#...
.....
.....
.....

.....
.#...
###..
###.#
###.#
###.#
#####

.....
....#
.#..#
.#..#
###.#
###.#
#####

.....
..#..
..#..
..#.#
#.#.#
#.#.#
#####

#####
#####
####.
##.#.
##.#.
.#...
.....

.....
..#..
..#..
..#..
#.#.#
#####
#####

.....
....#
#...#
#...#
##..#
###.#
#####

.....
#...#
#..##
#.###
#.###
#.###
#####

.....
..#..
..#..
..#..
..#..
#.##.
#####

#####
.#.##
...##
...#.
...#.
.....
.....

.....
.#.#.
.#.#.
.#.#.
.#.#.
##.#.
#####

#####
#####
#####
#.###
...##
...#.
.....

.....
....#
....#
..#.#
..###
.####
#####

.....
#....
#....
##.#.
#####
#####
#####

#####
####.
.###.
.#.#.
.#...
.#...
.....

.....
.....
...#.
.#.##
#####
#####
#####

.....
.....
#....
#....
#..#.
#.###
#####

#####
#####
####.
.###.
..##.
...#.
.....

.....
.....
.#...
.#.#.
.#.#.
#####
#####

.....
#....
#....
#..#.
##.#.
##.##
#####

#####
###.#
#.#.#
#.#.#
#....
#....
.....

#####
##.#.
##.#.
##.#.
#....
.....
.....

.....
.#...
.#...
##..#
###.#
###.#
#####

.....
..#..
..#..
..#..
.##..
###.#
#####

.....
...#.
.#.##
.#.##
.#.##
#####
#####

#####
.####
.###.
.#.#.
.#.#.
.#...
.....

#####
#####
##.##
##.#.
#..#.
#....
.....

.....
#....
#...#
#..##
#..##
##.##
#####

.....
.....
.#...
.#.#.
#####
#####
#####

#####
##.#.
.#...
.#...
.#...
.....
.....

.....
...#.
#..#.
#..#.
#.###
#.###
#####

#####
#####
###.#
##..#
##...
#....
.....

.....
#....
#....
#....
#..#.
#.##.
#####

#####
#####
.###.
.##..
.##..
..#..
.....

.....
..#..
#.#..
###.#
#####
#####
#####

#####
#.#.#
#.#.#
#...#
#...#
....#
.....

.....
.....
....#
#.#.#
#.#.#
#.#.#
#####

#####
##.#.
#..#.
#..#.
#..#.
...#.
.....

#####
####.
.###.
.###.
.#.#.
.#.#.
.....

.....
.....
.#...
.#...
###..
###.#
#####

#####
#####
.#.##
.#.##
.#.#.
.#...
.....

#####
.####
..###
..#.#
..#..
..#..
.....

#####
#####
#.###
#.#.#
#.#..
#....
.....

#####
##.##
.#.#.
.#.#.
.#...
.....
.....

#####
##.##
#..#.
...#.
...#.
...#.
.....

.....
..#..
.##..
.###.
.###.
.###.
#####

#####
.####
.####
.###.
.#.#.
.#.#.
.....

#####
####.
###..
##...
#....
.....
.....

#####
.#.##
.#.##
.#.##
.#.##
...#.
.....

.....
...#.
#..##
#.###
#####
#####
#####

.....
...#.
...##
#..##
#..##
#.###
#####

#####
####.
####.
.#.#.
.....
.....
.....

#####
#####
##.##
.#.##
....#
.....
.....

.....
....#
.#..#
.##.#
###.#
###.#
#####

.....
...#.
.#.#.
.#.#.
##.#.
##.##
#####

.....
..#..
#.#..
#.#.#
#.###
#.###
#####

.....
...#.
...#.
#..#.
#.##.
#.###
#####

.....
.#...
.#.#.
.###.
####.
####.
#####

#####
##.##
#..#.
#....
#....
#....
.....

#####
####.
####.
####.
##.#.
.#.#.
.....

#####
####.
.###.
.###.
.###.
.#.#.
.....

#####
.##.#
.##.#
.##..
.#...
.....
.....

.....
...#.
...#.
.#.#.
.#.#.
####.
#####

.....
....#
#.#.#
###.#
###.#
###.#
#####

#####
#####
.####
.#.##
.#.#.
...#.
.....

.....
.#...
.#...
.##..
###.#
#####
#####

.....
.#...
.#...
.##..
.##.#
###.#
#####

.....
...#.
...#.
#..#.
#.##.
#.##.
#####

#####
#####
####.
###..
##...
.#...
.....

#####
.####
..###
..#.#
.....
.....
.....

.....
....#
....#
...##
#.###
#.###
#####

#####
#####
###.#
#.#.#
..#..
..#..
.....

.....
.....
...#.
.#.##
.#.##
.####
#####

#####
####.
.##..
.#...
.#...
.#...
.....

.....
.....
..#..
#.#.#
###.#
###.#
#####

#####
#####
####.
##.#.
##...
#....
.....

#####
.####
.####
.##.#
.##.#
.#..#
.....

.....
.....
.....
#.#..
#.#.#
#####
#####

#####
#.###
#.###
#.###
#..#.
#....
.....

.....
.....
.....
..#.#
.####
.####
#####

#####
#.###
#.###
#.#.#
..#.#
..#..
.....

#####
#####
.####
..###
...#.
.....
.....

#####
#####
#.###
..##.
...#.
...#.
.....

.....
.....
...#.
...#.
...#.
.#.##
#####

.....
.....
.#.#.
.###.
####.
#####
#####

.....
.....
.....
#.#..
#.##.
#.##.
#####

#####
#####
#####
#.###
#..##
...#.
.....

.....
.....
...#.
..##.
.####
.####
#####

#####
#####
####.
####.
.#.#.
...#.
.....

.....
#....
#..#.
#.###
#####
#####
#####

#####
##.#.
.#.#.
.....
.....
.....
.....

#####
###.#
###..
###..
.#...
.....
.....

#####
##.##
##.#.
.#...
.....
.....
.....

.....
.#..#
.#..#
.#..#
.##.#
.##.#
#####

#####
#####
##.##
.#.##
.#.##
...#.
.....

.....
....#
....#
....#
..#.#
#.###
#####

#####
###.#
###.#
#.#..
.....
.....
.....

#####
###.#
###.#
.#..#
.#...
.....
.....

#####
#####
#.###
#.##.
...#.
.....
.....

#####
###.#
.#..#
.....
.....
.....
.....

.....
.....
.....
.#...
.##.#
###.#
#####

.....
...#.
...#.
#..#.
#..#.
##.##
#####

.....
.#...
.#...
.#...
.##.#
#####
#####

#####
.###.
.###.
.###.
.##..
.#...
.....

.....
#....
##...
###..
###..
####.
#####

.....
.....
...#.
.#.#.
.###.
####.
#####

#####
#####
##.##
##.##
#..##
#...#
.....

#####
##.##
##.##
.#.#.
.#.#.
.#.#.
.....

#####
####.
####.
#.##.
#..#.
.....
.....

.....
.....
.....
.#.#.
##.##
##.##
#####

.....
.#...
.#.#.
.#.#.
.#.#.
.####
#####

#####
#.##.
#.##.
#.##.
#.##.
#..#.
.....

.....
.#.#.
.#.##
.#.##
.#.##
.####
#####

.....
.....
...#.
..##.
.###.
####.
#####

.....
.....
..#..
..##.
.####
#####
#####

.....
...#.
...#.
...#.
...##
#.###
#####

.....
....#
#.#.#
###.#
#####
#####
#####

.....
#....
#.#.#
###.#
#####
#####
#####

#####
#.###
#.###
#..##
#...#
#...#
.....

.....
.#...
##...
##.#.
#####
#####
#####

.....
...#.
...#.
#..#.
##.#.
##.##
#####

.....
.....
.#..#
##.##
#####
#####
#####

#####
.#.##
.#..#
.#..#
.#...
.#...
.....

.....
.....
.#...
.#.#.
.#.##
#####
#####

#####
#.###
#.###
#.###
#..#.
...#.
.....

.....
.#...
.##..
.##.#
#####
#####
#####

.....
....#
.#..#
.##.#
#####
#####
#####

.....
.....
.....
.#.#.
.#.#.
.#.#.
#####

#####
.##.#
..#.#
..#.#
..#..
.....
.....

#####
#####
.####
.#.#.
...#.
...#.
.....

#####
####.
#.##.
#.##.
#..#.
...#.
.....

#####
#.#.#
#.#.#
#.#.#
....#
.....
.....

.....
.....
.....
.....
...#.
#.###
#####

#####
###.#
###.#
##..#
#...#
....#
.....

#####
#####
####.
#.##.
#..#.
...#.
.....

#####
##.##
##.##
##.##
#...#
#....
.....

.....
#....
#..#.
#..#.
#.##.
#####
#####

#####
#.###
#.###
#..##
#..#.
#..#.
.....

.....
#..#.
#..#.
#.###
#####
#####
#####

.....
..#..
#.#..
#.#..
#.#.#
#.###
#####

#####
.####
.##.#
.##..
..#..
.....
.....

.....
#....
#....
##.#.
##.#.
#####
#####

#####
##.##
##.##
.#.#.
...#.
...#.
.....

#####
#.###
#.###
#..#.
.....
.....
.....

#####
#.###
#.###
#.###
#.#.#
#....
.....

.....
.....
...#.
#..#.
#.###
#####
#####

.....
#.#..
#.#..
####.
####.
####.
#####

.....
....#
..#.#
..#.#
#.#.#
###.#
#####

#####
##.##
##.##
##.#.
.#.#.
.....
.....

.....
..#..
..#..
.##..
###..
###.#
#####

.....
#..#.
#..#.
##.#.
####.
#####
#####

.....
..#..
..#.#
#.#.#
#.###
#####
#####

#####
#####
.####
.####
.#.##
....#
.....

#####
###.#
###.#
.#...
.#...
.....
.....

#####
#.###
#.#.#
#.#.#
#.#..
..#..
.....

.....
#...#
#...#
#..##
#..##
##.##
#####

.....
.....
..#..
..#..
.##..
####.
#####

#####
#####
.##.#
.##.#
.#...
.#...
.....

#####
.#.##
.#.##
.#.##
.#.#.
.#...
.....

#####
.####
.#.##
...##
....#
....#
.....

.....
.....
..#..
#.#..
#.##.
####.
#####

#####
###.#
###..
.#...
.#...
.#...
.....

#####
##.#.
.#.#.
...#.
.....
.....
.....

#####
#####
###.#
#.#.#
#....
.....
.....

.....
#....
#...#
#.#.#
#.#.#
###.#
#####

#####
#.###
#.##.
#.##.
#..#.
.....
.....

.....
...#.
..##.
..##.
.###.
#####
#####

.....
....#
....#
#.#.#
###.#
#####
#####

.....
.....
.....
#....
#.#.#
#.###
#####

.....
...#.
.#.#.
.#.#.
##.##
##.##
#####

.....
.....
#.#..
#.#..
#.#..
###.#
#####

.....
#....
#.#.#
#.###
#.###
#.###
#####

.....
....#
.#..#
.##.#
.####
#####
#####

#####
####.
#.##.
..#..
.....
.....
.....

.....
..#.#
..#.#
..#.#
..#.#
#.###
#####

.....
.....
#.#..
#.##.
#.###
#####
#####

.....
....#
.#..#
##..#
##.##
##.##
#####

.....
#.#..
###..
###..
####.
####.
#####

.....
.....
..#.#
..###
#.###
#####
#####

#####
####.
###..
.##..
..#..
.....
.....

.....
.....
.....
...#.
...#.
#.##.
#####

#####
.####
.####
.####
.##.#
.#...
.....

.....
.....
#....
#.#..
#.#.#
#####
#####

#####
#####
##.##
##.##
##.#.
#..#.
.....

.....
...#.
...#.
..###
#.###
#####
#####

.....
.....
...#.
.#.#.
.####
.####
#####

#####
####.
#.##.
..##.
..##.
..#..
.....

#####
#####
.##.#
.#...
.....
.....
.....

.....
.#...
.##..
.##..
.###.
.###.
#####

.....
..#.#
.##.#
.##.#
.##.#
###.#
#####

#####
####.
.###.
..#..
.....
.....
.....

#####
#.###
#.##.
#.##.
..##.
...#.
.....

#####
###.#
###.#
#.#.#
#...#
....#
.....

#####
####.
#.##.
...#.
.....
.....
.....

.....
#....
#....
#....
#..#.
##.#.
#####

#####
##.#.
.#.#.
.#.#.
.#.#.
.#.#.
.....

.....
.....
.#.#.
.#.#.
.####
.####
#####

.....
.#...
.#...
.#.#.
##.#.
##.#.
#####

.....
.....
.....
#..#.
##.#.
####.
#####

#####
#####
##.##
#..##
...##
...#.
.....

#####
.##.#
.#...
.....
.....
.....
.....

.....
#....
#.#..
#.#..
#.#..
###.#
#####

.....
.....
.#...
.#.#.
.#.##
.#.##
#####

#####
#####
###.#
###.#
###.#
#.#.#
.....

#####
#####
####.
#.##.
...#.
...#.
.....

.....
.....
.#...
.##..
###.#
#####
#####

#####
.###.
.###.
.#.#.
.#.#.
...#.
.....

#####
#####
#####
.#.##
.#.##
.#.#.
.....

#####
#####
#.###
#.###
..###
..#.#
.....

#####
.#.##
.#.##
.#.#.
.#.#.
.....
.....

#####
#.#.#
#.#.#
..#.#
....#
.....
.....

#####
#.###
#.###
#.##.
...#.
.....
.....

#####
#####
#####
##.#.
##...
#....
.....

.....
.#..#
.#..#
##..#
###.#
###.#
#####

#####
#####
#.###
#.###
#.###
#.#.#
.....

#####
#.#.#
#.#..
#.#..
#.#..
#.#..
.....

#####
#####
##.##
.#.##
.#..#
.....
.....

#####
.##.#
.#..#
.#...
.#...
.....
.....

#####
##.##
##.#.
.#.#.
.#.#.
.....
.....

#####
.####
.###.
.##..
.##..
..#..
.....

#####
#.#.#
#.#.#
#.#.#
#...#
#...#
.....

#####
###.#
###.#
.##.#
.##.#
.#..#
.....

.....
..#..
.##..
####.
####.
#####
#####

#####
.##.#
.##.#
.##.#
.##.#
..#.#
.....

.....
.#..#
.#..#
###.#
###.#
#####
#####

.....
...#.
.#.#.
.###.
.###.
#####
#####

#####
#.###
#.###
..#.#
..#.#
.....
.....

#####
####.
#.#..
#.#..
..#..
.....
.....

#####
.####
.#.#.
...#.
.....
.....
.....

#####
.##.#
..#.#
..#.#
....#
.....
.....

.....
...#.
...#.
#.###
#.###
#.###
#####

.....
.....
.#...
.#..#
###.#
###.#
#####

#####
#.###
#.###
#..#.
...#.
.....
.....

#####
##.##
##.##
##.##
.#.##
.#..#
.....

#####
#####
####.
##.#.
.#...
.....
.....

#####
####.
####.
###..
.#...
.....
.....

#####
###.#
###.#
###.#
##..#
#...#
.....

.....
.#..#
.#..#
##..#
###.#
#####
#####

#####
#.###
..###
..###
...##
....#
.....

#####
####.
#.##.
#.##.
...#.
...#.
.....

#####
#####
#####
###.#
.##.#
.#..#
.....

.....
.#...
.#...
.##..
.###.
.####
#####

#####
.####
.####
.##.#
.#..#
.....
.....

.....
.....
.....
...#.
#..#.
##.#.
#####

.....
#.#..
###..
###..
###.#
#####
#####

#####
.#.##
.#.##
...#.
.....
.....
.....

.....
...#.
...#.
...##
#.###
#####
#####

.....
#..#.
#.##.
#.###
#####
#####
#####

.....
.....
....#
...##
#.###
#.###
#####

.....
....#
...##
#..##
##.##
##.##
#####

#####
#####
###.#
#.#.#
#.#.#
....#
.....

#####
###.#
#.#.#
#.#.#
#.#.#
..#.#
.....

#####
#####
.#.##
.#..#
.#...
.....
.....

#####
#.###
#..##
#..##
...#.
...#.
.....

.....
.....
#..#.
##.##
#####
#####
#####

#####
#.##.
#..#.
...#.
.....
.....
.....

.....
.....
.....
#....
#.#..
#.#.#
#####

.....
..#..
..#..
.##..
.##..
.##.#
#####

.....
....#
....#
#...#
#.#.#
###.#
#####

#####
.###.
.###.
.###.
..##.
...#.
.....

.....
..#.#
.##.#
.##.#
###.#
###.#
#####

#####
###.#
#.#.#
#.#.#
..#.#
..#.#
.....

#####
#####
.#.#.
...#.
...#.
...#.
.....

.....
#.#.#
#.###
#.###
#.###
#####
#####

.....
.#...
.#...
##...
###..
####.
#####

.....
..#..
#.#..
#.#.#
#.###
#####
#####

.....
.#...
.#...
.#..#
###.#
#####
#####

.....
....#
...##
..###
.####
.####
#####

.....
#....
#....
#....
#.#.#
#.#.#
#####

#####
#.##.
#.##.
...#.
...#.
.....
.....

.....
.#...
.#.#.
.#.#.
##.##
##.##
#####

#####
#####
#.###
..#.#
.....
.....
.....

#####
###.#
.##.#
..#..
.....
.....
.....

.....
....#
...##
#.###
#.###
#####
#####

#####
###.#
.##.#
.##.#
.#..#
.#...
.....

#####
#.###
#.###
#..##
#..#.
.....
.....

.....
.#.#.
##.##
##.##
##.##
##.##
#####

#####
####.
####.
####.
.#.#.
...#.
.....

#####
###.#
.##.#
.#...
.....
.....
.....

#####
#####
#####
#####
.##.#
..#.#
.....

#####
.####
.#.##
...#.
.....
.....
.....

#####
#.###
..###
..#.#
..#..
.....
.....

.....
#....
#....
##.#.
##.#.
##.#.
#####

.....
.....
.#...
.#...
.#...
##.#.
#####

.....
.....
..#..
.##.#
.##.#
.####
#####

#####
##.##
##.##
#..##
#..#.
#..#.
.....

.....
#...#
#..##
##.##
#####
#####
#####

.....
.....
...#.
.#.#.
.####
#####
#####

.....
...#.
...#.
..##.
.####
.####
#####

#####
##.##
##.##
#..##
#..##
...#.
.....

.....
.#...
.#...
.#...
.##..
###.#
#####

#####
#####
#####
.#.##
.#.#.
.#...
.....

.....
#...#
#...#
#.#.#
#.###
#.###
#####

#####
#####
#.#.#
#...#
.....
.....
.....

.....
..#..
..#..
..#.#
#.###
#####
#####

#####
#.##.
#.##.
#..#.
#..#.
.....
.....

#####
#####
#.###
#.#.#
....#
.....
.....

.....
.....
..#.#
.##.#
#####
#####
#####

#####
.#.##
.#.##
.#.#.
.#...
.....
.....

.....
..#.#
#.#.#
###.#
###.#
#####
#####

.....
...#.
#..#.
##.##
#####
#####
#####

#####
.###.
..#..
..#..
.....
.....
.....

.....
....#
....#
.#.##
.#.##
.#.##
#####

.....
#....
##...
##.#.
##.#.
##.##
#####

.....
.#.#.
.#.#.
#####
#####
#####
#####

#####
###.#
##..#
#...#
#...#
.....
.....

#####
.####
.####
.##.#
..#..
..#..
.....
"""
