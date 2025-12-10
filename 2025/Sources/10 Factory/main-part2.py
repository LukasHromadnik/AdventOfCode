import re
from pulp import LpProblem, LpVariable, LpMinimize, LpInteger, lpSum, PULP_CBC_CMD

def parse_line(line: str) -> dict:
    # kulaté závorky
    round_brackets = re.findall(r"\(([^)]*)\)", line)
    indices = [
        tuple(map(int, item.split(","))) if "," in item else (int(item),)
        for item in round_brackets
    ]

    # složené závorky
    curly = re.search(r"\{([^}]*)\}", line)
    values = (
        list(map(int, curly.group(1).split(",")))
        if curly else []
    )

    return {
        "indices": indices,
        "values": values
    }

s = """[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
[...#.#..#] (0,3,4,5,6,7,8) (1,4,6,8) (1,6) (1,2,3,4,5,6,8) (1,2,3,4,5,7,8) (2,3,4,5,8) (0,1,3,7) (0,1,4,5,6) {27,78,35,46,74,54,64,20,58}"""

result = 0

f = open("input.txt", "r")
s = f.read()
for line in s.splitlines():
    input = parse_line(line)

    constraints = [[0] * len(input["indices"]) for _ in range(len(input["values"]))]

    for i in range(len(input["indices"])):
        for j in range(len(input["indices"][i])):
            c = input["indices"][i][j]
            constraints[c][i] = 1

    costs = [1] * len(input["indices"])
    A = constraints
    b = input["values"]

    # příkladová data
    #costs = [3, 5, 2]  # koeficienty v cíli
    #A = [
    #    [2, 1, 0],   # 2x0 + 1x1 + 0x2 >= 8
    #    [1, 3, 1],   # 1x0 + 3x1 + 1x2 >= 10
    #]
    #b = [8, 10]

    n = len(costs)
    m = len(A)

    problem = LpProblem("MinILP_EqualConstraints", LpMinimize)

    x = [LpVariable(f"x_{i}", lowBound=0, cat=LpInteger) for i in range(n)]

    problem += lpSum(costs[i] * x[i] for i in range(n))

    for i in range(m):
        problem += lpSum(A[i][j] * x[j] for j in range(n)) == b[i], f"constr_eq_{i}"

    # řešení
    solver = PULP_CBC_CMD(msg=False)
    problem.solve(solver)

    # výpis
    print("Status:", problem.status)
    for i in range(n):
        print(f"x[{i}] =", x[i].value())
    print("Objective =", problem.objective.value())
    print()
    result += problem.objective.value()

print(result)
f.close()