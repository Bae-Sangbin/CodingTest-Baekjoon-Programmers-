def solution(num_list, n):
    return [num_list[idx*n:(idx+1)*n] for idx in range(len(num_list)//n)]