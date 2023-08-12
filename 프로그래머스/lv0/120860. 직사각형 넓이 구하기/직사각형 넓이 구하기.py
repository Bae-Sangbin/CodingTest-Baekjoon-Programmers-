def solution(dots):
    xs = [dot[0] for dot in dots]
    ys = [dot[1] for dot in dots]
    return (max(xs) - min(xs)) * (max(ys) - min(ys))